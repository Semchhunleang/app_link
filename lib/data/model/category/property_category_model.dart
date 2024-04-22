// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyCategory extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final String image;
  final int status;
  final String createdAt;
  final String updatedAt;
  final int totalProperty;
  const PropertyCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.totalProperty,
  });

  PropertyCategory copyWith({
    int? id,
    String? name,
    String? slug,
    String? icon,
    String? image,
    int? status,
    String? createdAt,
    String? updatedAt,
    int? totalProperty,
  }) {
    return PropertyCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalProperty: totalProperty ?? this.totalProperty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'icon': icon,
      'image': image,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'totalProperty': totalProperty,
    };
  }

  factory PropertyCategory.fromMap(Map<String, dynamic> map) {
    return PropertyCategory(
      id: map['id'] as int,
      name: map['name'] ?? "",
      slug: map['slug'] ?? "",
      icon: map['icon'] ?? "",
      image: map['image'] ?? "",
      status: map['status'] as int,
      createdAt: map['created_at'] ?? "",
      updatedAt: map['updated_at'] ?? "",
      totalProperty: map['totalProperty'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyCategory.fromJson(String source) =>
      PropertyCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      slug,
      icon,
      image,
      status,
      createdAt,
      updatedAt,
      totalProperty,
    ];
  }
}
