import 'package:engineering_flow/features/users/presentation/views/widgets/create_user_form.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  // Default: Employee

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create a new system account for your company directory.',
                      style: AppTextStyles.subtitle,
                    ),
                    const SizedBox(height: 16),

                    CreateUserForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




