import 'package:flutter/material.dart';

import 'auth_card.dart';
import 'auth_text_filed.dart';
import 'email_hint_text.dart';
import 'send_reset_link_button.dart';

class ForgotPasswordFormCard extends StatelessWidget {
  const ForgotPasswordFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthCard(
      child: Column(
        children: [
          AuthTextField(
            label: 'Email',
            hintText: 'employee@company.com',
            prefixIcon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10),
          EmailHintText(),
          SizedBox(height: 20),
          SendResetLinkButton(),
        ],
      ),
    );
  }
}