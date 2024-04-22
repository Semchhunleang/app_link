import 'package:dartz/dartz.dart';

import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/search_response_model/search_response_model.dart';
import '../../presentation/error/exception.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchResponseModel>> getSearchProperty(Uri uri);
}

class SearchRepositoryImpl implements SearchRepository {
  final RemoteDataSource remoteDataSource;

  const SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SearchResponseModel>> getSearchProperty(
      Uri uri) async {
    try {
      final result = await remoteDataSource.getSearchProperty(uri);
      final data = SearchResponseModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
