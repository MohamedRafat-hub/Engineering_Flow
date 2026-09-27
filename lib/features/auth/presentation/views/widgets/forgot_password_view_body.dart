import 'package:engineering_flow/core/di/service_locator.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/password_reset_use_case.dart';
import 'package:engineering_flow/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'back_sign_in_button.dart';
import 'forget_password_form_card.dart';
import 'forget_password_header.dart';
import 'it_support_notice_card.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableCenteredBody(
      children: [
        ForgotPasswordHeader(),
        SizedBox(height: 24),
        BlocProvider(
          create: (context) => AuthCubit(getIt.get<LoginUseCase>(), getIt.get<PasswordResetUseCase>()),
          child: ForgotPasswordFormCard(),
        ),
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