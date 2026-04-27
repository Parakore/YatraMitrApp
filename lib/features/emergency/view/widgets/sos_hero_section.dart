import 'package:flutter/material.dart';
import 'package:yatramitra/core/theme/app_colors.dart';

class SosHeroSection extends StatelessWidget {
  final bool isSosActive;
  final String? lastLocation;
  final double sosProgress;
  final VoidCallback onSosHoldStart;
  final VoidCallback onSosHoldEnd;
  final VoidCallback onCancel;

  const SosHeroSection({
    super.key,
    required this.isSosActive,
    this.lastLocation,
    required this.sosProgress,
    required this.onSosHoldStart,
    required this.onSosHoldEnd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.secondary,
            AppColors.secondary.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          _buildSosButton(),
          const SizedBox(height: 24),
          if (isSosActive) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on,
                      color: AppColors.primary, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    lastLocation ?? 'Fetching location...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: onCancel,
              icon: const Icon(Icons.close, color: Colors.white70, size: 18),
              label: const Text(
                'CANCEL SOS SIGNAL',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  fontSize: 12,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ] else ...[
            const Text(
              'PRESS AND HOLD FOR 3 SECONDS',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Automatic Dispatch to SDRF & Medical Units',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSosButton() {
    return GestureDetector(
      onLongPressStart: (_) => onSosHoldStart(),
      onLongPressEnd: (_) => onSosHoldEnd(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Glow
          if (isSosActive)
            _AnimatedPulse(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
            ),

          // Progress Ring (Glassmorphism)
          SizedBox(
            width: 155,
            height: 155,
            child: CircularProgressIndicator(
              value: sosProgress,
              strokeWidth: 10,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),

          // Main Button
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSosActive ? AppColors.primary : AppColors.saffron,
              boxShadow: [
                BoxShadow(
                  color: (isSosActive ? AppColors.primary : AppColors.saffron)
                      .withOpacity(0.4),
                  blurRadius: 25,
                  spreadRadius: 5,
                ),
              ],
              gradient: RadialGradient(
                colors: [
                  isSosActive ? AppColors.primary : AppColors.saffron,
                  isSosActive
                      ? const Color(0xFFD32F2F)
                      : const Color(0xFFFF4D00),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isSosActive ? Icons.wifi_tethering : Icons.sos,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isSosActive ? 'ACTIVE' : 'SOS',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedPulse extends StatefulWidget {
  final Widget child;
  const _AnimatedPulse({required this.child});

  @override
  State<_AnimatedPulse> createState() => _AnimatedPulseState();
}

class _AnimatedPulseState extends State<_AnimatedPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
