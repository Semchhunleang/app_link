import 'package:dartz/dartz.dart';

import '/data/data_provider/remote_data_source.dart';
import '/presentation/error/exception.dart';
import '/presentation/error/failure.dart';
import '../../data/model/privacy/faq_model/faq_model.dart';

abstract class PrivacyPolicyRepository {
  Future<Either<Failure, FaqModel>> getFaqContent();

  Future<Either<Failure, String>> getPrivacyPolicy();

  Future<Either<Failure, String>> getTermsAndCondition();
}

class PrivacyPolicyRepositoryImpl implements PrivacyPolicyRepository {
  final RemoteDataSource remoteDataSource;

  const PrivacyPolicyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FaqModel>> getFaqContent() async {
    try {
      final result = await remoteDataSource.getFaqContent();
      final data = FaqModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> getPrivacyPolicy() async {
    try {
      final result = await remoteDataSource.getPrivacyPolicy();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> getTermsAndCondition() async {
    try {
      final result = await remoteDataSource.getTermsAndCondition();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
