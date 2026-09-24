import 'package:engineering_flow/features/auth/presentation/views/widgets/resend_reset_link_section.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/reset_email_sent_header.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/sent_email_ship.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/spam_folder_notice_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/scrollable_centered_body.dart';
import 'back_sign_in_button.dart';


class ResetEmailSentViewBody extends StatelessWidget {
  const ResetEmailSentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScrollableCenteredBody(
      children: [
        ResetEmailSentHeader(),
        SizedBox(height: 16),
        SentEmailChip(email: 'alex.chen@acme-eng.com'),
        SizedBox(height: 28),
        BackToSignInButton.filledWithLoginIcon(
          onPressed: (){
            context.go('/login');
          },
        ),
        SizedBox(height: 24),
        ResendResetLinkSection(),
        SizedBox(height: 24),
        SpamFolderNoticeCard(),
      ],
    );
  }
}