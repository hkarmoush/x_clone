import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_details.freezed.dart';

@freezed
class RegistrationDetails with _$RegistrationDetails {
  const factory RegistrationDetails({
    required String name,
    required String email,
    required String password,
  }) = _RegistrationDetails;
}
