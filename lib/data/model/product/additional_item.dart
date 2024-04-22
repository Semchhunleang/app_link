import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdditionalInfoItem extends Equatable {
  final int id;
  final int propertyId;
  final String addKey;
  final String addValue;
  final String createdAt;

  const AdditionalInfoItem({
    required this.id,
    required this.propertyId,
    required this.addKey,
    required this.addValue,
    required this.createdAt,
  });

  AdditionalInfoItem copyWith({
    int? id,
    int? propertyId,
    String? addKey,
    String? addValue,
    String? createdAt,
  }) {
    return AdditionalInfoItem(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      addKey: addKey ?? this.addKey,
      addValue: addValue ?? this.addValue,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'add_key': addKey,
      'add_value': addValue,
      'created_at': createdAt,
    };
  }

  factory AdditionalInfoItem.fromMap(Map<String, dynamic> map) {
    return AdditionalInfoItem(
      id: map['id'] ?? 0,
      propertyId: map['property_id'] != null
          ? int.parse(map['property_id'].toString())
          : 0,
      addKey: map['add_key'] ?? '',
      addValue: map['add_value'] ?? '',
      createdAt: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalInfoItem.fromJson(String source) =>
      AdditionalInfoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      propertyId,
      addKey,
      addValue,
      createdAt,
    ];
  }
}
