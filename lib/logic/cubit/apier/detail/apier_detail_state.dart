part of 'apier_detail_cubit.dart';

abstract class ApierDetailState extends Equatable {
  const ApierDetailState();
  @override
  List<Object> get props => [];
}

class ApierDetailInitial extends ApierDetailState {}
class ApierDetailLoaded extends ApierDetailState {}
class ApierDetailLoading extends ApierDetailState{}

class ApierDetailError extends ApierDetailState {
  final String error;
  final int statusCode;

  const ApierDetailError({required this.error, required this.statusCode});

  @override
  List<Object> get props => [error];
}
