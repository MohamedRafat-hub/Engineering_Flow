import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SpamFolderNoticeCard extends StatelessWidget {
  const SpamFolderNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.noticeBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.noticeBorder),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.shield_outlined,
              size: 16,
              color: AppColors.textHint,
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: _NoticeText()),
        ],
      ),
    );
  }
}

class _NoticeText extends StatelessWidget {
  const _NoticeText();

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        style: AppTextStyles.noticeBody,
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