import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// A premium, standardized AppBar used across the YatraMitra application.
/// 
/// Features a signature gradient background, a saffron bottom accent line,
/// and consistent typography to maintain brand identity.
class YatraAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title text displayed in the center of the AppBar.
  final String title;

  /// Optional list of widgets to display in a row after the title.
  final List<Widget>? actions;

  /// Whether to show the back navigation button. Defaults to true.
  final bool showBackButton;

  /// Custom callback for the back button. If null, Navigator.pop is used.
  final VoidCallback? onBack;

  /// The height of the AppBar. Defaults to kToolbarHeight.
  final double height;

  const YatraAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBack,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
          fontSize: 18,
        ),
      ),
      actions: actions,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.blueDark, Color(0xFF1A3A6B)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                color: AppColors.saffron,
              ),
            ),
          ],
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
