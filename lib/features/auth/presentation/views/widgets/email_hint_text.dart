import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class EmailHintText extends StatelessWidget {
  const EmailHintText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1),
          child: Icon(Icons.info_outline, size: 14, color: AppColors.textHint),
        ),
        SizedBox(width: 6),
        Expanded(
          child: Text(
            'Must be your registered company organization email.',
            style: AppTextStyles.helper,
          ),
        ),
      ],
    );
  }
}