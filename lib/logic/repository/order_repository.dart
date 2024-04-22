import 'package:dartz/dartz.dart';

import '/data/model/order/order_model.dart';
import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/order/single_order_model.dart';
import '../../presentation/error/exception.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderModel>> getAllOrders(String token);

  Future<Either<Failure, SingleOrderModel>> getOrderDetails(
      String token, String orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  final RemoteDataSource remoteDataSource;

  const OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, OrderModel>> getAllOrders(String token) async {
    try {
      final result = await remoteDataSource.getAllOrders(token);
      final data = OrderModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, SingleOrderModel>> getOrderDetails(
      String token, String orderId) async {
    try {
      final result = await remoteDataSource.getOrderDetails(token, orderId);
      final data = SingleOrderModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
