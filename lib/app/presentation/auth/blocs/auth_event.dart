part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;

  const RegisterEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  const ResetPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}

class AuthStateChanged extends AuthEvent {
  final UserEntity? user;

  const AuthStateChanged(this.user);

  @override
  List<Object> get props => [
        // user
      ];
}
