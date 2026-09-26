import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/helper_functions/show_message.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.getEmail,
    required this.getPassword,
  });

  final GlobalKey<FormState> formKey;
  final String? Function() getEmail;
  final String? Function() getPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showMessage(
            context,
            'Login success',
            AppColors.primary,
          );
        } else if (state is AuthFailure) {
          showMessage(
            context,
            state.message,
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ElevatedButton(
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }

            formKey.currentState!.save();

            context.read<AuthCubit>().login(
              LoginParams(
                email: getEmail()!,
                password: getPassword()!,
              ),
            );
          },
          child: const Text('Login'),
        );
      },
    );
  }
}