import 'dart:convert';

import 'package:equatable/equatable.dart';

class SliderImage extends Equatable {
  final int id;
  final int propertyId;
  final String image;
  final String createdAt;
  final String updatedAt;

  const SliderImage({
    required this.id,
    required this.propertyId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  SliderImage copyWith({
    int? id,
    int? propertyId,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return SliderImage(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SliderImage.fromMap(Map<String, dynamic> map) {
    return SliderImage(
      id: map['id'] ?? 0,
      propertyId: map['property_id'] != null
          ? int.parse(map['property_id'].toString())
          : 0,
      image: map['image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SliderImage.fromJson(String source) =>
      SliderImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      propertyId,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
