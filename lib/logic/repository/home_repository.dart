import 'package:dartz/dartz.dart';
import 'package:real_estate/data/model/home/home_property_model.dart';

import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/home/home_data_model.dart';
import '../../data/model/product/single_property_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';

abstract class HomeRepository {
  Future<Either<dynamic, HomeDataModel>> getHomeData();
  Future<Either<dynamic, SinglePropertyModel>> getSingleProperty(String slug);
}

class HomeRepositoryImp extends HomeRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  HomeRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<dynamic, HomeDataModel>> getHomeData() async {
    try {
      final result = await remoteDataSource.getHomeData();
      final data = HomeDataModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, SinglePropertyModel>> getSingleProperty(String slug) async {
    try {
      final result = await remoteDataSource.getSinglePropertyDetails(slug);
      final data = SinglePropertyModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
