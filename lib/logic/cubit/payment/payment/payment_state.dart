part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentStatePageInfoLoading extends PaymentState {}

class PaymentStatePageInfoError extends PaymentState {
  final String message;
  final int statusCode;

  const PaymentStatePageInfoError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class PaymentStatePageInfoLoaded extends PaymentState {
  final PaymentModel payment;

  const PaymentStatePageInfoLoaded(this.payment);

  @override
  List<Object> get props => [payment];
}

class PaymentStateEnrollLoading extends PaymentState {}

class PaymentStateEnrollError extends PaymentState {
  final String message;
  final int statusCode;

  const PaymentStateEnrollError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class PaymentStateEnrollLoaded extends PaymentState {
  final String message;

  const PaymentStateEnrollLoaded(this.message);

  @override
  List<Object> get props => [message];
}
