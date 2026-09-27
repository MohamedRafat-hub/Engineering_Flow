import 'dart:developer';

import 'package:engineering_flow/core/theme/app_colors.dart';
import 'package:engineering_flow/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';

class ResendResetLinkSection extends StatelessWidget {
  const ResendResetLinkSection({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Didn't receive the email verification prompt?",
          textAlign: TextAlign.center,
          style: AppTextStyles.prompt,
        ),
        const SizedBox(height: 12),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isCooldown =
                state is ResendCooldownChanged && state.cooldown > 0;

            return AppButton(
              compact: true,
                expanded: false,
                variant: AppButtonVariant.accent,
                label: isCooldown
                ? 'Resend in ${state.cooldown}s'
                : 'Resend Email Link', onPressed: isCooldown
                ? null
                : () {
              log("Resent");
              context
                  .read<AuthCubit>()
                  .resendPasswordReset(email);
            });
          },
        )
      ],
    );
  }
}