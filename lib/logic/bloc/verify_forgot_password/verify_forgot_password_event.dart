import 'package:equatable/equatable.dart';

abstract class VerifyForgotPasswordEvent extends Equatable {
  const VerifyForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class VerifyForgotPasswordEvenPhone extends VerifyForgotPasswordEvent {
  final String phone;
  final String countryCode;

  const VerifyForgotPasswordEvenPhone(this.phone, this.countryCode);

  @override
  List<Object> get props => [phone, countryCode];
}

class VerifyForgotPasswordEventSubmit extends VerifyForgotPasswordEvent {
  const VerifyForgotPasswordEventSubmit();
}

class VerifyForgotPasswordClear extends VerifyForgotPasswordEvent {
  const VerifyForgotPasswordClear();
}
