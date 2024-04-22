import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/api_model/data_settings.dart';

class SettingApiModel extends Equatable {
  final String status;
  final String message;
  final DataSettings? dataSettings;

  const SettingApiModel(
      {required this.message, required this.status, this.dataSettings});

  SettingApiModel copyWith({
    String? status,
    String? message,
    DataSettings? dataSettings,
  }) {
    return SettingApiModel(
      status: status ?? this.status,
      message: message ?? this.message,
      dataSettings: dataSettings ?? this.dataSettings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': dataSettings!.toMap(),
    };
  }

  factory SettingApiModel.fromMap(Map<String, dynamic> map) {
    return SettingApiModel(
      status: map['status'] ?? "",
      message: map['message'] ?? "",
      dataSettings: map['data'] != null
          ? DataSettings.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingApiModel.fromJson(String source) =>
      SettingApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, dataSettings];
}
