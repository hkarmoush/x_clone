// lib/features/auth/blocs/auth_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:x_clone/app/core/util/app_logger.dart';
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
    on<AuthStateChanged>(_onAuthStateChanged);

    _authStateChanges().listen((user) {
      AppLogger.info('_authStateChanges.listen with $user');
      add(AuthStateChanged(user));
    });
  }

  final SignIn _signIn;
  final SignOut _signOut;
  final Register _register;
  final ResetPassword _resetPassword;
  final AuthStateChanges _authStateChanges;

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    AppLogger.debug('SignInEvent: email=${event.email}');
    try {
      final user = await _signIn(event.email, event.password);
      emit(Authenticated(user));
      AppLogger.debug('SignInEvent: email=${event.email}');
    } catch (e) {
      emit(AuthError(e.toString()));
      AppLogger.error('SignInEvent error: $e');
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    AppLogger.debug('SignOutEvent');
    await _signOut();
    emit(Unauthenticated());
    AppLogger.info('User signed out');
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    AppLogger.debug('RegisterEvent: email=${event.email}');
    try {
      final user = await _register(event.email, event.password);
      AppLogger.info('User registered: ${user.email}');
    } catch (e) {
      emit(AuthError(e.toString()));
      AppLogger.error('RegisterEvent error: $e');
    }
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    AppLogger.debug('ResetPasswordEvent: email=${event.email}');
    await _resetPassword(event.email);
    AppLogger.info('Password reset email sent to: ${event.email}');
  }

  void _onAuthStateChanged(AuthStateChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(Authenticated(event.user!));
      AppLogger.info(
        'AuthStateChanged: User authenticated: ${event.user!.email}',
      );
    } else {
      emit(Unauthenticated());
      AppLogger.info('AuthStateChanged: User unauthenticated');
    }
  }
}
