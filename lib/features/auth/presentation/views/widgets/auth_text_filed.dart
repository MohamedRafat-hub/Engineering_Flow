import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType, this.onSaved, this.validator,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final  String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: AppTextStyles.fieldLabel,
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: AppColors.required),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: validator,
          maxLines: 1,
          onSaved: onSaved,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon, size: 20),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}