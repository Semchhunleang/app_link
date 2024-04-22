part of 'agent_cubit.dart';

abstract class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object> get props => [];
}

class AgentInitial extends AgentState {
  const AgentInitial();
  @override
  List<Object> get props => [];
}

class AgentLoading extends AgentState {}
class AgentLoadMore extends AgentState {}

class AgentLoaded extends AgentState {
  final AgentListModel agents;

  const AgentLoaded(this.agents);

  @override
  List<Object> get props => [agents];
}

class AgentError extends AgentState {
  final String message;
  final int statusCode;

  const AgentError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class AgentDetailsLoading extends AgentState {}

class AgentDetailsError extends AgentState {
  final String message;
  final int statusCode;

  const AgentDetailsError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class AgentDetailsLoaded extends AgentState {
  final AgentDetailsModel agentDetailsModel;

  const AgentDetailsLoaded(this.agentDetailsModel);

  @override
  List<Object> get props => [agentDetailsModel];
}

class AgentSendMessageLoading extends AgentState {}

class AgentSendMessageError extends AgentState {
  final String message;
  final int statusCode;

  const AgentSendMessageError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class AgentSendMessageFormValidate extends AgentState {
  final Errors errors;

  const AgentSendMessageFormValidate(this.errors);

  @override
  List<Object> get props => [errors];
}

class AgentSendMessageLoad extends AgentState {
  final String message;

  const AgentSendMessageLoad(this.message);

  @override
  List<Object> get props => [message];
}
