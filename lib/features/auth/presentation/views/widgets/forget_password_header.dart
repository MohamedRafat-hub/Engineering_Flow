import 'package:flutter/material.dart';

import 'auth_header.dart';
import 'key_icon_bage.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthHeader(
      leading: KeyIconBadge(),
      title: 'Forgot password?',
      subtitle:
      "Enter your email address and we'll send you a password reset link.",
    );
  }
}