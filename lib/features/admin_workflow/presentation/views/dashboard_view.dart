import 'package:engineering_flow/features/admin_workflow/presentation/views/widgets/dashboard_app_bar.dart';
import 'package:engineering_flow/features/admin_workflow/presentation/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bottom_nav_bar.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DashboardAppBar(),
      body: SafeArea(child: DashboardViewBody()),
      bottomNavigationBar: AppBottomNavBar(currentIndex: 0),
    );
  }
}