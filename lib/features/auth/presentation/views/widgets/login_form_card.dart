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
import 'auth_text_filed.dart';
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
    return BlocProvider(
      create: (_) => AuthCubit(
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







