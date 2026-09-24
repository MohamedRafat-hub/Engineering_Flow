import 'package:flutter/material.dart';

import 'back_sign_in_button.dart';
import 'forget_password_form_card.dart';
import 'forget_password_header.dart';
import 'it_support_notice_card.dart';



class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ForgotPasswordHeader(),
              SizedBox(height: 24),
              ForgotPasswordFormCard(),
              SizedBox(height: 16),
              BackToSignInButton(),
              SizedBox(height: 16),
              ItSupportNoticeCard(),
            ],
          ),
        ),
      ),
    );
  }
}