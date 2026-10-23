import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_button.dart';
import '../../managers/edit_profile_cubit/edit_profile_cubit.dart';

class EditUserActionBar extends StatelessWidget {
  final ValueChanged<BuildContext> onSave;
  final VoidCallback onCancel;

  const EditUserActionBar({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Cancel',
                variant: AppButtonVariant.tonal,
                onPressed: onCancel,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  final isLoading = state is EditProfileLoading;

                  return AppButton(
                    label: isLoading ? 'Saving...' : 'Save Changes',
                    leadingIcon:
                    isLoading ? null : Icons.save_outlined,
                    onPressed:
                    isLoading ? null : () => onSave(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}