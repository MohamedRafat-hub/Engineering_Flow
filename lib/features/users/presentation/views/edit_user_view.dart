import 'package:engineering_flow/core/theme/app_colors.dart';
import 'package:engineering_flow/core/utils/helper_functions/show_message.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/edit_user_action_bar.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/edit_user_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:engineering_flow/core/di/service_locator.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

import '../../../../core/widgets/main_app_bar.dart';
import '../managers/edit_profile_cubit/edit_profile_cubit.dart';

class EditUserView extends StatefulWidget {
  final UserEntity user;

  const EditUserView({
    super.key,
    required this.user,
  });

  @override
  State<EditUserView> createState() => _EditUserViewState();
}

class _EditUserViewState extends State<EditUserView> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _jobTitleController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.user.name);
    _jobTitleController =
        TextEditingController(text: widget.user.jobTitle);
    _phoneController =
        TextEditingController(text: widget.user.phoneNumber ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    await context.read<EditProfileCubit>().updateProfile(
      userId: widget.user.id,
      name: _nameController.text,
      jobTitle: _jobTitleController.text,
      phoneNumber: _phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditProfileCubit>(),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileFailure) {
            showMessage(context, state.message, AppColors.required);
          }

          if (state is EditProfileSuccess) {
            context.pop(true);
          }
        },
        child: Scaffold(
          appBar: MainAppBar(title: "User Details" , automaticallyImplyLeading: true,),
          body: EditUserViewBody(
            user: widget.user,
            formKey: _formKey,
            nameController: _nameController,
            jobTitleController: _jobTitleController,
            phoneController: _phoneController,
          ),
          bottomNavigationBar: EditUserActionBar(
            onSave: _saveProfile,
            onCancel: () => context.pop(false),
          ),
        ),
      ),
    );
  }
}