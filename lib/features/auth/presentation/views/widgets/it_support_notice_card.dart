import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/info_notice_card.dart';

class ItSupportNoticeCard extends StatelessWidget {
  const ItSupportNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoNoticeCard(
      icon: Icons.headset_mic_outlined,
      circledIcon: true,
      title: 'Need urgent access?',
      messageStyle: AppTextStyles.supportBody,
      message: TextSpan(
        children: [
          TextSpan(text: 'Contact your internal '),
          TextSpan(text: 'IT department', style: AppTextStyles.supportLink),
          TextSpan(text: ' for direct authorization.'),
        ],
      ),
    );
  }
}