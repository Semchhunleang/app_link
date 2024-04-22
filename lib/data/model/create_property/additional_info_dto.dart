// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdditionalInfoDto extends Equatable {
  final int id;
  final String addKeys;
  final String addValues;

  const AdditionalInfoDto({
    this.id = 0,
    required this.addKeys,
    required this.addValues,
  });

  AdditionalInfoDto copyWith({
    int? id,
    String? addKeys,
    String? addValues,
  }) {
    return AdditionalInfoDto(
      id: id ?? this.id,
      addKeys: addKeys ?? this.addKeys,
      addValues: addValues ?? this.addValues,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'add_keys': addKeys,
      'add_values': addValues,
    };
  }

  factory AdditionalInfoDto.fromMap(Map<String, dynamic> map) {
    return AdditionalInfoDto(
      id: map['id'] ?? 0,
      addKeys: map['add_keys'] as String,
      addValues: map['add_values'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalInfoDto.fromJson(String source) =>
      AdditionalInfoDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, addKeys, addValues];
}
