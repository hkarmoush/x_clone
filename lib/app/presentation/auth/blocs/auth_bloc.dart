// lib/features/auth/blocs/auth_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/usecases/auth/auth_state_changed.dart';
import 'package:x_clone/app/domain/usecases/auth/register.dart';
import 'package:x_clone/app/domain/usecases/auth/reset_password.dart';
import 'package:x_clone/app/domain/usecases/auth/signin.dart';
import 'package:x_clone/app/domain/usecases/auth/signout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._signIn,
    this._signOut,
    this._register,
    this._resetPassword,
    this._authStateChanges,
  ) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
    on<RegisterEvent>(_onRegister);
    on<ResetPasswordEvent>(_onResetPassword);
    _authStateChanges().listen((user) {
      add(AuthStateChanged(user));
    });
  }

  final SignIn _signIn;
  final SignOut _signOut;
  final Register _register;
  final ResetPassword _resetPassword;
  final AuthStateChanges _authStateChanges;

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await _signIn(event.email, event.password);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    await _signOut();
    emit(Unauthenticated());
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await _register(event.email, event.password);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onResetPassword(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    await _resetPassword(event.email);
  }
}
