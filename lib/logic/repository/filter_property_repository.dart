import 'package:dartz/dartz.dart';

import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/filter/filter_property_list_model.dart';
import '../../presentation/error/exception.dart';

abstract class FilterPropertyRepository {
  Future<Either<Failure, FilterPropertyListModel>> getAllProperty();
  Future<Either<Failure, FilterPropertyListModel>> getPropertyByPage(String numPage);

  Future<Either<Failure, FilterPropertyListModel>> getFilterProperty(Uri uri);
}

class FilterPropertyRepositoryImpl implements FilterPropertyRepository {
  final RemoteDataSource remoteDataSource;

  const FilterPropertyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FilterPropertyListModel>> getAllProperty() async {
    try {
      final result = await remoteDataSource.getAllProperty();
      final data = FilterPropertyListModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, FilterPropertyListModel>> getPropertyByPage(String numPage) async {
    try {
      final result = await remoteDataSource.getPropertyByPage(numPage);
      final data = FilterPropertyListModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, FilterPropertyListModel>> getFilterProperty(
      Uri uri) async {
    try {
      final result = await remoteDataSource.getFilterProperty(uri);
      final data = FilterPropertyListModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
