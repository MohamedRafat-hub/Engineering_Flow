import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/info_notice_card.dart';

class SpamFolderNoticeCard extends StatelessWidget {
  const SpamFolderNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoNoticeCard(
      icon: Icons.shield_outlined,
      iconColor: AppColors.textHint,
      iconSize: 16,
      message: TextSpan(
        children: [
          TextSpan(
            text: "If you still don't see the email, please inspect your "
                'spam filter or contact your ',
          ),
          TextSpan(
            text: 'IT Systems Administrator',
            style: AppTextStyles.noticeLink,
          ),
          TextSpan(text: ' for manual provisioning.'),
        ],
      ),
    );
  }
}