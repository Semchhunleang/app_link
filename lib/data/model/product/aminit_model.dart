import 'dart:convert';

import 'package:equatable/equatable.dart';

class AminityItemDto extends Equatable {
  final int id;
  final int aminityId;
  final int propertyId;
  final String createdAt;
  final String updatedAt;
  final AminityModel? aminity;

  const AminityItemDto({
    required this.id,
    required this.aminityId,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
    required this.aminity,
  });

  AminityItemDto copyWith({
    int? id,
    int? aminityId,
    int? propertyId,
    String? createdAt,
    String? updatedAt,
    AminityModel? aminity,
  }) {
    return AminityItemDto(
      id: id ?? this.id,
      aminityId: aminityId ?? this.aminityId,
      propertyId: propertyId ?? this.propertyId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      aminity: aminity ?? this.aminity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'aminity_id': aminityId,
      'propert_id': propertyId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'aminity': aminity!.toMap(),
    };
  }

  factory AminityItemDto.fromMap(Map<String, dynamic> map) {
    return AminityItemDto(
      id: map['id'] as int,
      aminityId: map['aminity_id'] != null
          ? int.parse(map['aminity_id'].toString())
          : 0,
      propertyId: map['property_id'] != null
          ? int.parse(map['property_id'].toString())
          : 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      aminity: map['aminity'] != null
          ? AminityModel.fromMap(map['aminity'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AminityItemDto.fromJson(String source) =>
      AminityItemDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      aminityId,
      propertyId,
      createdAt,
      updatedAt,
      aminity!,
    ];
  }
}

class AminityModel extends Equatable {
  final int id;
  final String aminity;

  const AminityModel({
    required this.id,
    required this.aminity,
  });

  AminityModel copyWith({
    int? id,
    String? aminity,
  }) {
    return AminityModel(
      id: id ?? this.id,
      aminity: aminity ?? this.aminity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'aminity': aminity,
    };
  }

  factory AminityModel.fromMap(Map<String, dynamic> map) {
    return AminityModel(
      id: map['id'] ?? 0,
      aminity: map['aminity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AminityModel.fromJson(String source) =>
      AminityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, aminity];
}
