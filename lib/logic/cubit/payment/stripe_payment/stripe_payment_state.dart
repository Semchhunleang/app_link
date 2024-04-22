part of 'stripe_payment_cubit.dart';

abstract class StripePaymentState extends Equatable {
  const StripePaymentState();

  @override
  List<Object> get props => [];
}

class StripePaymentInitial extends StripePaymentState {
  const StripePaymentInitial();
}

class StripePaymentLoading extends StripePaymentState {
  const StripePaymentLoading();
}

class StripePaymentLoaded extends StripePaymentState {
  final String message;

  const StripePaymentLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class StripePaymentError extends StripePaymentState {
  final String message;
  final int statusCode;

  const StripePaymentError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class StripePaymentFormError extends StripePaymentState {
  final Errors errors;

  const StripePaymentFormError(this.errors);

  @override
  List<Object> get props => [errors];
}
