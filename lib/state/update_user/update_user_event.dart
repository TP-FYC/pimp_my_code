part of 'update_user_bloc.dart';

@freezed
class UpdateUserEvent with _$UpdateUserEvent {
  const factory UpdateUserEvent.submit() = _Submit;
  const factory UpdateUserEvent.updateDescription(String description) = _UpdateDescription;
  const factory UpdateUserEvent.updatePassword(String password) = _UpdatePassword;
  const factory UpdateUserEvent.updateConfirmPassword(String confirmPassword) = _UpdateConfirmPassword;
  const factory UpdateUserEvent.updateConfidentiality(Confidentiality confidentiality) = _UpdateConfidentiality;
  const factory UpdateUserEvent.loaded(User user) = _Loaded;
}
