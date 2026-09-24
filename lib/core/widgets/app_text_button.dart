import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

/// General-purpose text/link button used across the whole app.
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.textStyle = AppTextStyles.link,
    this.dense = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final TextStyle textStyle;

  /// Removes padding and tap-target padding (for inline links).
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textStyle.color,
        padding: dense
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        minimumSize: dense ? Size.zero : null,
        tapTargetSize: dense ? MaterialTapTargetSize.shrinkWrap : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 18),
            const SizedBox(width: 8),
          ],
          Text(label, style: textStyle),
        ],
      ),
    );
  }
}