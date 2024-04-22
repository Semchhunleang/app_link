part of 'apier_bloc.dart';

abstract class ApierState extends Equatable {
  const ApierState();
  
  @override
  List<Object> get props => [];
}

class ApierInitial extends ApierState {}
