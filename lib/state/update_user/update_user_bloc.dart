import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pimp_my_code/domain/entities/user.dart';

import '../../core/form_status.dart';
import '../../domain/entities/enum/confidentiality.dart';
import '../../domain/usecases/user/update_user_use_case.dart';
import '../session/session_cubit.dart';

part 'update_user_bloc.freezed.dart';

part 'update_user_event.dart';

part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UpdateUserUseCase _registerUseCase;
  final SessionCubit _sessionCubit;

  UpdateUserBloc(this._registerUseCase, this._sessionCubit)
      : super(const UpdateUserState.state()) {
    on<_Submit>(onSubmit);
    on<_UpdateDescription>(onUpdateDescription);
    on<_UpdatePassword>(onUpdatePassword);
    on<_UpdateConfirmPassword>(onUpdateConfirmPassword);
    on<_UpdateConfidentiality>(onUpdateConfidentiality);
    on<_Loaded>(onLoaded);
  }

  void onLoaded(_Loaded event, Emitter emit) {
    emit(state.copyWith(
      confidentiality: event.user.confidentiality,
      description: event.user.description,
    ));
  }

  void onSubmit(_Submit event, Emitter emit) async {
    emit(state.copyWith(status: const FormSubmitting()));
    String userId = await _sessionCubit.getUserId();
    final successOrFailure = await _registerUseCase(UpdateUserParams(
      userId,
      state.description!,
      state.password,
      state.confirmPassword,
      state.confidentiality,
    ));
    successOrFailure.fold(
      (failure) => emit(state.copyWith(status: const FormSubmissionFailed())),
      (success) =>
          emit(state.copyWith(status: const FormSubmissionSuccessful())),
    );
  }

  void onUpdateDescription(_UpdateDescription event, Emitter emit) {
    emit(state.copyWith(
        description: event.description, status: const FormNotSent()));
  }

  void onUpdatePassword(_UpdatePassword event, Emitter emit) {
    emit(state.copyWith(password: event.password, status: const FormNotSent()));
  }

  void onUpdateConfirmPassword(_UpdateConfirmPassword event, Emitter emit) {
    emit(state.copyWith(
        confirmPassword: event.confirmPassword, status: const FormNotSent()));
  }

  void onUpdateConfidentiality(_UpdateConfidentiality event, Emitter emit) {
    emit(state.copyWith(
        confidentiality: event.confidentiality, status: const FormNotSent()));
  }
}
