import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/core/widgets/platform_button.dart';
import 'package:x_clone/app/core/widgets/platform_dialog.dart';
import 'package:x_clone/app/core/widgets/platform_textfield.dart';
import '../blocs/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PlatformTextField(
              controller: emailController,
              placeholder: 'Email',
            ),
            PlatformTextField(
              controller: passwordController,
              placeholder: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            PlatformButton(
              text: 'Sign In',
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AuthBloc>().add(SignInEvent(email, password));
              },
            ),
            TextButton(
              onPressed: () {
                context.go('/reset-password');
              },
              child: const Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                context.go('/signup');
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  PlatformDialog.show(
                    context: context,
                    title: 'Error',
                    content: state.message,
                  );
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthError) {
                    return Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    );
                  } else if (state is Authenticated) {
                    return const Text('Signed In Successfully');
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
