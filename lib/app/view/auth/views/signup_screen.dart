import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/view/auth/blocs/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                context.read<AuthBloc>().add(RegisterEvent(email, password));
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Already have an account? Sign In'),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthError) {
                  return Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  );
                } else if (state is Authenticated) {
                  return const Text('Signed Up Successfully');
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
