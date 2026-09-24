import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_button.dart';
import 'auth_card.dart';
import 'auth_text_filed.dart';
import 'email_hint_text.dart';

class ForgotPasswordFormCard extends StatelessWidget {
  const ForgotPasswordFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCard(
      child: Column(
        children: [
          const AuthTextField(
            label: 'Email',
            hintText: 'employee@company.com',
            prefixIcon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          const EmailHintText(),
          const SizedBox(height: 20),
          AppButton(
            label: 'Send Reset Link',
            trailingIcon: Icons.arrow_forward,
            onPressed: () {
              context.push('reset_email_sent');
            }, // TODO(logic): send reset link
          ),
        ],
      ),
    );
  }
}