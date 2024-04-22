part of 'bank_payment_cubit.dart';

abstract class BankPaymentState extends Equatable {
  const BankPaymentState();

  @override
  List<Object> get props => [];
}

class BankPaymentInitial extends BankPaymentState {}

class BankPaymentLoading extends BankPaymentState {}

class BankPaymentLoaded extends BankPaymentState {
  final String message;

  const BankPaymentLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class BankPaymentError extends BankPaymentState {
  final String message;
  final int statusCode;

  const BankPaymentError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class BankPaymentFormError extends BankPaymentState {
  final Errors errors;

  const BankPaymentFormError(this.errors);

  @override
  List<Object> get props => [errors];
}
