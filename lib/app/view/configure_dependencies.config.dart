// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:x_clone/app/data/repositories/auth_repository_impl.dart' as _i5;
import 'package:x_clone/app/domain/repositories/auth_repository.dart' as _i4;
import 'package:x_clone/app/domain/usecases/auth/auth_state_changed.dart'
    as _i11;
import 'package:x_clone/app/domain/usecases/auth/register.dart' as _i9;
import 'package:x_clone/app/domain/usecases/auth/reset_password.dart' as _i10;
import 'package:x_clone/app/domain/usecases/auth/signin.dart' as _i7;
import 'package:x_clone/app/domain/usecases/auth/signout.dart' as _i8;
import 'package:x_clone/app/view/auth/blocs/auth_bloc.dart' as _i6;
import 'package:x_clone/app/view/injection.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.factory<_i6.AuthBloc>(() => _i6.AuthBloc(
          gh<_i7.SignIn>(),
          gh<_i8.SignOut>(),
          gh<_i9.Register>(),
          gh<_i10.ResetPassword>(),
          gh<_i11.AuthStateChanges>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
