import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: true,
                onChanged: (_) {}, // TODO(logic): handle remember-me
              ),
            ),
            const SizedBox(width: 8),
            const Text('Keep signed in', style: AppTextStyles.checkboxLabel),
          ],
        ),
        AppTextButton(
          label: 'Forgot password?',
          dense: true,
          onPressed: () {
            context.push('/forgot-password');
          }, // TODO(logic): navigate to forgot password
        ),
      ],
    );
  }
}