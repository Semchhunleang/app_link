// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CitiesModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int showHomepage;
  final String image;
  final int serial;
  final String createdAt;
  final String updatedAt;
  final int totalProperty;
  const CitiesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.showHomepage,
    required this.image,
    required this.serial,
    required this.createdAt,
    required this.updatedAt,
    required this.totalProperty,
  });

  CitiesModel copyWith({
    int? id,
    String? name,
    String? slug,
    int? showHomepage,
    String? image,
    int? serial,
    String? createdAt,
    String? updatedAt,
    int? totalProperty,
  }) {
    return CitiesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      showHomepage: showHomepage ?? this.showHomepage,
      image: image ?? this.image,
      serial: serial ?? this.serial,
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
      'showHomepage': showHomepage,
      'image': image,
      'serial': serial,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'totalProperty': totalProperty,
    };
  }

  factory CitiesModel.fromMap(Map<String, dynamic> map) {
    return CitiesModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      slug: map['slug'] ?? "",
      showHomepage: map['show_homepage'] ?? 0,
      image: map['image'] ?? "",
      serial: map['serial'] ?? 0,
      createdAt: map['created_at'] ?? "",
      updatedAt: map['updated_at'] ?? "",
      totalProperty: map['totalProperty'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CitiesModel.fromJson(String source) =>
      CitiesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      slug,
      showHomepage,
      image,
      serial,
      createdAt,
      updatedAt,
      totalProperty,
    ];
  }
}
