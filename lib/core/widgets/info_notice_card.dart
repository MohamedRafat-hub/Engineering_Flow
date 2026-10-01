import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Tinted card with an icon (or a custom [leading] widget), an optional
/// title and a rich-text message. Used for every callout/notice box in
/// the app; colors are all overridable so it also covers on-dark variants.
class InfoNoticeCard extends StatelessWidget {
  const InfoNoticeCard({
    super.key,
    this.icon,
    required this.message,
    this.title,
    this.leading,
    this.iconColor = AppColors.primary,
    this.iconSize = 18,
    this.circledIcon = false,
    this.messageStyle = AppTextStyles.noticeBody,
    this.titleStyle = AppTextStyles.noticeTitle,
    this.backgroundColor = AppColors.noticeBackground,
    this.bordered = true,
    this.radius = 12,
  }) : assert(icon != null || leading != null, 'Provide icon or leading');

  final IconData? icon;
  final InlineSpan message;
  final String? title;

  /// Overrides the default icon container entirely (e.g. an [IconChip]).
  final Widget? leading;

  final Color iconColor;
  final double iconSize;

  /// Puts the icon inside a white circle. Ignored when [leading] is set.
  final bool circledIcon;
  final TextStyle messageStyle;
  final TextStyle titleStyle;
  final Color backgroundColor;
  final bool bordered;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: bordered ? Border.all(color: AppColors.noticeBorder) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeading(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: titleStyle),
                  const SizedBox(height: 4),
                ],
                Text.rich(TextSpan(style: messageStyle, children: [message])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    if (leading != null) return leading!;

    final iconWidget = Icon(icon, size: iconSize, color: iconColor);

    if (circledIcon) {
      return Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
        ),
        child: iconWidget,
      );
    }
    return Padding(padding: const EdgeInsets.only(top: 2), child: iconWidget);
  }
}