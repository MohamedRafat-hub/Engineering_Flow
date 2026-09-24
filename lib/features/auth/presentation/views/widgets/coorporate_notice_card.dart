import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CorporateNoticeCard extends StatelessWidget {
  const CorporateNoticeCard({super.key});

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
          Icon(Icons.verified_user_outlined, size: 20, color: AppColors.primary),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Internal Corporate System',
                  style: AppTextStyles.noticeTitle,
                ),
                SizedBox(height: 4),
                Text(
                  'Operator credentials are automatically managed by IT '
                      'Systems. Need provisioning? Contact your administrator.',
                  style: AppTextStyles.noticeBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}