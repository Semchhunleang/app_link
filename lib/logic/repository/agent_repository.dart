import 'package:dartz/dartz.dart';

import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/agent/agent_details_model.dart';
import '../../data/model/agent/agent_list_model.dart';
import '../../presentation/error/exception.dart';
import '../cubit/agent/agent_state_model.dart';

abstract class AgentRepository {
  Future<Either<Failure, AgentListModel>> getAllAgent();
  Future<Either<Failure, AgentListModel>> getAllAgentByPage(String page);

  

  Future<Either<Failure, AgentDetailsModel>> getAgentDetails(String userName);

  Future<Either<Failure, String>> sendMessageToAgent(AgentStateModel messages);
}

class AgentRepositoryImpl implements AgentRepository {
  final RemoteDataSource remoteDataSource;

  AgentRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, AgentListModel>> getAllAgent() async {
    try {
      final result = await remoteDataSource.getAllAgent();
      final data = AgentListModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, AgentListModel>> getAllAgentByPage(String page) async {
    try {
      final result = await remoteDataSource.getAllAgentByPage(page);
      final data = AgentListModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  

  @override
  Future<Either<Failure, AgentDetailsModel>> getAgentDetails(
      String userName) async {
    try {
      final result = await remoteDataSource.getAgentDetails(userName);
      final data = AgentDetailsModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> sendMessageToAgent(
      AgentStateModel messages) async {
    try {
      final result = await remoteDataSource.sendMessageToAgent(messages);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }
}
