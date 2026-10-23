
import 'package:engineering_flow/features/users/presentation/views/widgets/system_account_card.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_details_header.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper_functions/get_first_two_characters.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';
import '../../managers/profile_cubit/profile_cubit.dart';
import '../../managers/profile_cubit/profile_state.dart';
import 'contact_information_card.dart';

class UserDetailsViewBody extends StatelessWidget {
  const UserDetailsViewBody({super.key});

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  String _formatRole(String role) {
    return role[0].toUpperCase() + role.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.status == ProfileStatus.initial ||
            state.status == ProfileStatus.loading) {
          return const UserDetailsShimmer();
        }

        if (state.status == ProfileStatus.failure) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.errorMessage ?? 'Failed to load profile.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProfileCubit>().getCurrentUser();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final user = state.user;

        if (user == null) {
          return const Center(
            child: Text('User profile not found.'),
          );
        }

        final role = _formatRole(user.role.name);

        return ScrollableCenteredBody(
          children: [
            UserDetailsHeader(
              initials: getInitials(user.name),
              name: user.name,
              jobTitle: user.jobTitle,
              roleLabel: role,
              isActive: user.isActive,
            ),
            const SizedBox(height: 20),
            ContactInformationCard(
              workEmail: user.email,
              mobilePhone: user.phoneNumber?.trim().isNotEmpty == true
                  ? user.phoneNumber!
                  : 'Not provided',
            ),
            const SizedBox(height: 16),
            SystemAccountCard(
              accountStatus: user.isActive ? 'Active' : 'Disabled',
              createdDate: _formatDate(user.createdAt),
              systemRole: role,
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
