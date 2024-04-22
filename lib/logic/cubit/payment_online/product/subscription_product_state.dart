import 'package:equatable/equatable.dart';

import '../../../../data/model/online_payment/product_payment_model.dart';

abstract class SubscriptionProductState extends Equatable {
  const SubscriptionProductState();
  @override
  List<Object> get props => [];
}

class SubscriptionProductInitial extends SubscriptionProductState {}

class SubscriptionProductLoading extends SubscriptionProductState {}

class SubscriptionProductError extends SubscriptionProductState {
  final String message;
  final int statusCode;

  const SubscriptionProductError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class SubscriptionProductLoaded extends SubscriptionProductState {
  final ProductPaymentModel productPaymentModel;

  const SubscriptionProductLoaded(this.productPaymentModel);

  @override
  List<Object> get props => [productPaymentModel];
}

// class SubscriptionProductLoaded extends SubscriptionProductState {
//   final List<ProductPaymentModel> productPaymentModel;

//   const SubscriptionProductLoaded(this.productPaymentModel);

//   @override
//   List<Object> get props => [productPaymentModel];
// }
