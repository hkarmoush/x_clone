import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_button.dart';
import 'package:x_clone/app/core/widgets/platform_dialog.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/core/widgets/platform_textfield.dart';
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const ObstructingPreferredPlatformAppBar(title: 'Sign In'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 128),
            PlatformTextField(
              controller: emailController,
              placeholder: 'Email',
            ),
            const SizedBox(height: 8),
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
                context.push('/reset-password');
              },
              child: const Text('Forgot Password?'),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                context.push('/signup');
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                _errorListener(state, context);
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return _errorBuilder(state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _errorListener(AuthState state, BuildContext context) {
    if (state is AuthError) {
      PlatformDialog.show(
        context: context,
        title: 'Error',
        content: state.message,
      );
    }
  }

  StatelessWidget _errorBuilder(AuthState state) {
    if (state is AuthError) {
      return Text(
        'Error: ${state.message}',
        style: const TextStyle(color: Colors.red),
      );
    } else if (state is Authenticated) {
      return const Text('Signed In Successfully');
    }
    return Container();
  }
}
