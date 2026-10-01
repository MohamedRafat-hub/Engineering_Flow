import 'package:engineering_flow/features/users/presentation/views/widgets/role_badge.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_id_label.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_list_tile.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_page_header.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_status_filter_row.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/workspace_owner_label.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/you_yag.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_search_field.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';
import '../../../../../core/widgets/user_status_pill.dart';
import 'enable_user_action.dart';



class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableCenteredBody(
      children: [
        const UsersPageHeader(),
        const SizedBox(height: 20),
        const AppSearchField(hintText: 'Search users by name, role or email...'),
        const SizedBox(height: 16),
        const UserStatusFilterRow(),
        const SizedBox(height: 20),
        const UserListTile(
          initials: 'AM',
          avatarBackgroundColor: AppColors.badgeBackground,
          avatarTextColor: AppColors.primary,
          name: 'Ahmed Mohamed',
          roleTitle: 'Project Manager',
          email: 'ahmed@example.com',
          role: UserRole.manager,
          status: UserAccountStatus.active,
          trailing: UserIdLabel(id: '#EF-0192'),
        ),
        const SizedBox(height: 16),
        const UserListTile(
          initials: 'MA',
          avatarBackgroundColor: AppColors.badgeBackground,
          avatarTextColor: AppColors.primary,
          name: 'Mohamed Ali',
          roleTitle: 'Site Engineer',
          email: 'mohamed@example.com',
          role: UserRole.employee,
          status: UserAccountStatus.active,
          trailing: UserIdLabel(id: '#EF-0418'),
        ),
        const SizedBox(height: 16),
        const UserListTile(
          initials: 'OH',
          avatarBackgroundColor: AppColors.tagBackground,
          avatarTextColor: AppColors.textSecondary,
          name: 'Omar Hassan',
          roleTitle: 'Structural Engineer',
          email: 'omar@example.com',
          role: UserRole.employee,
          status: UserAccountStatus.disabled,
          trailing: EnableUserAction(),
        ),
        const SizedBox(height: 16),
        const UserListTile(
          initials: 'SJ',
          avatarBackgroundColor: AppColors.primary,
          avatarTextColor: Colors.white,
          name: 'Sarah Jenkins',
          roleTitle: 'Lead Systems Architect',
          email: 'sarah.j@example.com',
          role: UserRole.admin,
          status: UserAccountStatus.active,
          tag: YouTag(),
          trailing: WorkspaceOwnerLabel(),
        ),
        const SizedBox(height: 16),
        const UserListTile(
          initials: 'TM',
          avatarBackgroundColor: AppColors.badgeBackground,
          avatarTextColor: AppColors.primary,
          name: 'Tariq Mansour',
          roleTitle: 'Field Safety Officer',
          email: 'tariq@example.com',
          role: UserRole.employee,
          status: UserAccountStatus.active,
          trailing: UserIdLabel(id: '#EF-0891'),
        ),
      ],
    );
  }
}