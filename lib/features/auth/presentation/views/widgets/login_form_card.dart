import 'package:engineering_flow/features/auth/domain/use_cases/password_reset_use_case.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/password_field.dart';
import 'package:engineering_flow/features/auth/presentation/views/widgets/remember_me_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/utils/helper_functions/validate_email.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import 'auth_card.dart';
import '../../../../../core/widgets/app_text_field.dart';
import 'login_button.dart';

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
    return AuthCard(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
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

            BlocProvider(
              create: (context) => AuthCubit(
                  getIt.get<LoginUseCase>(),
                  getIt.get<PasswordResetUseCase>()
              ),
              child: RememberMeRow(),
            ),

            const SizedBox(height: 20),

            BlocProvider(
              create: (context) =>
                  AuthCubit(
                      getIt.get<LoginUseCase>(),
                      getIt.get<PasswordResetUseCase>()
                  ),
              child: LoginButton(
                formKey: _formKey,
                getEmail: () => email,
                getPassword: () => password,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







