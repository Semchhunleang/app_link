// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyPlanDto extends Equatable {
  final int id;
  final String planImages;
  final String planTitles;
  final String planDescriptions;

  const PropertyPlanDto({
    this.id = 0,
    required this.planImages,
    required this.planTitles,
    required this.planDescriptions,
  });

  PropertyPlanDto copyWith({
    int? id,
    String? planImages,
    String? planTitles,
    String? planDescriptions,
  }) {
    return PropertyPlanDto(
      id: id ?? this.id,
      planImages: planImages ?? this.planImages,
      planTitles: planTitles ?? this.planTitles,
      planDescriptions: planDescriptions ?? this.planDescriptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'plan_images': planImages,
      'plan_titles': planTitles,
      'plan_descriptions': planDescriptions,
    };
  }

  factory PropertyPlanDto.fromMap(Map<String, dynamic> map) {
    return PropertyPlanDto(
      id: map['id'] ?? 0,
      planImages: map['plan_images'] ?? "",
      planTitles: map['plan_titles'] as String,
      planDescriptions: map['plan_descriptions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyPlanDto.fromJson(String source) =>
      PropertyPlanDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, planImages, planTitles, planDescriptions];
}
