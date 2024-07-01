part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  const SignInEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  const RegisterEvent(this.registrationDetails);

  final RegistrationDetails registrationDetails;

  @override
  List<Object> get props => [registrationDetails];
}

class ResetPasswordEvent extends AuthEvent {
  const ResetPasswordEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class AuthStateChanged extends AuthEvent {
  const AuthStateChanged(this.user);

  final UserEntity? user;

  @override
  List<Object> get props => [
        // user
      ];
}
