// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:real_estate/data/model/product/property_type_model.dart';

class HomeCategory extends Equatable {
  final bool visibility;
  final List<PropertyTypeModel> propertyTypes;
  const HomeCategory({
    required this.visibility,
    required this.propertyTypes,
  });

  HomeCategory copyWith({
    bool? visibility,
    List<PropertyTypeModel>? propertyTypes,
  }) {
    return HomeCategory(
      visibility: visibility ?? this.visibility,
      propertyTypes: propertyTypes ?? this.propertyTypes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'visibility': visibility,
      'property_types': propertyTypes.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeCategory.fromMap(Map<String, dynamic> map) {
    return HomeCategory(
      visibility: map['visibility'] as bool,
      propertyTypes: List<PropertyTypeModel>.from(
        (map['property_types'] as List<dynamic>).map<PropertyTypeModel>(
          (x) => PropertyTypeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeCategory.fromJson(String source) =>
      HomeCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [visibility, propertyTypes];
}
