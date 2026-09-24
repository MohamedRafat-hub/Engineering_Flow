import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/views/login_view.dart';

void main() {
  runApp(const EngineeringFlowApp());
}

class EngineeringFlowApp extends StatelessWidget {
  const EngineeringFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'EngineeringFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}