import 'package:flutter/material.dart';

import 'auth_header.dart';
import 'email_sent_icon_badge.dart';

class ResetEmailSentHeader extends StatelessWidget {
  const ResetEmailSentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthHeader(
      leading: EmailSentIconBadge(),
      title: 'Check your email',
      subtitle:
      "We've sent a password reset link to your technical operations account.",
    );
  }
}