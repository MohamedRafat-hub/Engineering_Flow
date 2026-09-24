import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/info_notice_card.dart';

class SuspensionInfoBox extends StatelessWidget {
  const SuspensionInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoNoticeCard(
      icon: Icons.info_outline,
      iconColor: AppColors.link,
      iconSize: 16,
      bordered: false,
      radius: 8,
      messageStyle: AppTextStyles.supportBody,
      message: TextSpan(
        text: 'No password reset or authentication attempts can be '
            'performed while an account is suspended. Reach out to your '
            'internal IT or HR administrator to restore system access.',
      ),
    );
  }
}