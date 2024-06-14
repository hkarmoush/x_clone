import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart';

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
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AuthBloc>().add(SignInEvent(email, password));
              },
              child: const Text('Sign In'),
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
              child: const Text('Don\'t have an account? Sign Up'),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthError) {
                  return Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red));
                } else if (state is Authenticated) {
                  return const Text('Signed In Successfully');
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
