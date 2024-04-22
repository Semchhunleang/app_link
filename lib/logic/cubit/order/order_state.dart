part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final OrderModel orders;

  const OrderLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrderError extends OrderState {
  final String message;
  final int statusCode;

  const OrderError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class OrderDetailLoaded extends OrderState {
  final SingleOrderModel orderDetails;

  const OrderDetailLoaded(this.orderDetails);

  @override
  List<Object> get props => [orderDetails];
}
