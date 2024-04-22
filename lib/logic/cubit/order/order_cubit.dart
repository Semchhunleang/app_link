import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/model/order/order_model.dart';
import '/data/model/order/single_order_model.dart';
import '/logic/repository/order_repository.dart';
import '../../bloc/login/login_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  final LoginBloc _loginBloc;

  OrderCubit(
      {required LoginBloc loginBloc, required OrderRepository orderRepository})
      : _loginBloc = loginBloc,
        _orderRepository = orderRepository,
        super(OrderInitial());

  OrderModel? orders;
  SingleOrderModel? singleOrder;

  Future<void> getAllOrders() async {
    emit(OrderLoading());
    final result = await _orderRepository
        .getAllOrders(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((l) => emit(OrderError(l.message, l.statusCode)), (r) {
      orders = r;
      emit(OrderLoaded(r));
    });
  }

  Future<void> getOrderDetails(String orderId) async {
    emit(OrderLoading());
    final result = await _orderRepository.getOrderDetails(
        _loginBloc.userInfo!.tokenModel.accessToken, orderId);
    result.fold((l) => emit(OrderError(l.message, l.statusCode)), (success) {
      singleOrder = success;
      emit(OrderDetailLoaded(success));
    });
  }
}
