import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../product/property_item_model.dart';

class HomePropertyModel extends Equatable {
  final bool visibility;
  final String title;
  final String description;
  final List<PropertyItemModel> properties;

  const HomePropertyModel({
    required this.visibility,
    required this.title,
    required this.description,
    required this.properties,
  });

  HomePropertyModel copyWith({
    bool? visibility,
    String? title,
    String? description,
    List<PropertyItemModel>? properties,
  }) {
    return HomePropertyModel(
      visibility: visibility ?? this.visibility,
      title: title ?? this.title,
      description: description ?? this.description,
      properties: properties ?? this.properties,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'visibility': visibility,
      'title': title,
      'description': description,
      'properties': properties.map((x) => x.toMap()).toList(),
    };
  }

  factory HomePropertyModel.fromMap(Map<String, dynamic> map) {
    return HomePropertyModel(
      visibility: map['visibility'] as bool,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      properties: List<PropertyItemModel>.from(
        (map['properties'] as List<dynamic>).map<PropertyItemModel>(
          (x) => PropertyItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePropertyModel.fromJson(String source) =>
      HomePropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [visibility, title, description, properties];
}
