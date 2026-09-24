import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';
import 'back_sign_in_button.dart';
import 'forget_password_form_card.dart';
import 'forget_password_header.dart';
import 'it_support_notice_card.dart';
class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScrollableCenteredBody(
      children: [
        ForgotPasswordHeader(),
        SizedBox(height: 24),
        ForgotPasswordFormCard(),
        SizedBox(height: 16),
        BackToSignInButton.link(
          onPressed: () {
            context.go('/login');
          },
        ),
        SizedBox(height: 16),
        ItSupportNoticeCard(),
      ],
    );
  }
}