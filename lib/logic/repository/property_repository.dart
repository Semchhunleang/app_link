import 'package:dartz/dartz.dart';

import '../../data/model/create_property/data_success_create_property.dart';
import '/data/model/create_property/create_property_model.dart';
import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/create_property/edit_info/edit_info_model.dart';
import '../../data/model/product/property_choose_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';
import '../bloc/create_property/bloc/property_create_bloc.dart';

abstract class PropertyRepository {
  Future<Either<Failure, CreatePropertyInfo>> getPropertyCreateInfo(
      String token, String purpose);
  Future<Either<dynamic, DataSuccessCreateProperty>> createProperty(
      PropertyCreateModel data, String token);

  Future<Either<dynamic, String>> updateProperty(
      String id, PropertyCreateModel data, String token);

  Future<Either<dynamic, String>> deleteSliderImage(String id, String token);
  Future<Either<dynamic, String>> deleteProperty(String id, String token);
  Future<Either<dynamic, String>> deleteSingleNearestLocation(
      String id, String token);
  Future<Either<dynamic, String>> deleteSingleAddInfo(String id, String token);
  Future<Either<dynamic, String>> deleteSinglePlan(String id, String token);

  Future<Either<Failure, EditInfoModel>> getPropertyEditInfo(
      String id, String token);
  Future<Either<Failure, PropertyChooseModel>> getPropertyChooseInfo(
      String token);
}

class PropertyRepositoryImp extends PropertyRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  PropertyRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, CreatePropertyInfo>> getPropertyCreateInfo(
      String token, String purpose) async {
    try {
      final result =
          await remoteDataSource.getPropertyCreateInfo(token, purpose);
      final data = CreatePropertyInfo.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, DataSuccessCreateProperty>> createProperty(
      PropertyCreateModel data, String token) async {
    try {
      final result = await remoteDataSource.createPropertyRequest(data, token);
      final datas = DataSuccessCreateProperty.fromMap(result);
      return Right(datas);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, EditInfoModel>> getPropertyEditInfo(
      String id, String token) async {
    try {
      final result = await remoteDataSource.getPropertyEditInfo(id, token);
      print("--------- result");
      print(result);

      final data = EditInfoModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> updateProperty(
      String id, PropertyCreateModel data, String token) async {
    try {
      final result =
          await remoteDataSource.updatePropertyRequest(id, data, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSingleAddInfo(
      String id, String token) async {
    try {
      final result = await remoteDataSource.removeSingleAddInfoApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSingleNearestLocation(
      String id, String token) async {
    try {
      final result =
          await remoteDataSource.removeSingleNearestLocationApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSinglePlan(
      String id, String token) async {
    try {
      final result = await remoteDataSource.removeSinglePlanApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSliderImage(
      String id, String token) async {
    try {
      final result = await remoteDataSource.removeSliderImageApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteProperty(
      String id, String token) async {
    try {
      final result = await remoteDataSource.deleteProperty(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, PropertyChooseModel>> getPropertyChooseInfo(
      String token) async {
    try {
      final result = await remoteDataSource.getPropertyChooseInfo(token);
      final data = PropertyChooseModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
