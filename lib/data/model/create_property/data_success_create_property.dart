import 'dart:convert';

import 'package:equatable/equatable.dart';

class DataSuccessCreateProperty extends Equatable {
  final String message;
  final int id;

  const DataSuccessCreateProperty({this.message = "", this.id = 0});

  DataSuccessCreateProperty copyWith({String? message, int? id}) {
    return DataSuccessCreateProperty(
        message: message ?? this.message, id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'id': id,
    };
  }

  factory DataSuccessCreateProperty.fromMap(Map<String, dynamic> map) {
    return DataSuccessCreateProperty(
      message: map['message'] as String,
      id: map['id'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSuccessCreateProperty.fromJson(String source) =>
      DataSuccessCreateProperty.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, id];
}
