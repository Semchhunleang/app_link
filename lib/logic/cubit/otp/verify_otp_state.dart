import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/auth/auth_error_model.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpStateInitial extends VerifyOtpState {
  const VerifyOtpStateInitial();
}

class VerifyOtpStateLoading extends VerifyOtpState {
  const VerifyOtpStateLoading();
}

class VerifyOtpStateError extends VerifyOtpState {
  const VerifyOtpStateError(this.errorMsg);

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}

class VerifyOtpSendMessageError extends VerifyOtpState {
  final String message;
  final int statusCode;

  const VerifyOtpSendMessageError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class VerifyOtpFormValidateError extends VerifyOtpState {
  const VerifyOtpFormValidateError(this.errors);

  final Errors errors;

  @override
  List<Object> get props => [errors];
}

class VerifyOtpStateLoaded extends VerifyOtpState {
  //final RequestOtpModel requestOtpModel;
  final String message;

  const VerifyOtpStateLoaded(this.message);
  // const VerifyOtpStateLoaded(this.requestOtpModel);
  // const VerifyOtpStateLoaded();

  @override
  List<Object> get props => [message];
}

// class OtpStateLoaded extends OtpState {
//   const OtpStateLoaded(this.email);

//   final String email;

//   @override
//   List<Object> get props => [email];
// }
