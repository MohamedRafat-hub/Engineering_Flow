import 'package:engineering_flow/features/auth/presentation/views/account_disabled_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/reset_email_sent_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
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
        return ResetEmailSentView(
        email: email,
      );},
    ),

    GoRoute(
      path: '/account_disabled',
      builder: (context, state) => const AccountDisabledView(),
    ),
  ],
);