import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/presentation/auth/views/reset_password_screen.dart';
import 'package:x_clone/app/presentation/auth/views/signin_screen.dart';
import 'package:x_clone/app/presentation/auth/views/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SignInScreen(),
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
