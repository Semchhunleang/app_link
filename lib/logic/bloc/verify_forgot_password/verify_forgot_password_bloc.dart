import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/logic/bloc/verify_forgot_password/verify_forgot_password_event.dart';
import '../../../presentation/error/failure.dart';
import '../../repository/auth_repository.dart';
import 'verify_forgot_password_state.dart';

class VerifyForgotPasswordBloc
    extends Bloc<VerifyForgotPasswordEvent, VerifyForgotPasswordModelState> {
  final AuthRepository repository;

  final phoneController = TextEditingController();

  VerifyForgotPasswordBloc(this.repository)
      : super(const VerifyForgotPasswordModelState()) {
    //------ phone + country code ------//
    on<VerifyForgotPasswordEvenPhone>((event, emit) {
      emit(state.copyWith(
          phone: event.phone,
          countryCode: event.countryCode,
          state: const VerifyForgotPasswordStateInitial()));
    });
    on<VerifyForgotPasswordEventSubmit>(_submitVerifyForgotPassword);
    on<VerifyForgotPasswordClear>(_clearFormData);
  }

  Future<void> _clearFormData(VerifyForgotPasswordClear event,
      Emitter<VerifyForgotPasswordModelState> emit) async {
    emit(state.clear());
  }

  void _submitVerifyForgotPassword(VerifyForgotPasswordEventSubmit event,
      Emitter<VerifyForgotPasswordModelState> emit) async {
    debugPrint(
        "---------------- verify forgot password  ------- : ${event.toString()}");
    emit(state.copyWith(state: const VerifyForgotPasswordStateLoading()));
    final bodyData = state.toMap();
    debugPrint(
        "---------------- verify forgot password  body------- : $bodyData");
    log(bodyData.toString(), name: "VerifyForgotPassword Data");

    final result = await repository.verifyForgotPassword(bodyData);
    debugPrint(
        "---------------- verify forgot password  result ------- : $result");

    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = VerifyForgotPasswordStateFormInvalid(failure.errors);
          emit(state.copyWith(state: errors));
        } else {
          final error = VerifyForgotPasswordStateError(
              failure.message, failure.statusCode);
          emit(state.copyWith(state: error));
        }
      },
      (user) {
        log(user.toString(), name: "VerifyForgotPasswordBloc Success");
        emit(state.copyWith(state: VerifyForgotPasswordStateLoaded(user)));
      },
    );
  }
}
