import 'package:engineering_flow/core/theme/app_colors.dart';
import 'package:engineering_flow/core/utils/helper_functions/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/helper_functions/validate_email.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import 'auth_card.dart';
import '../../../../../core/widgets/app_text_field.dart';
import 'email_hint_text.dart';

class ForgotPasswordFormCard extends StatelessWidget {
  ForgotPasswordFormCard({super.key});

  late String? email;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AuthCard(
        child: Column(
          children: [
            AppTextField(
              onSaved: (value) {
                email = value;
              },
              validator: validateEmail,
              label: 'Email',
              hintText: 'employee@company.com',
              prefixIcon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            const EmailHintText(),
            const SizedBox(height: 20),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if(state is AuthSuccess)
                  {
                    context.go('/reset_email_sent' , extra: email
                    );
                  }else if(state is AuthFailure)
                    {
                      showMessage(context, state.message, Colors.red);
                    }
              },
              builder: (context, state) {
                return state is AuthLoading ? CircularProgressIndicator() : AppButton(
                  label: 'Send Reset Link',
                  trailingIcon: Icons.arrow_forward,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<AuthCubit>().passwordReset(email!);
                    }
                  }, // TODO(logic): send reset link
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}