import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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