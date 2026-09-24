import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum AppButtonVariant { primary, tonal, accent }

/// General-purpose button used across the whole app.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.leadingIcon,
    this.trailingIcon,
    this.expanded = true,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  /// Fills the available width when true.
  final bool expanded;

  /// Smaller height / text for secondary actions.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final double iconSize = compact ? 16 : 18;

    final button = ElevatedButton(
      onPressed: onPressed,
      style: _buildStyle(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: iconSize),
            const SizedBox(width: 8),
          ],
          Text(label),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            Icon(trailingIcon, size: iconSize),
          ],
        ],
      ),
    );

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }

  ButtonStyle _buildStyle() {
    final ButtonStyle base = switch (variant) {
      AppButtonVariant.primary => ElevatedButton.styleFrom(),
      AppButtonVariant.tonal => ElevatedButton.styleFrom(
        backgroundColor: AppColors.badgeBackground,
        foregroundColor: AppColors.primary,
      ),
      AppButtonVariant.accent => ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
      ),
    };

    if (!compact) return base;

    return base.merge(
      ElevatedButton.styleFrom(
        minimumSize: const Size(0, 40),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        textStyle: AppTextStyles.resendButton,
      ),
    );
  }
}