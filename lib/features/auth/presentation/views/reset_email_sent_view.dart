import 'package:engineering_flow/features/auth/presentation/views/widgets/reset_email_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/forgot_password_app_bar.dart';

class ResetEmailSentView extends StatelessWidget {
  const ResetEmailSentView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: ForgotPasswordAppBar(
        hasLeading: false,
      ),
      body: SafeArea(child: ResetEmailSentViewBody(
        email: email,
      )),
    );
  }
}