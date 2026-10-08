import 'dart:developer';

import 'package:engineering_flow/core/utils/helper_functions/validate_email.dart';
import 'package:engineering_flow/core/utils/helper_functions/validate_password.dart';
import 'package:engineering_flow/features/users/domain/use_cases/create_user_account_use_case.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/role_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_text_field.dart' show AppTextField;
import '../../managers/user_cubit/user_cubit.dart';
import 'create_user_bloc_builder.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  bool _isPasswordObscured = true;
  int _selectedRoleIndex = 0;

  final globalKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final jobTitleController = TextEditingController();
  String? phoneNumber;

  List<String> roles = ['Admin', 'Manager', 'Employee'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          // name
          AppTextField(
            label: 'Full Name',
            hintText: 'Enter full name',
            isRequired: true,
            prefixIcon: Icons.person_outline,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            onSaved: (value) {
              nameController.text = value!;
            },
          ),
          const SizedBox(height: 18),

          //email
          AppTextField(
            label: 'Email Address',
            isRequired: true,
            hintText: 'Enter email address',
            prefixIcon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              String? validate = validateEmail(value);

              if (validate != null) {
                return validate;
              }
              return null;
            },
            onSaved: (value) {
              log("The email is $value");
              emailController.text = value!;
            },
          ),
          const SizedBox(height: 18),

          //password
          AppTextField(
            label: 'Initial Password',
            isRequired: true,
            hintText: 'Enter initial password',
            prefixIcon: Icons.lock_outline,
            obscureText: _isPasswordObscured,
            validator: (value) {
              String? validate = validatePassword(value);
              if (validate != null) {
                return validate;
              }
              return null;
            },
            onSaved: (value) {
              passwordController.text = value!;
            },
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordObscured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility,
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

          //job title
          AppTextField(
            label: 'Job Title',
            isRequired: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Job title is required';
              }
              return null;
            },
            hintText: 'e.g. Site Engineer',
            prefixIcon: Icons.badge_outlined,
            onSaved: (value) {
              jobTitleController.text = value!;
            },
          ),
          const SizedBox(height: 18),

          AppTextField(
            label: 'Phone Number',
            isRequired: false,
            optionalLabel: '(Optional)',
            hintText: 'Enter phone number',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,

            onSaved: (value) {
              phoneNumber = value;
            },
          ),
          const SizedBox(height: 18),

          BlocProvider(
            create: (context) =>
                UserCubit(getIt.get<CreateUserAccountUseCase>()),
            child: CreateUserBlocBuilder(
              globalKey: globalKey,
              selectedRoleIndex: _selectedRoleIndex,
              phoneNumber: phoneNumber,
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              jobTitleController: jobTitleController,
            ),
          ),
        ],
      ),
    );
  }
}
