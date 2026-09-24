import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ItSupportNoticeCard extends StatelessWidget {
  const ItSupportNoticeCard({super.key});

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
          _SupportIcon(),
          SizedBox(width: 12),
          Expanded(child: _SupportText()),
        ],
      ),
    );
  }
}

class _SupportIcon extends StatelessWidget {
  const _SupportIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.headset_mic_outlined,
        size: 18,
        color: AppColors.primary,
      ),
    );
  }
}

class _SupportText extends StatelessWidget {
  const _SupportText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Need urgent access?', style: AppTextStyles.noticeTitle),
        const SizedBox(height: 2),
        Text.rich(
          TextSpan(
            style: AppTextStyles.supportBody,
            children: const [
              TextSpan(text: 'Contact your internal '),
              TextSpan(text: 'IT department', style: AppTextStyles.supportLink),
              TextSpan(text: ' for direct authorization.'),
            ],
          ),
        ),
      ],
    );
  }
}