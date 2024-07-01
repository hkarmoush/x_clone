// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationDetails {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationDetailsCopyWith<RegistrationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDetailsCopyWith<$Res> {
  factory $RegistrationDetailsCopyWith(
          RegistrationDetails value, $Res Function(RegistrationDetails) then) =
      _$RegistrationDetailsCopyWithImpl<$Res, RegistrationDetails>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$RegistrationDetailsCopyWithImpl<$Res, $Val extends RegistrationDetails>
    implements $RegistrationDetailsCopyWith<$Res> {
  _$RegistrationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationDetailsImplCopyWith<$Res>
    implements $RegistrationDetailsCopyWith<$Res> {
  factory _$$RegistrationDetailsImplCopyWith(_$RegistrationDetailsImpl value,
          $Res Function(_$RegistrationDetailsImpl) then) =
      __$$RegistrationDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$RegistrationDetailsImplCopyWithImpl<$Res>
    extends _$RegistrationDetailsCopyWithImpl<$Res, _$RegistrationDetailsImpl>
    implements _$$RegistrationDetailsImplCopyWith<$Res> {
  __$$RegistrationDetailsImplCopyWithImpl(_$RegistrationDetailsImpl _value,
      $Res Function(_$RegistrationDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegistrationDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationDetailsImpl implements _RegistrationDetails {
  const _$RegistrationDetailsImpl(
      {required this.name, required this.email, required this.password});

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegistrationDetails(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationDetailsImplCopyWith<_$RegistrationDetailsImpl> get copyWith =>
      __$$RegistrationDetailsImplCopyWithImpl<_$RegistrationDetailsImpl>(
          this, _$identity);
}

abstract class _RegistrationDetails implements RegistrationDetails {
  const factory _RegistrationDetails(
      {required final String name,
      required final String email,
      required final String password}) = _$RegistrationDetailsImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationDetailsImplCopyWith<_$RegistrationDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
