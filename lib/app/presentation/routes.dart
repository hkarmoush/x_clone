import 'package:go_router/go_router.dart';
import 'package:x_clone/app/presentation/auth/views/auth_check.dart';
import 'package:x_clone/app/presentation/auth/views/reset_password_screen.dart';
import 'package:x_clone/app/presentation/auth/views/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthCheck(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => ResetPasswordScreen(),
    ),
  ],
);
