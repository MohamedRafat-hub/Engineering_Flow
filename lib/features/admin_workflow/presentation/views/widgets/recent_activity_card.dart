import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';
import 'manage_users_link.dart';
import 'recent_activity_header.dart';
import 'user_activity_tile.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecentActivityHeader(),
          const SizedBox(height: 14),
          const UserActivityTile(
            initials: 'AM',
            name: 'Ahmed Mohamed',
            role: 'Project Manager',
            tier: 'Manager',
            status: UserActivityStatus.active,
          ),
          const SizedBox(height: 10),
          const UserActivityTile(
            initials: 'MA',
            name: 'Mohamed Ali',
            role: 'Site Engineer',
            tier: 'Employee',
            status: UserActivityStatus.active,
          ),
          const SizedBox(height: 10),
          const UserActivityTile(
            initials: 'OH',
            name: 'Omar Hassan',
            role: 'Structural Engineer',
            tier: 'Employee',
            status: UserActivityStatus.disabled,
          ),
          const SizedBox(height: 14),
          const ManageUsersLink(),
        ],
      ),
    );
  }
}