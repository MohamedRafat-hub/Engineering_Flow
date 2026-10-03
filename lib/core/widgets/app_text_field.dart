import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.isRequired = false,
    this.optionalLabel,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool isRequired;
  final String? optionalLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: AppTextStyles.fieldLabel,
            children: [
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: AppColors.required),
                ),
              if (optionalLabel != null)
                TextSpan(
                  text: ' $optionalLabel',
                  style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
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
