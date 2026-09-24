import 'package:flutter/material.dart';

import 'widgets/forgot_password_app_bar.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ForgotPasswordAppBar(),
      body: SafeArea(child: ForgotPasswordViewBody()),
    );
  }
}