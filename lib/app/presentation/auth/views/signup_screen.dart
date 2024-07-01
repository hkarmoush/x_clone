import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_button.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/core/widgets/platform_text_button.dart';
import 'package:x_clone/app/core/widgets/platform_textfield.dart';
import 'package:x_clone/app/domain/entities/auth/registration_details.dart';
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const ObstructingPreferredPlatformAppBar(title: 'Sign Up'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PlatformTextField(
                controller: _nameController,
                placeholder: 'Name',
              ),
              PlatformTextField(
                controller: _emailController,
                placeholder: 'Email',
              ),
              PlatformTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              PlatformButton(
                text: 'Sign Up',
                onPressed: () {
                  final name = _nameController.text;
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final registrationDetails = RegistrationDetails(
                    name: name,
                    email: email,
                    password: password,
                  );
                  context.read<AuthBloc>().add(
                        RegisterEvent(registrationDetails),
                      );
                },
              ),
              PlatformTextButton(
                onPressed: () {
                  context.pop();
                },
                text: 'Already have an account? Sign In',
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
      ),
    );
  }
}
