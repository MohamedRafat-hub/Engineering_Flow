import 'package:engineering_flow/features/auth/presentation/views/widgets/resend_reset_link_section.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/reset_email_sent_header.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/return_to_sign_in_button.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/sent_email_ship.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/spam_folder_notice_card.dart';
import 'package:flutter/material.dart';



class ResetEmailSentViewBody extends StatelessWidget {
  const ResetEmailSentViewBody({super.key});

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
              ResetEmailSentHeader(),
              SizedBox(height: 16),
              SentEmailChip(email: 'alex.chen@acme-eng.com'),
              SizedBox(height: 28),
              ReturnToSignInButton(),
              SizedBox(height: 24),
              ResendResetLinkSection(),
              SizedBox(height: 24),
              SpamFolderNoticeCard(),
            ],
          ),
        ),
      ),
    );
  }
}