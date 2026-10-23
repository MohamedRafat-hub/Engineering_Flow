import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import 'required_label.dart';

/// Labeled text input used by every form in the app (auth, Create User,
/// Edit User, etc.): a [RequiredLabel] above a field with a leading icon.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.requirement = FieldRequirement.required,
    this.optionalLabel = '(Optional)',
    this.initialValue,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FieldRequirement requirement;

  /// Text shown inline after the label when [requirement] is
  /// [FieldRequirement.optional].
  final String optionalLabel;

  /// Static pre-filled text for a read/edit mockup — no controller needed.
  /// Ignored when [controller] is provided (Flutter disallows both).
  final String? initialValue;

  /// Standard [TextFormField] passthroughs. The widget stays presentation
  /// -only: it carries no validation rules itself, it just forwards
  /// whatever the caller's own `Form`/logic layer supplies.
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredLabel(label: label, requirement: requirement, optionalLabel: optionalLabel),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
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