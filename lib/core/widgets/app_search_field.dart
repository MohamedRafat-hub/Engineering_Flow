import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

/// Search input used at the top of any list screen (Users, Projects...).
/// Relies on the app's global [InputDecorationTheme] for fill/border.
class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key, required this.hintText, this.onChanged});

  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged, // TODO(logic): wire up search filtering
      style: AppTextStyles.input,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}