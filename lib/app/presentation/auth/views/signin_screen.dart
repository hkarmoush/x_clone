import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_button.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/core/widgets/platform_text_button.dart';
import 'package:x_clone/app/core/widgets/platform_textfield.dart';
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const PlatformAppBar(title: 'Sign In'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
              PlatformTextButton(
                onPressed: () {
                  context.go('/reset-password');
                },
                text: 'Forgot Password',
              ),
              PlatformTextButton(
                onPressed: () {
                  context.go('/signup');
                },
                text: "Don't have an account? Sign Up",
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
      ),
    );
  }
}
