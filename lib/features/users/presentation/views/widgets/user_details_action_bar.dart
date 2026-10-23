
import 'package:engineering_flow/core/utils/helper_functions/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import '../../managers/profile_cubit/profile_cubit.dart';

class UserDetailsActionBar extends StatelessWidget {
  const UserDetailsActionBar({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log out?'),
        content: const Text(
          'Are you sure you want to log out of EngineeringFlow?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true && context.mounted) {
      context.read<AuthCubit>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccess) {
          context.go('/login');
        }

        if (state is AuthLogoutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLogoutLoading;

        return DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(
              top: BorderSide(color: AppColors.noticeBorder),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Edit',
                      leadingIcon: Icons.edit_outlined,
                      onPressed: ()async {
                        final user = context.read<ProfileCubit>().state.user;

                        if (user == null) return;

                        final updated = await context.push<bool>(
                          '/edit_user_view',
                          extra: user,
                        );

                        if (!context.mounted || updated != true) return;

                        await context.read<ProfileCubit>().getCurrentUser();

                        if (!context.mounted) return;

                        showMessage(context, 'Profile updated Successfully', AppColors.success);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      label: isLoading ? 'Logging out...' : 'Logout',
                      leadingIcon: Icons.logout,
                      variant: AppButtonVariant.danger,
                      onPressed: isLoading
                          ? null
                          : () => _confirmLogout(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
