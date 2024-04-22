import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/data/model/auth/request_otp_model.dart';
import 'package:real_estate/logic/cubit/otp/request_otp_state.dart';
import 'package:real_estate/presentation/error/failure.dart';

import '../../repository/auth_repository.dart';

class OtpCubit extends Cubit<RequestOtpModel> {
  final AuthRepository repository;
  //OtpCubit(this.repository) : super(const OtpStateInitial());

  OtpCubit({
    required AuthRepository otpRepository,
  })  : repository = otpRepository,
        super(const RequestOtpModel());
  // OtpCubit(super.initialState);

  //   Future<void> requestOtp() async {
  //   emit(const OtpStateLoading());
  //   final body = ;
  //   final result = await repository.requestOtp(body);
  //   result.fold(
  //     (failure) {
  //       if (failure is InvalidAuthData) {
  //         emit(OtpFormValidateError(failure.errors));
  //       } else {
  //         emit(OtpStateError(failure.message));
  //       }
  //     },
  //     (data) {
  //       emit(OtpStateLoaded(data));
  //     },
  //   );
  // }

  RequestOtpModel? requestOtpModel;
  Future<void> requestOtp(String phone) async {
    debugPrint("-----  result request otp  cubit 1: $phone");
    emit(state.copyWith(requestOtpState: const OtpStateLoading()));
    debugPrint("-----  result request otp  cubit 2: $phone");
    final body = {"phone": phone.trim()};
    //  {"phone": "+85510101011"};
    //
    debugPrint("-----  result request otp  cubit 3: $body");
    final result = await repository.requestOtp(body);
    debugPrint("-----  result request otp  cubit 4: $result");
    result.fold(
      (failure) {
        debugPrint("-----  result request otp  cubit 5");
        if (failure is InvalidAuthData) {
          debugPrint("-----  result request otp  cubit 6");
          final errors = OtpFormValidateError(failure.errors);
          debugPrint("-----  result request otp  cubit 7");
          emit(state.copyWith(requestOtpState: errors));
        } else {
          debugPrint("-----  result request otp  cubit 8");
          emit(state.copyWith(
              requestOtpState:
                  OtpSendMessageError(failure.message, failure.statusCode)));
        }
      },
      (data) {
        debugPrint("-----  result request otp  cubit 9: $data");
        requestOtpModel = data;
        emit(state.copyWith(requestOtpState: OtpStateLoaded(requestOtpModel!)));
        debugPrint(
            "-----  result request otp  cubit 10: ${requestOtpModel!.messageRequestOtpData!.retryInSecond}");
      },
    );
  }
}
