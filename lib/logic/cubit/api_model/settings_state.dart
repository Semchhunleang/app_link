import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/api_model/setting_api_model.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}

class SettingLoading extends SettingState {}

class SettingLoaded extends SettingState {
  final SettingApiModel settingApiMode;

  const SettingLoaded(this.settingApiMode);

  @override
  List<Object> get props => [settingApiMode];
}

class SettingError extends SettingState {
  final String message;
  final int statusCode;

  const SettingError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
