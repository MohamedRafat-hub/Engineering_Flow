import 'package:flutter/material.dart';

import '../../../../../core/utils/helper_functions/validate_password.dart';
import 'auth_text_filed.dart';

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