import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/presentation/error/failure.dart';

import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/online_payment/payment_link_success_model.dart';
import '../../data/model/online_payment/product_payment_model.dart';
import '../../presentation/error/exception.dart';

abstract class PaymentOnlineRepository {
  //Future<Either<Failure, List<ProductPaymentModel>>> getProduct(String token);
  Future<Either<Failure, ProductPaymentModel>> getProduct(
      String token, String group);
  Future<Either<Failure, PaymentLinkSuccessModel>> submitPaymentLink(
      String token, Map<String, dynamic> body);
}

class PaymentOnlineRepositoryImpl implements PaymentOnlineRepository {
  final RemoteDataSource remoteDataSource;

  const PaymentOnlineRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, ProductPaymentModel>> getProduct(
      String token, String group) async {
    try {
      final result = await remoteDataSource.getProduct(token, group);

      final data = ProductPaymentModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PaymentLinkSuccessModel>> submitPaymentLink(
      String token, Map<String, dynamic> body) async {
    debugPrint("-------- repository submit payment link 1");
    try {
      debugPrint("-------- repository submit payment link 2");
      final result = await remoteDataSource.submitPaymentLink(token, body);
      debugPrint("-------- repository submit payment link 3 : $result");
      final data = PaymentLinkSuccessModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      debugPrint("-------- repository submit payment link 4 :${e.message}");
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      debugPrint("-------- repository submit payment link 5 : ${e.errors}");
      return Left(InvalidAuthData(e.errors));
    }
  }

  // @override
  // Future<Either<Failure, List<ProductPaymentModel>>> getProduct(
  //     String token) async {
  //   try {
  //     final result = await remoteDataSource.getProduct(token);
  //     final dataList = result['data'] as List;
  //     final data = List<ProductPaymentModel>.from(
  //         dataList.map((e) => ProductPaymentModel.fromMap(e))).toList();
  //     return Right(data);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   }
  // }
}
