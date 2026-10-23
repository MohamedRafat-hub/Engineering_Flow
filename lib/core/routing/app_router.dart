
import 'dart:async';

import 'package:engineering_flow/features/auth/presentation/views/account_disabled_view.dart';
import 'package:engineering_flow/features/auth/presentation/views/forgot_password_view.dart';
import 'package:engineering_flow/features/auth/presentation/views/login_view.dart';
import 'package:engineering_flow/features/auth/presentation/views/reset_email_sent_view.dart';
import 'package:engineering_flow/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:engineering_flow/features/main_screen.dart';
import 'package:engineering_flow/features/users/presentation/views/craete_user_view.dart';
import 'package:engineering_flow/features/users/presentation/views/edit_user_view.dart';
import 'package:engineering_flow/features/users/presentation/views/users_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/users/domain/entities/user_entity.dart';

class AuthRefreshNotifier extends ChangeNotifier {
  AuthRefreshNotifier() {
    _subscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((_) => notifyListeners());
  }

  late final StreamSubscription<User?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final _authRefreshNotifier = AuthRefreshNotifier();

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  refreshListenable: _authRefreshNotifier,
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final location = state.matchedLocation;

    const publicRoutes = {
      '/login',
      '/forgot-password',
      '/reset_email_sent',
      '/account_disabled',
    };

    if (!isLoggedIn && !publicRoutes.contains(location)) {
      return '/login';
    }

    if (isLoggedIn && location == '/login') {
      return '/main_screen';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: '/reset_email_sent',
      builder: (context, state) {
        final email = state.extra as String;
        return ResetEmailSentView(email: email);
      },
    ),
    GoRoute(
      path: '/account_disabled',
      builder: (context, state) => const AccountDisabledView(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersView(),
    ),
    GoRoute(
      path: '/create_user',
      builder: (context, state) => const CreateUserScreen(),
    ),
    GoRoute(
      path: '/main_screen',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/edit_user_view',
      builder: (context, state) {
        final user = state.extra as UserEntity;

        return EditUserView(user: user);
      },
    ),
  ],
);
