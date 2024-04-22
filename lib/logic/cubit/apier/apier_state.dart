part of 'apier_cubit.dart';

abstract class ApierState extends Equatable {
  const ApierState();

  @override
  List<Object> get props => [];
}

class ApierInitial extends ApierState {
  const ApierInitial();
}

class ApierLoading extends ApierState {}

class ApierLoaded extends ApierState {
  final FilterOptionsModel? filterData;
  final SummaryApierModel? summaryData;

  const ApierLoaded({this.filterData, this.summaryData});

  @override
  List<Object> get props => [filterData!, summaryData!];
}

class ApierError extends ApierState {
  final String message;
  final int statusCode;

  const ApierError({required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}
