import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_button.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/core/widgets/platform_textfield.dart';
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const ObstructingPreferredPlatformAppBar(title: 'Reset Password'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PlatformTextField(
                controller: emailController,
                placeholder: 'Email',
              ),
              const SizedBox(height: 16),
              PlatformButton(
                text: 'Reset Password',
                onPressed: () {
                  final email = emailController.text;
                  context.read<AuthBloc>().add(ResetPasswordEvent(email));
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthError) {
                    return Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    );
                  } else if (state is Unauthenticated) {
                    return const Text('Reset link sent to email');
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
