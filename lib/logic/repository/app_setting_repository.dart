import 'package:dartz/dartz.dart';

import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/setting/website_setup_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';

abstract class AppSettingRepository {
  Future<Either<Failure, WebsiteSetupModel>> websiteSetup();
  Either<Failure, WebsiteSetupModel> getCachedWebsiteSetup();

  Either<Failure, bool> checkOnBoarding();
  Future<Either<Failure, bool>> cashOnBoarding();
}

class AppSettingRepositoryImp extends AppSettingRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  AppSettingRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Either<Failure, bool> checkOnBoarding() {
    try {
      final result = localDataSource.checkOnBoarding();

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> cashOnBoarding() async {
    try {
      return Right(await localDataSource.cacheOnBoarding());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, WebsiteSetupModel>> websiteSetup() async {
    try {
      final result = await remoteDataSource.websiteSetup();
      final data = WebsiteSetupModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Either<Failure, WebsiteSetupModel> getCachedWebsiteSetup() {
    try {
      final result = localDataSource.getWebsiteSetting();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
