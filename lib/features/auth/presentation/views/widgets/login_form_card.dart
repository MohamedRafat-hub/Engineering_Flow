import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import 'auth_text_filed.dart';
import 'remember_me_row.dart';
import 'sign_in_button.dart';

class LoginFormCard extends StatelessWidget {
  const LoginFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F1E3A8A),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
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
          const SignInButton(),
        ],
      ),
    );
  }
}