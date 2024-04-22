import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/data/model/auth/request_otp_model.dart';

import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/auth/login/login_data_model.dart';
import '../../data/model/auth/verify_otp_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';

abstract class AuthRepository {
  Future<Either<dynamic, LoginDataModel>> login(Map<String, dynamic> body);

  Either<Failure, LoginDataModel> getCashedUserInfo();

  Future<Either<dynamic, String>> signUp(Map<String, dynamic> body);

  Future<Either<dynamic, String>> sendForgotPassCode(Map<String, dynamic> body);

  // Future<Either<dynamic, String>> setPassword(SetPasswordModel body);
  Future<Either<dynamic, String>> verifyForgotPassword(
      Map<String, dynamic> body);

  Future<Either<Failure, String>> sendActiveAccountCode(String email);

  Future<Either<Failure, String>> activeAccountCodeSubmit(
      Map<String, String> body);

  Future<Either<dynamic, String>> resendVerificationCode(
      Map<String, String> email);

  Future<Either<Failure, String>> logOut(String token);

  Future<Either<Failure, RequestOtpModel>> requestOtp(
      Map<String, dynamic> body);
  //Future<Either<dynamic, String>> verifyOtp(Map<String, dynamic> body);
  Future<Either<Failure, String>> verifyOtp(VerifyOtpModel body);
  // Future verifyOtp(Map<String, dynamic> body);
}

class AuthRepositoryImp extends AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AuthRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });
//------- old api login ------
  // @override
  // Future<Either<dynamic, UserLoginResponseModel>> login(
  //     Map<String, dynamic> body) async {
  //   try {
  //     final result = await remoteDataSource.signIn(body);
  //     final data = UserLoginResponseModel.fromMap(result);
  //     localDataSource.cacheUserResponse(data);

  //     return Right(data);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   } on InvalidAuthData catch (e) {
  //     return Left(InvalidAuthData(e.errors));
  //   }
  // }

  // -----  login with new api model -----------
  @override
  Future<Either<dynamic, LoginDataModel>> login(
      Map<String, dynamic> body) async {
    debugPrint("----- repo login 1");
    try {
      debugPrint("----- repo login 2");
      final result = await remoteDataSource.login(body);
      debugPrint("----- repo login 3 : $result");
      final data = LoginDataModel.fromMap(result);
      debugPrint("----- repo login  4 : ${data.tokenModel.accessToken}");
      localDataSource.cacheUserResponse(data);
      debugPrint("----- repo login 5");

      return Right(data);
    } on ServerException catch (e) {
      debugPrint("----- repo login 6");
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      debugPrint("----- repo login 7");
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, String>> logOut(String token) async {
    try {
      final result = await remoteDataSource.logOut(token);
      localDataSource.clearUserProfile();
      // localDataSource.clearCoupon();
      // localDataSource.clearCoupon();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Either<Failure, LoginDataModel> getCashedUserInfo() {
    try {
      final result = localDataSource.getUserResponseModel();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<dynamic, String>> signUp(Map<String, dynamic> body) async {
    debugPrint("repository sign up 1 : $body");
    try {
      final result = await remoteDataSource.userRegister(body);
      debugPrint("repository sign up : $result");
      return Right(result);
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, String>> sendForgotPassCode(
      Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.sendForgotPassCode(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  // @override
  // Future<Either<dynamic, String>> setPassword(SetPasswordModel body) async {
  //   try {
  //     final result = await remoteDataSource.setPassword(body);
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   } on InvalidAuthData catch (e) {
  //     return Left(InvalidAuthData(e.errors));
  //   }
  // }

  @override
  Future<Either<Failure, String>> sendActiveAccountCode(String email) async {
    try {
      final result = await remoteDataSource.sendActiveAccountCode(email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> activeAccountCodeSubmit(
      Map<String, String> body) async {
    try {
      final result = await remoteDataSource.activeAccountCodeSubmit(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, String>> resendVerificationCode(
      Map<String, String> email) async {
    try {
      final result = await remoteDataSource.resendVerificationCode(email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, RequestOtpModel>> requestOtp(
      Map<String, dynamic> body) async {
    debugPrint("-----  result request otp 1 : $body");
    try {
      debugPrint("-----  result request otp 2 : $body");
      final result = await remoteDataSource.requestOtp(body);
      debugPrint("-----  result request otp : $result");
      final data = RequestOtpModel.fromMap(result);
      debugPrint("-----  data request otp : $data");
      return Right(data);
    } on ServerException catch (e) {
      debugPrint("------ error request otp : ${e.message}");
      return Left(ServerFailure(e.message, e.statusCode));
    }
    // throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> verifyOtp(VerifyOtpModel body) async {
    try {
      final result = await remoteDataSource.verifyOtp(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

//---------- verify forgot password -------
  @override
  Future<Either<dynamic, String>> verifyForgotPassword(
      Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.verifyForgotPassword(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  // @override
  // Future<Either<dynamic, String>> verifyOtp(Map<String, dynamic> body) async {
  //   try {
  //     final result = await remoteDataSource.verifyOtp(body);
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   } on InvalidAuthData catch (e) {
  //     return Left(InvalidAuthData(e.errors));
  //   }
  // }
}
