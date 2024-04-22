// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExistingAddInfo extends Equatable {
  final int id;
  final int propertyId;
  final String addKey;
  final String addValue;
  const ExistingAddInfo({
    required this.id,
    required this.propertyId,
    required this.addKey,
    required this.addValue,
  });

  ExistingAddInfo copyWith({
    int? id,
    int? propertyId,
    String? addKey,
    String? addValue,
  }) {
    return ExistingAddInfo(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      addKey: addKey ?? this.addKey,
      addValue: addValue ?? this.addValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'add_key': addKey,
      'add_value': addValue,
    };
  }

  factory ExistingAddInfo.fromMap(Map<String, dynamic> map) {
    return ExistingAddInfo(
      id: map['id'] as int,
      propertyId: map['property_id'] as int,
      addKey: map['add_key'] as String,
      addValue: map['add_value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExistingAddInfo.fromJson(String source) =>
      ExistingAddInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, propertyId, addKey, addValue];
}
