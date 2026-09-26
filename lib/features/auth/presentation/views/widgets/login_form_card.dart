import 'package:engineering_flow/features/auth/presentation/views/widgets/remember_me_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/helper_functions/show_message.dart';
import '../../../../../core/utils/helper_functions/validate_email.dart';
import '../../../../../core/utils/helper_functions/validate_password.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import 'auth_card.dart';
import 'auth_text_filed.dart';

class LoginFormCard extends StatefulWidget {
  const LoginFormCard({super.key});

  @override
  State<LoginFormCard> createState() => _LoginFormCardState();
}

class _LoginFormCardState extends State<LoginFormCard> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        AuthInitial(),
        getIt.get<LoginUseCase>(),
      ),
      child: AuthCard(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthTextField(
                validator: validateEmail,
                onSaved: (value) => email = value,
                label: 'Email',
                hintText: 'engineer@company.com',
                prefixIcon: Icons.alternate_email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              PasswordField(
                onSaved: (value) => password = value,
              ),

              const SizedBox(height: 14),

              const RememberMeRow(),

              const SizedBox(height: 20),

              LoginButton(
                formKey: _formKey,
                getEmail: () => email,
                getPassword: () => password,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.onSaved,
  });

  final FormFieldSetter<String> onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      validator: validatePassword,
      onSaved: widget.onSaved,
      label: 'Password',
      hintText: '••••••••••••',
      prefixIcon: Icons.lock_outline,
      obscureText: hidePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        icon: Icon(
          hidePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20,
        ),
      ),
    );
  }
}



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