import 'package:equatable/equatable.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyOtpEventPhone extends VerifyOtpEvent {
  final String phone;
  final String countryCode;
  const VerifyOtpEventPhone(this.phone, this.countryCode);

  @override
  List<Object> get props => [phone, countryCode];
}

class VerifyOtpEventCode extends VerifyOtpEvent {
  final String code;
  const VerifyOtpEventCode(this.code);

  @override
  List<Object> get props => [code];
}

class VerifyOtpEventCallBackType extends VerifyOtpEvent {
  final String callBackType;
  const VerifyOtpEventCallBackType(this.callBackType);

  @override
  List<Object> get props => [callBackType];
}

class VerifyOtpEventPassword extends VerifyOtpEvent {
  final String password;
  const VerifyOtpEventPassword(this.password);

  @override
  List<Object> get props => [password];
}

class VerifyOtpEventPasswordConfirm extends VerifyOtpEvent {
  final String passwordConfirm;
  const VerifyOtpEventPasswordConfirm(this.passwordConfirm);

  @override
  List<Object> get props => [passwordConfirm];
}

class VerifyOtpEventSubmit extends VerifyOtpEvent {
  const VerifyOtpEventSubmit();
}
