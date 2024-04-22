import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/agent/agent_profile_model.dart';
import '../../data/model/auth/login/user_data_model.dart';
import '../../data/model/auth/user_profile_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';
import '../cubit/change_password/change_password_cubit.dart';
import '../cubit/profile/profile_state_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> passwordChange(
    ChangePasswordStateModel changePassData,
    String token,
  );

  Future<Either<Failure, AgentProfileModel>> getAgentDashboardInfo(
      String token);

  //--------------- old api get user info --------------------
  Future<Either<Failure, UserProfileModel>> getAgentProfile(String token);
  //----------------- new api get user info --------------------
  Future<Either<Failure, UserDataModel>> getUserProfile(String token);
//---------------- old api update user info -------------------
  Future<Either<dynamic, String>> updateAgentProfileInfo(
      String token, ProfileStateModel body);
//------------- new api update user info --------------------
  Future<Either<dynamic, String>> updateUserProfileInfo(
      String token, ProfileStateModel body);
}

class ProfileRepositoryImp extends ProfileRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ProfileRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  // @override
  // Future<bool> clearUserProfile() {
  //   return localDataSource.clearUserProfile();
  // }

  @override
  Future<Either<Failure, String>> passwordChange(
    ChangePasswordStateModel changePassData,
    String token,
  ) async {
    try {
      final result =
          await remoteDataSource.passwordChange(changePassData, token);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, AgentProfileModel>> getAgentDashboardInfo(
      String token) async {
    try {
      final result = await remoteDataSource.getAgentDashboardInfo(token);
      final data = AgentProfileModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

//--------------- old api of update user profile
  @override
  Future<Either<dynamic, String>> updateAgentProfileInfo(
      String token, ProfileStateModel body) async {
    debugPrint("------ profile repository update : $body");
    try {
      final result = await remoteDataSource.updateAgentProfileInfo(token, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

//------------------- new api of update user profile ---------------
  @override
  Future<Either<dynamic, String>> updateUserProfileInfo(
      String token, ProfileStateModel body) async {
    debugPrint("------ profile repository update : $body");
    try {
      final result = await remoteDataSource.updateUserProfileInfo(token, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

//------------------- new api get user info ------------------
  @override
  Future<Either<Failure, UserDataModel>> getUserProfile(String token) async {
    try {
      final result = await remoteDataSource.getUserProfile(token);
      final data = UserDataModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  //---------- old api get user info --------------------
  @override
  Future<Either<Failure, UserProfileModel>> getAgentProfile(
      String token) async {
    try {
      final result = await remoteDataSource.getAgentProfile(token);
      final data = UserProfileModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
