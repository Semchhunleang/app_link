part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class HomeDataLoaded extends HomeState {
  final HomeDataModel homeDataLoaded;
  const HomeDataLoaded({required this.homeDataLoaded});

  @override
  List<Object> get props => [homeDataLoaded];
}
