import 'dart:developer';

import 'package:engineering_flow/core/theme/app_colors.dart';
import 'package:engineering_flow/core/utils/helper_functions/show_message.dart';
import 'package:engineering_flow/features/users/domain/enums/user_role.dart';
import 'package:engineering_flow/features/users/domain/use_cases/create_user_account_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_button.dart';
import '../../../domain/entities/user_entity.dart';
import '../../managers/user_cubit/user_cubit.dart';

class CreateUserBlocBuilder extends StatelessWidget {
  const CreateUserBlocBuilder({
    super.key,
    required this.globalKey,
    required int selectedRoleIndex,
    required this.phoneNumber,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.jobTitleController,
  }) : _selectedRoleIndex = selectedRoleIndex;

  final GlobalKey<FormState> globalKey;
  final int _selectedRoleIndex;
  final String? phoneNumber;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController jobTitleController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.pop(context);
          showMessage(context, 'User created successfully', AppColors.primary);
        } else if (state is UserFailure) {
          log(state.message);
          showMessage(context, state.message, AppColors.required);
        }
      },
      builder: (context, state) {
        return state is UserLoading
            ? Center(child: const CircularProgressIndicator())
            : AppButton(
                label: 'Create user',
                onPressed: () {
                  if (!globalKey.currentState!.validate()) {
                    return;
                  }

                  globalKey.currentState!.save();

                  UserEntity createUserEntity = UserEntity(
                    name: nameController.text,
                    email: emailController.text,
                    role: _selectedRoleIndex == 0 ? UserRole.admin : _selectedRoleIndex == 1 ? UserRole.manager : UserRole.employee,
                    jobTitle: jobTitleController.text,
                    isActive: true,
                    phoneNumber: phoneNumber,
                    createdAt: DateTime.now(), id: '',
                  );

                  CreateUserAccountParams params = CreateUserAccountParams(
                    password: passwordController.text,
                    userEntity: createUserEntity,
                  );
                  context.read<UserCubit>().createUserAccount(params: params);
                },
              );
      },
    );
  }
}
