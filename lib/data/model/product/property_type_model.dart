// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyTypeModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final int status;
  final int totalProperty;

  const PropertyTypeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.status,
    required this.totalProperty,
  });

  PropertyTypeModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? icon,
    int? status,
    int? totalProperty,
  }) {
    return PropertyTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      icon: icon ?? this.icon,
      status: status ?? this.status,
      totalProperty: totalProperty ?? this.totalProperty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'icon': icon,
      'status': status,
      'totalProperty': totalProperty,
    };
  }

  factory PropertyTypeModel.fromMap(Map<String, dynamic> map) {
    return PropertyTypeModel(
      id: map['id'] as int,
      name: map['name'] ?? "",
      slug: map['slug'] ?? "",
      icon: map['icon'] ?? "",
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      totalProperty: map['totalProperty'] != null
          ? int.parse(map['totalProperty'].toString())
          : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyTypeModel.fromJson(String source) =>
      PropertyTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      slug,
      icon,
      status,
      totalProperty,
    ];
  }
}
