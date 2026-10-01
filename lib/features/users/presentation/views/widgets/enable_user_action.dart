import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class EnableUserAction extends StatelessWidget {
  const EnableUserAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      label: 'Enable User',
      leadingIcon: Icons.lock_outline,
      textStyle: AppTextStyles.link,
      dense: true,
      onPressed: () {}, // TODO(logic): enable this user
    );
  }
}