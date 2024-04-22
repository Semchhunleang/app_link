// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExistingAminity extends Equatable {
  final int id;

  final int aminityId;
  final int propertyId;
  const ExistingAminity({
    required this.id,
    required this.aminityId,
    required this.propertyId,
  });

  ExistingAminity copyWith({
    int? id,
    int? aminityId,
    int? propertyId,
  }) {
    return ExistingAminity(
      id: id ?? this.id,
      aminityId: aminityId ?? this.aminityId,
      propertyId: propertyId ?? this.propertyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'aminity_id': aminityId,
      'property_id': propertyId,
    };
  }

  factory ExistingAminity.fromMap(Map<String, dynamic> map) {
    return ExistingAminity(
      id: map['id'] as int,
      aminityId: map['aminity_id'] as int,
      propertyId: map['property_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExistingAminity.fromJson(String source) => ExistingAminity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, aminityId, propertyId];
}
