import 'package:engineering_flow/features/auth/presentation/views/widgets/reset_email_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/forgot_password_app_bar.dart';

class ResetEmailSentView extends StatelessWidget {
  const ResetEmailSentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ForgotPasswordAppBar(),
      body: SafeArea(child: ResetEmailSentViewBody()),
    );
  }
}