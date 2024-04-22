import 'package:dartz/dartz.dart';

import '/data/model/payment/pricing_plan_model.dart';
import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/payment/payment_model.dart';
import '../../presentation/error/exception.dart';
import '../cubit/payment/stripe_payment/stripe_payment_state_model.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<PricePlan>>> getPricePlan();

  Future<Either<Failure, PaymentModel>> getPaymentPageInformation(
      String token, String planSlug);

  Future<Either<Failure, String>> freeEnrollment(String token, String planSlug);

  Future<Either<Failure, String>> bankPayment(
      String token, String planSlug, Map<String, String> body);

  Future<Either<Failure, String>> stripePayment(
      String token, String planSlug, StripePaymentStateModel body);

  Future<Either<Failure, Map<String, dynamic>>> flutterWavePayment(Uri uri);
}

class PaymentRepositoryImpl implements PaymentRepository {
  final RemoteDataSource remoteDataSource;

  const PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PricePlan>>> getPricePlan() async {
    try {
      final result = await remoteDataSource.getPricePlan();
      final dataList = result['pricing_plans'] as List;
      final data =
          List<PricePlan>.from(dataList.map((e) => PricePlan.fromMap(e)))
              .toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PaymentModel>> getPaymentPageInformation(
      String token, String planSlug) async {
    try {
      final result =
          await remoteDataSource.getPaymentPageInformation(token, planSlug);

      final data = PaymentModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> freeEnrollment(
      String token, String planSlug) async {
    try {
      final result = await remoteDataSource.freeEnrollment(token, planSlug);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> bankPayment(
      String token, String planSlug, Map<String, String> body) async {
    try {
      final result = await remoteDataSource.bankPayment(token, planSlug, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, String>> stripePayment(
      String token, String planSlug, StripePaymentStateModel body) async {
    try {
      final result =
          await remoteDataSource.stripePayment(token, planSlug, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> flutterWavePayment(
      Uri uri) async {
    try {
      final result = await remoteDataSource.flutterWavePayment(uri);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
