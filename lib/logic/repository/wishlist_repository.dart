import 'package:dartz/dartz.dart';

import '/data/model/wishlist/wishlist_model.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';

abstract class WishListRepository {
  Future<Either<Failure, WishListModel>> getWishListProperties(String token);

  Future<Either<Failure, String>> addToWishlist(String token, String id);

  Future<Either<Failure, String>> removeFromWishlist(String token, String id);
}

class WishListRepositoryImpl implements WishListRepository {
  final RemoteDataSource remoteDataSource;

  const WishListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WishListModel>> getWishListProperties(
      String token) async {
    try {
      final result = await remoteDataSource.getWishListProperties(token);
      final data = WishListModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> addToWishlist(String token, String id) async {
    try {
      final result = await remoteDataSource.addToWishlist(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromWishlist(
      String token, String id) async {
    try {
      final result = await remoteDataSource.removeFromWishlist(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
