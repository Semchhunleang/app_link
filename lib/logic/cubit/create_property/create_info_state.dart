part of 'create_info_cubit.dart';

abstract class CreateInfoState extends Equatable {
  const CreateInfoState();

  @override
  List<Object> get props => [];
}

class CreateInfoInitial extends CreateInfoState {}

class CreateInfoLoading extends CreateInfoState {}

// class CreateGetCurrentLoading extends CreateInfoState{}

// class CreateGetCurrentPositionSuccess extends CreateInfoState {}

class CreateInfoError extends CreateInfoState {
  final String error;
  final int statusCode;

  const CreateInfoError({required this.error, required this.statusCode});

  @override
  List<Object> get props => [error];
}

class CreateInfoLoaded extends CreateInfoState {
  final CreatePropertyInfo infoData;

  const CreateInfoLoaded({required this.infoData});

  @override
  List<Object> get props => [infoData];
}

class GetCurrentLocation extends CreateInfoState {
  final String latitude;
  final String longitude;

  const GetCurrentLocation({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}

class PropertyChooseInfoLoaded extends CreateInfoState {
  final PropertyChooseModel chooseProperty;

  const PropertyChooseInfoLoaded(this.chooseProperty);

  @override
  List<Object> get props => [chooseProperty];
}

class PropertyLatLng extends CreateInfoState {
  final String latitude;
  final String longitude;

  const PropertyLatLng({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude,longitude ];
}
