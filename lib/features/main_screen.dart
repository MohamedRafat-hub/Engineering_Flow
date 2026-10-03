import 'package:engineering_flow/core/widgets/app_bottom_nav_bar.dart';
import 'package:engineering_flow/features/users/presentation/views/users_view.dart';
import 'package:flutter/material.dart';

import 'dashboard/presentation/views/dashboard_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  List<Widget> screens = [
    DashboardView(),
    UsersView(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: AppBottomNavBar(currentIndex: currentIndex , onTap: (value){
        setState(() {
          currentIndex = value;
        });
      },),
    );
  }
}
