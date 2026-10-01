import 'package:engineering_flow/features/admin_workflow/presentation/views/widgets/recent_activity_card.dart';
import 'package:engineering_flow/features/admin_workflow/presentation/views/widgets/role_governence_notice.dart';
import 'package:engineering_flow/features/admin_workflow/presentation/views/widgets/welcome_banner_card.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/scrollable_centered_body.dart';
import 'dashboard_status_row.dart';
import 'directory_by_role_card.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableCenteredBody(
      children: [
        const WelcomeBannerCard(
          organizationName: 'Acme Engineering Corp',
          userFirstName: 'Mohamed',
          subtitle: "Here's what's happening in your company",
        ),
        const SizedBox(height: 20),
        const DashboardStatsRow(),
        const SizedBox(height: 20),
        DirectoryByRoleCard(),
        const SizedBox(height: 20),
        RoleGovernanceNotice(),
        const SizedBox(height: 20),
        RecentActivityCard(),
      ],
    );
  }
}