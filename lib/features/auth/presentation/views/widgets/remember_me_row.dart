import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

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
        TextButton(
          onPressed: () {}, // TODO(logic): navigate to forgot password
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Forgot password?', style: AppTextStyles.link),
        ),
      ],
    );
  }
}