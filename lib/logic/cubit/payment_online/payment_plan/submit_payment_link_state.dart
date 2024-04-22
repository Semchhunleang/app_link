import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/online_payment/payment_link_success_model.dart';

import '../../../../data/model/auth/auth_error_model.dart';

abstract class SubmitPaymentLinkState extends Equatable {
  const SubmitPaymentLinkState();
  @override
  List<Object> get props => [];
}

class SubmitPaymentLinkInitial extends SubmitPaymentLinkState {
  //const SubmitPaymentLinkInitial();
}

class SubmitPaymentLinkLoading extends SubmitPaymentLinkState {}

class SubmitPaymentLinkError extends SubmitPaymentLinkState {
  final String message;
  final int statusCode;

  const SubmitPaymentLinkError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class SubmitPaymentLinkLoaded extends SubmitPaymentLinkState {
  //final String message;
  final PaymentLinkSuccessModel paymentLinkSuccessModel;

  const SubmitPaymentLinkLoaded(this.paymentLinkSuccessModel);

  @override
  List<Object> get props => [paymentLinkSuccessModel];
}

class SubmitPaymentLinkFormError extends SubmitPaymentLinkState {
  final Errors errors;

  const SubmitPaymentLinkFormError(this.errors);

  @override
  List<Object> get props => [errors];
}

class SubmitPaymentLinkErrorMessage extends SubmitPaymentLinkState {
  final String messageError;

  const SubmitPaymentLinkErrorMessage(this.messageError);

  @override
  List<Object> get props => [messageError];
}
