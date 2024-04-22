import 'package:dartz/dartz.dart';
import 'package:real_estate/presentation/error/exception.dart';

import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/api_model/setting_api_model.dart';
import '../../presentation/error/failure.dart';

abstract class SettingRepository {
  Future<Either<Failure, SettingApiModel>> getSettings();
}

class SettingRepositoryImpl implements SettingRepository {
  final RemoteDataSource remoteDataSource;

  const SettingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SettingApiModel>> getSettings() async {
    try {
      final result = await remoteDataSource.getSettings();
      final data = SettingApiModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
