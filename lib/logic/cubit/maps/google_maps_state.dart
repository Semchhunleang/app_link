part of 'google_maps_cubit.dart';

abstract class GoogleMapsState extends Equatable {
  const GoogleMapsState();

  @override
  List<Object> get props => [];
}

class GoogleMapsInitial extends GoogleMapsState {
  const GoogleMapsInitial();
}

class GoogleMapsLoading extends GoogleMapsState {}

class GoogleMapsGetPositionLoaded extends GoogleMapsState{}