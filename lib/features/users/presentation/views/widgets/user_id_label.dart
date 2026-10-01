import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class UserIdLabel extends StatelessWidget {
  const UserIdLabel({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Text('ID $id', style: AppTextStyles.supportBody);
  }
}