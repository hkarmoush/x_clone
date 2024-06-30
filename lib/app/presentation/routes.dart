import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/presentation/auth/views/auth_check.dart';
import 'package:x_clone/app/presentation/auth/views/reset_password_screen.dart';
import 'package:x_clone/app/presentation/auth/views/signup_screen.dart';
import 'package:x_clone/app/presentation/profile/screens/profile_screen.dart';
import 'package:x_clone/app/presentation/tweet/screens/tweet_screen.dart';

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
    GoRoute(
      path: '/profile/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return ProfileScreen(userId: userId);
      },
    ),
    GoRoute(
      path: '/create-tweet',
      builder: (context, state) => const CreateTweetScreen(),
    ),
  ],
);
