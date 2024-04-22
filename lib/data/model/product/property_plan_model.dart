import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyPlan extends Equatable {
  final int id;
  final int propertyId;
  final String title;
  final String description;
  final String image;
  final String createdAt;
  final String updatedAt;

  const PropertyPlan({
    required this.id,
    required this.propertyId,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  PropertyPlan copyWith({
    int? id,
    int? propertyId,
    String? title,
    String? description,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return PropertyPlan(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'propertyId': propertyId,
      'title': title,
      'description': description,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory PropertyPlan.fromMap(Map<String, dynamic> map) {
    return PropertyPlan(
      id: map['id'] ?? 0,
      propertyId: map['property_id'] != null
          ? int.parse(map['property_id'].toString())
          : 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyPlan.fromJson(String source) =>
      PropertyPlan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      propertyId,
      title,
      description,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
