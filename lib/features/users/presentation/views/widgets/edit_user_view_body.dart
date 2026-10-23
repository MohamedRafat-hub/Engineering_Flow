import 'package:flutter/material.dart';

import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

import '../../../../../core/widgets/app_text_field.dart';
import 'account_sso_card.dart';
import 'edit_user_summary_card.dart';

// Import your existing AppTextField and UI widgets here.

class EditUserViewBody extends StatelessWidget {
  final UserEntity user;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController jobTitleController;
  final TextEditingController phoneController;

  const EditUserViewBody({
    super.key,
    required this.user,
    required this.formKey,
    required this.nameController,
    required this.jobTitleController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EditUserSummaryCard(
              initials: _getInitials(user.name),
              name: user.name,
              role: user.role,
            ),

            const SizedBox(height: 32),

            Text(
              'Personal Information',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 20),

            AppTextField(
              label: 'Full Name',
              hintText: 'Enter your full name',
              prefixIcon: Icons.person_outline,
              controller: nameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required.';
                }

                if (value.trim().length < 2) {
                  return 'Name must be at least 2 characters.';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            AppTextField(
              label: 'Job Title',
              hintText: 'Enter your job title',
              prefixIcon: Icons.work_outline,
              controller: jobTitleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Job title is required.';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            AppTextField(
              label: 'Phone Number',
              hintText: 'Enter your phone number',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              controller: phoneController,
            ),

            const SizedBox(height: 32),

            AccountSsoCard(
              corporateEmail: user.email,
              accessScope: _formatRole(user.role.name),
              accountState: user.isActive ? 'Active' : 'Disabled',
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final trimmedName = name.trim();

    if (trimmedName.isEmpty) return 'U';

    final parts = trimmedName.split(RegExp(r'\s+'));

    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  String _formatRole(String role) {
    return role.isEmpty
        ? 'Unknown'
        : '${role[0].toUpperCase()}${role.substring(1)}';
  }
}