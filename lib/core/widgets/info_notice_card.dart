import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Tinted card with an icon, optional title and a rich-text message.
class InfoNoticeCard extends StatelessWidget {
  const InfoNoticeCard({
    super.key,
    required this.icon,
    required this.message,
    this.title,
    this.iconColor = AppColors.primary,
    this.iconSize = 18,
    this.circledIcon = false,
    this.messageStyle = AppTextStyles.noticeBody,
    this.bordered = true,
    this.radius = 12,
  });

  final IconData icon;
  final InlineSpan message;
  final String? title;
  final Color iconColor;
  final double iconSize;

  /// Puts the icon inside a white circle.
  final bool circledIcon;
  final TextStyle messageStyle;
  final bool bordered;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.noticeBackground,
        borderRadius: BorderRadius.circular(radius),
        border: bordered ? Border.all(color: AppColors.noticeBorder) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: AppTextStyles.noticeTitle),
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

  Widget _buildIcon() {
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