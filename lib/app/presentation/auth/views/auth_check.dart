import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart';
import 'package:x_clone/app/presentation/auth/views/signin_screen.dart';
import 'package:x_clone/app/presentation/home/screens/home_screen.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeScreen();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
