import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_button.dart';
import 'auth_card.dart';
import 'auth_text_filed.dart';
import 'remember_me_row.dart';

class LoginFormCard extends StatelessWidget {
  const LoginFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCard(
      child: Column(
        children: [
          const AuthTextField(
            label: 'Email',
            hintText: 'engineer@company.com',
            prefixIcon: Icons.alternate_email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          AuthTextField(
            label: 'Password',
            hintText: '••••••••••••',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {}, // TODO(logic): toggle password visibility
              icon: const Icon(Icons.visibility_outlined, size: 20),
            ),
          ),
          const SizedBox(height: 14),
          const RememberMeRow(),
          const SizedBox(height: 20),
          AppButton(
            label: 'Sign In',
            trailingIcon: Icons.arrow_forward,
            onPressed: () {
            }, // TODO(logic): submit login
          ),
        ],
      ),
    );
  }
}