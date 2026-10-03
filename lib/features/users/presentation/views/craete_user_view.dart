import 'package:engineering_flow/core/widgets/app_text_field.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/custom_app_bar.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/role_selector.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  int _selectedRoleIndex = 2; // Default: Employee
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create a new system account for your company directory.',
                      style: AppTextStyles.subtitle,
                    ),
                    const SizedBox(height: 16),

                    const AppTextField(
                      label: 'Full Name',
                      hintText: 'Enter full name',
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 18),

                    const AppTextField(
                      label: 'Email Address',
                      isRequired: true,
                      hintText: 'Enter email address',
                      prefixIcon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 18),

                    AppTextField(
                      label: 'Initial Password',
                      isRequired: true,
                      hintText: 'Enter initial password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: _isPasswordObscured,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordObscured
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.textHint,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordObscured = !_isPasswordObscured;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 18),

                    RoleSelector(
                      selectedIndex: _selectedRoleIndex,
                      onRoleSelected: (index) {
                        setState(() {
                          _selectedRoleIndex = index;
                        });
                      },
                    ),
                    const SizedBox(height: 12),


                    const AppTextField(
                      label: 'Job Title',
                      isRequired: true,
                      hintText: 'e.g. Site Engineer',
                      prefixIcon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 18),

                    const AppTextField(
                      label: 'Phone Number',
                      isRequired: false,
                      optionalLabel: '(Optional)',
                      hintText: 'Enter phone number',
                      prefixIcon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 18),

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






