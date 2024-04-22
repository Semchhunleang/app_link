import 'dart:convert';

import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final bool visibility;
  final String title;
  final String description;
  final List<LocationItemModel> locationForFilter;

  const LocationModel({
    required this.visibility,
    required this.title,
    required this.description,
    required this.locationForFilter,
  });

  LocationModel copyWith({
    bool? visibility,
    String? title,
    String? description,
    List<LocationItemModel>? locationForFilter,
  }) {
    return LocationModel(
      visibility: visibility ?? this.visibility,
      title: title ?? this.title,
      description: description ?? this.description,
      locationForFilter: locationForFilter ?? this.locationForFilter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'visibility': visibility,
      'title': title,
      'description': description,
      'location_for_filter': locationForFilter.map((x) => x.toMap()).toList(),
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      visibility: map['visibility'] as bool,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      locationForFilter: List<LocationItemModel>.from(
        (map['location_for_filter'] as List<dynamic>).map<LocationItemModel>(
          (x) => LocationItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [visibility, title, description, locationForFilter];
}

class LocationItemModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int totalProperty;

  const LocationItemModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.totalProperty,
  });

  LocationItemModel copyWith({
    int? id,
    String? name,
    String? slug,
    int? totalProperty,
  }) {
    return LocationItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      totalProperty: totalProperty ?? this.totalProperty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'totalProperty': totalProperty,
    };
  }

  factory LocationItemModel.fromMap(Map<String, dynamic> map) {
    return LocationItemModel(
      id: map['id'] as int,
      name: map['name'] ?? "",
      slug: map['slug'] ?? "",
      totalProperty: map['totalProperty'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationItemModel.fromJson(String source) =>
      LocationItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, slug, totalProperty];
}
