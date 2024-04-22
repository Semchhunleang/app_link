
import 'package:dartz/dartz.dart';
import 'package:real_estate/data/data_provider/remote_data_source.dart';
import 'package:real_estate/data/model/apier/detail_apier_byfilter_model.dart';
import 'package:real_estate/data/model/apier/summary_model.dart';
import 'package:real_estate/presentation/error/failure.dart';
import '../../data/model/apier/filter_options_model.dart';
import '../../presentation/error/exception.dart';

abstract class ApierRepository{

  Future<Either<Failure, FilterOptionsModel>> getFilterOption(String token);

  Future<Either<Failure, SummaryApierModel>> getSummaryData(String token, String startDate, String endDate);

  Future<Either<Failure, DetailApierByFilterModel>> getApierDetailByFilter(String token, String startDate, String endDate, String depth);

  }

class ApierRepositoryImp extends ApierRepository{
  final RemoteDataSource remoteDataSource;

  ApierRepositoryImp({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, FilterOptionsModel>> getFilterOption(String token) async{
    try {
      final result = await remoteDataSource.filterOptionAPIer(token);
      final data = FilterOptionsModel.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, SummaryApierModel>> getSummaryData(String token, String startDate, String endDate) async{
    try {
      final result = await remoteDataSource.getSummaryData(token, startDate, endDate);

      final data = SummaryApierModel.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, DetailApierByFilterModel>> getApierDetailByFilter(String token, String startDate, String endDate, String depth) async{
    try {
      final result = await remoteDataSource.getApierDetailByFilter(token, startDate, endDate, depth);
      final data = DetailApierByFilterModel.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  

  


}
