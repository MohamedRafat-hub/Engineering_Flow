import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum AppButtonVariant { primary, tonal, accent, outline }

enum AppButtonShape { rectangle, stadium }

/// General-purpose button used across the whole app.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.shape = AppButtonShape.rectangle,
    this.leadingIcon,
    this.leadingIconWidget,
    this.trailingIcon,
    this.trailingIconWidget,
    this.expanded = true,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonShape shape;

  /// Either an [IconData] or a prebuilt widget (e.g. an SVG) can be used
  /// as the leading/trailing visual; the widget takes precedence.
  final IconData? leadingIcon;
  final Widget? leadingIconWidget;
  final IconData? trailingIcon;
  final Widget? trailingIconWidget;

  /// Fills the available width when true.
  final bool expanded;

  /// Smaller height / text, used for secondary or inline actions.
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
          if (_leading(iconSize) != null) ...[
            _leading(iconSize)!,
            const SizedBox(width: 8),
          ],
          Text(label),
          if (_trailing(iconSize) != null) ...[
            const SizedBox(width: 8),
            _trailing(iconSize)!,
          ],
        ],
      ),
    );

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }

  Widget? _leading(double size) {
    return leadingIconWidget ??
        (leadingIcon != null ? Icon(leadingIcon, size: size) : null);
  }

  Widget? _trailing(double size) {
    return trailingIconWidget ??
        (trailingIcon != null ? Icon(trailingIcon, size: size) : null);
  }

  ButtonStyle _buildStyle() {
    ButtonStyle style = switch (variant) {
      AppButtonVariant.primary =>
          ElevatedButton.styleFrom(minimumSize: const Size(64, 48)),
      AppButtonVariant.tonal => ElevatedButton.styleFrom(
        backgroundColor: AppColors.badgeBackground,
        foregroundColor: AppColors.primary,
        minimumSize: const Size(64, 48),
      ),
      AppButtonVariant.accent => ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        minimumSize: const Size(64, 48),
      ),
      AppButtonVariant.outline => ElevatedButton.styleFrom(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.noticeBorder),
        minimumSize: const Size(64, 48),
      ),
    };

    if (compact) {
      style = style.merge(
        ElevatedButton.styleFrom(
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          textStyle: AppTextStyles.resendButton,
        ),
      );
    }

    if (shape == AppButtonShape.stadium) {
      style = style.merge(
        ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(0, 44),
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
      );
    }

    return style;
  }
}