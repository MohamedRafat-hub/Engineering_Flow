import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_button.dart';
import 'back_sign_in_button.dart';

class AccountDisabledActions extends StatelessWidget {
  const AccountDisabledActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          label: 'Contact Administrator',
          leadingIcon: Icons.mail_outline,
          variant: AppButtonVariant.tonal,
          onPressed: () {}, // TODO(logic): contact administrator
        ),
        const SizedBox(height: 12),
         BackToSignInButton.filled(
          onPressed: (){
            context.go('/login');
          },
        ),
      ],
    );
  }
}