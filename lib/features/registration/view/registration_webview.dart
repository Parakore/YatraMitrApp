import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';

/// Embedded WebView for the official Uttarakhand Yatra Registration portal.
class RegistrationWebView extends StatefulWidget {
  const RegistrationWebView({super.key});

  @override
  State<RegistrationWebView> createState() => _RegistrationWebViewState();
}

class _RegistrationWebViewState extends State<RegistrationWebView> {
  WebViewController? _controller; // Changed from late
  bool _isLoading = true;
  double _progress = 0;
  bool _isSupported = true;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _isSupported = false;
      _isLoading = false;
      return;
    }
    try {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(AppColors.background)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              if (mounted) {
                setState(() {
                  _progress = progress / 100;
                });
              }
            },
            onPageStarted: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = true;
                });
              }
            },
            onPageFinished: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            onWebResourceError: (WebResourceError error) {
              debugPrint('WebView Error: ${error.description}');
            },
          ),
        )
        ..loadRequest(Uri.parse('https://registrationandtouristcare.uk.gov.in/'));
    } catch (e) {
      debugPrint('Error initializing WebView: $e');
      _isSupported = false;
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Official Portal'),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => _controller?.reload(),
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser_rounded),
            onPressed: _openInBrowser,
          ),
        ],
      ),
      body: !_isSupported ? _buildWebFallback() : Stack(
        children: [
          if (_controller != null) WebViewWidget(controller: _controller!),
          if (_isLoading)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: _progress > 0 ? _progress : null,
                backgroundColor: AppColors.divider,
                color: AppColors.secondary,
                minHeight: 3,
              ),
            ),
          if (_isLoading && _progress == 0)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      bottomNavigationBar: _isSupported ? _buildNavigationControls() : null,
    );
  }

  void _openInBrowser() async {
    final url = Uri.parse('https://registrationandtouristcare.uk.gov.in/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildWebFallback() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.language_rounded, size: 80, color: AppColors.secondary),
            const SizedBox(height: 24),
            const Text(
              'Official Registration Portal',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'For security reasons, the government portal must be opened in a separate browser tab on Web.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _openInBrowser,
              icon: const Icon(Icons.open_in_new_rounded),
              label: const Text('Open Official Portal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationControls() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () async {
              if (_controller != null && await _controller!.canGoBack()) {
                await _controller!.goBack();
              } else {
                if (mounted) Navigator.pop(context);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () async {
              if (_controller != null && await _controller!.canGoForward()) {
                await _controller!.goForward();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.home_rounded),
            onPressed: () => _controller?.loadRequest(
              Uri.parse('https://registrationandtouristcare.uk.gov.in/'),
            ),
          ),
        ],
      ),
    );
  }
}
