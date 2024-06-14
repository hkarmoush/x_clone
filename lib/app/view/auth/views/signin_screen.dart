// lib/features/auth/screens/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/app/view/auth/blocs/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => context.read<AuthBloc>().add(SignInEvent(
                  value, context.read<AuthBloc>().state.props[1] as String)),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => context.read<AuthBloc>().add(SignInEvent(
                  context.read<AuthBloc>().state.props[0] as String, value)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final email = context.read<AuthBloc>().state.props[0] as String;
                final password =
                    context.read<AuthBloc>().state.props[1] as String;
                context.read<AuthBloc>().add(SignInEvent(email, password));
              },
              child: const Text('Sign In'),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthError) {
                  return Text('Error: ${state.message}');
                } else if (state is Authenticated) {
                  return const Text('Signed In');
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
