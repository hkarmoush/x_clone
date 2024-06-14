// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:x_clone/app/data/datasources/user/firestore_user_datasource.dart'
    as _i6;
import 'package:x_clone/app/data/datasources/user/user_datasource.dart' as _i5;
import 'package:x_clone/app/data/repositories/auth_repository_impl.dart' as _i8;
import 'package:x_clone/app/domain/repositories/auth_repository.dart' as _i7;
import 'package:x_clone/app/domain/usecases/auth/auth_state_changed.dart'
    as _i11;
import 'package:x_clone/app/domain/usecases/auth/register.dart' as _i9;
import 'package:x_clone/app/domain/usecases/auth/reset_password.dart' as _i12;
import 'package:x_clone/app/domain/usecases/auth/signin.dart' as _i13;
import 'package:x_clone/app/domain/usecases/auth/signout.dart' as _i10;
import 'package:x_clone/app/presentation/auth/blocs/auth_bloc.dart' as _i14;
import 'package:x_clone/app/presentation/injection.dart' as _i15;

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
    gh.lazySingleton<_i4.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i5.UserDataSource>(() => registerModule.userDataSource);
    gh.factory<_i6.UserDataSourceFirestore>(
        () => _i6.UserDataSourceFirestore(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.UserDataSource>(),
        ));
    gh.factory<_i9.Register>(() => _i9.Register(gh<_i7.AuthRepository>()));
    gh.factory<_i10.SignOut>(() => _i10.SignOut(gh<_i7.AuthRepository>()));
    gh.factory<_i11.AuthStateChanges>(
        () => _i11.AuthStateChanges(gh<_i7.AuthRepository>()));
    gh.factory<_i12.ResetPassword>(
        () => _i12.ResetPassword(gh<_i7.AuthRepository>()));
    gh.factory<_i13.SignIn>(() => _i13.SignIn(gh<_i7.AuthRepository>()));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(
          gh<_i13.SignIn>(),
          gh<_i10.SignOut>(),
          gh<_i9.Register>(),
          gh<_i12.ResetPassword>(),
          gh<_i11.AuthStateChanges>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
