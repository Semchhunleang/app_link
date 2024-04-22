import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/error/failure.dart';
import '../../repository/auth_repository.dart';
import 'verify_otp_event.dart';
import 'verify_otp_states.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpModelState> {
  final AuthRepository repository;

  VerifyOtpBloc(this.repository) : super(const VerifyOtpModelState()) {
    //------ phone + country code ------//

    on<VerifyOtpEventPhone>((event, emit) {
      emit(state.copyWith(
        phone: event.phone,
        countryCode: event.countryCode,
      ));
    });
    on<VerifyOtpEventCode>((event, emit) {
      emit(state.copyWith(
        code: event.code,
      ));
    });
    on<VerifyOtpEventCallBackType>((event, emit) {
      emit(state.copyWith(
        callBackType: event.callBackType,
      ));
    });
    // on<VerifyOtpEventPassword>((event, emit) {
    //   emit(state.copyWith(
    //     password: event.password,
    //   ));
    // });
    on<VerifyOtpEventPassword>((event, emit) {
      emit(state.copyWith(
        password: event.password,
      ));
    });
    on<VerifyOtpEventPasswordConfirm>((event, emit) {
      emit(state.copyWith(
        password: event.passwordConfirm,
      ));
    });
    //on<VerifyOtpEventSubmit>(_submitOtp);
  }

  // void _submitOtp(
  //     VerifyOtpEventSubmit event, Emitter<VerifyOtpModelState> emit) async {
  //   debugPrint("---------------- verify otp  ------- : ${event.toString()}");
  //   emit(state.copyWith(state: const VerifyOtpStateLoading()));
  //   final bodyData = state.toMap();
  //   debugPrint("---------------- verify otp  body------- : $bodyData");
  //   log(bodyData.toString(), name: "VerifyOtp Data");

  //   final result = await repository.verifyOtp(bodyData);
  //   debugPrint("---------------- verify otp  result ------- : $result");

  //   result.fold(
  //     (failure) {
  //       if (failure is InvalidAuthData) {
  //         final errors = VerifyOtpStateFormInvalid(failure.errors);
  //         emit(state.copyWith(state: errors));
  //       } else {
  //         final error =
  //             VerifyOtpStatesError(failure.message, failure.statusCode);
  //         emit(state.copyWith(state: error));
  //       }
  //     },
  //     (data) {
  //       log(data.toString(), name: "VerifyOtpBloc Success");
  //       emit(state.copyWith(state: VerifyOtpStatesLoaded(data)));
  //     },
  //   );
  // }
}
