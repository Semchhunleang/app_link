import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/auth/verify_otp_model.dart';
import '../../repository/auth_repository.dart';
import 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepository repository;
  String phoneNumber = '';
  String code = '';
  String message = '';
  // String password = '';
  // String confirmPassword = '';
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  VerifyOtpCubit({
    required AuthRepository otpRepository,
  })  : repository = otpRepository,
        super(const VerifyOtpStateInitial());

  Future<void> verifyOtp(String callBackType,
      {String checkVerifyOnly = ''}) async {
    debugPrint("---------- verify otp cubit 1");
    emit(const VerifyOtpStateLoading());
    debugPrint("---------- verify otp cubit 2");

    final model = callBackType == "register"
        ? VerifyOtpModel(
            phone: phoneNumber.trim(),
            code: code.trim(),
            callBackType: callBackType.trim(),
          )
        : VerifyOtpModel(
            phone: phoneNumber.trim(),
            code: code.trim(),
            callBackType: callBackType.trim(),
            checkVerifyOnly: checkVerifyOnly.trim(),
            password: passwordController.text.trim(),
            confirmPassword: passwordConfirmController.text.trim());

    debugPrint("---------- verify otp cubit 3 : $model");

    final result = await repository.verifyOtp(model);
    debugPrint("---------- verify otp cubit 4 : $result");
    result.fold(
      (failure) {
        debugPrint("---------- verify otp cubit 5 : ${failure.message}");
        emit(const VerifyOtpStateError(
            "Something went wrong. Please try again."));
        //emit(VerifyOtpStateError(failure.message));

        // if (failure is InvalidAuthData) {
        //   debugPrint("---------- verify otp cubit 6 : ${failure.errors}");
        //   emit(VerifyOtpFormValidateError(failure.errors));
        // } else {
        //   emit(VerifyOtpStateError(failure.message));
        // }
      },
      (data) {
        debugPrint("---------- verify otp cubit 7 : $data");
        emit(VerifyOtpStateLoaded(data));
      },
    );
  }

  // Future<void> verifyOtp() async {
  //   debugPrint("---------- verify otp result 1");
  //   emit(const VerifyOtpStateLoading());
  //   debugPrint("---------- verify otp result 2");
  //   final body = {
  //     "phone": "+85510101021", "code": "123456", "callback_type": "register"
  //     // emailController.text.trim()
  //   };
  //   debugPrint("---------- verify otp result 3");
  //   final result = await repository.verifyOtp(body);
  //   debugPrint("---------- verify otp result 4");
  //   debugPrint("---------- verify otp result : $result");
  //   result.fold(
  //     (failure) {
  //       if (failure is InvalidAuthData) {
  //         emit(VerifyOtpFormValidateError(failure.errors));
  //       } else {
  //         emit(VerifyOtpStateError(failure.message));
  //       }
  //     },
  //     (data) {
  //       debugPrint("---------- verify otp data : $data");
  //       message = data;
  //       emit(VerifyOtpStateLoaded(data));
  //     },
  //   );
  // }
}
