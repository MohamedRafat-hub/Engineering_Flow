import 'package:engineering_flow/features/auth/presentation/views/widgets/resend_reset_link_section.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/reset_email_sent_header.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/sent_email_ship.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/spam_folder_notice_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/password_reset_use_case.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import 'back_sign_in_button.dart';


class ResetEmailSentViewBody extends StatelessWidget {
  const ResetEmailSentViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ScrollableCenteredBody(
      children: [
        ResetEmailSentHeader(),
        SizedBox(height: 16),
        SentEmailChip(email: email),
        SizedBox(height: 28),
        BackToSignInButton.filledWithLoginIcon(
          onPressed: () {
            context.go('/login');
          },
        ),
        SizedBox(height: 24),
        BlocProvider(
          create: (context) => AuthCubit(getIt.get<LoginUseCase>(), getIt.get<PasswordResetUseCase>()),
          child: ResendResetLinkSection(
            email: email,
          ),
        ),
        SizedBox(height: 24),
        SpamFolderNoticeCard(),
      ],
    );
  }
}