import 'package:dartz/dartz.dart';

import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/about_us/about_us_model.dart';
import '../../data/model/contact_us/contact_us_model.dart';
import '../../presentation/error/exception.dart';
import '../cubit/contact_us/contact_us_state_model.dart';

abstract class ContactUsRepository {
  Future<Either<Failure, ContactUsModel>> getContactUs();

  Future<Either<Failure, AboutUsModel>> getAboutUs();

  Future<Either<Failure, String>> sendContactUsMessage(
      ContactUsStateModel body);
}

class ContactUsRepositoryImpl implements ContactUsRepository {
  final RemoteDataSource remoteDataSource;

  const ContactUsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ContactUsModel>> getContactUs() async {
    try {
      final result = await remoteDataSource.getContactUs();
      final data = ContactUsModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, AboutUsModel>> getAboutUs() async {
    try {
      final result = await remoteDataSource.getAboutUs();
      final data = AboutUsModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {

      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> sendContactUsMessage(
      ContactUsStateModel body) async {
    try {
      final result = await remoteDataSource.sendContactUsMessage(body);
      return Right(result);
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
