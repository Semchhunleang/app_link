import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/auth/auth_error_model.dart';
import 'package:real_estate/data/model/auth/request_otp_model.dart';

abstract class RequestOtpState extends Equatable {
  const RequestOtpState();

  @override
  List<Object> get props => [];
}

// class OtpStateInitial extends OtpState {
//   const OtpStateInitial();
// }
class OtpStateInitial extends RequestOtpState {
  const OtpStateInitial();
  @override
  List<Object> get props => [];
}

class OtpStateLoading extends RequestOtpState {
  const OtpStateLoading();
}

class OtpStateError extends RequestOtpState {
  const OtpStateError(this.errorMsg);

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}

class OtpSendMessageError extends RequestOtpState {
  final String message;
  final int statusCode;

  const OtpSendMessageError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class OtpFormValidateError extends RequestOtpState {
  const OtpFormValidateError(this.errors);

  final Errors errors;

  @override
  List<Object> get props => [errors];
}

class OtpStateLoaded extends RequestOtpState {
  final RequestOtpModel requestOtpModel;

  const OtpStateLoaded(this.requestOtpModel);

  @override
  List<Object> get props => [requestOtpModel];
}

// class OtpStateLoaded extends OtpState {
//   const OtpStateLoaded(this.email);

//   final String email;

//   @override
//   List<Object> get props => [email];
// }
