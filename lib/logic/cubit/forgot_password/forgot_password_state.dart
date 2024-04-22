part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordStateInitial extends ForgotPasswordState {
  const ForgotPasswordStateInitial();
}

class ForgotPasswordStateLoading extends ForgotPasswordState {
  const ForgotPasswordStateLoading();
}

class ForgotPasswordStateError extends ForgotPasswordState {
  const ForgotPasswordStateError(this.errorMsg);

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}

class ForgotPasswordFormValidateError extends ForgotPasswordState {
  const ForgotPasswordFormValidateError(this.errors);

  final Errors errors;

  @override
  List<Object> get props => [errors];
}

class ForgotPasswordStateLoaded extends ForgotPasswordState {
  const ForgotPasswordStateLoaded(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PasswordSetStateLoaded extends ForgotPasswordState {
  const PasswordSetStateLoaded(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class VerifyingForgotPasswordCodeLoaded extends ForgotPasswordState {
  const VerifyingForgotPasswordCodeLoaded();

  @override
  List<Object> get props => [];
}
