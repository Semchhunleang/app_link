import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/product/property_agent.dart';
import 'package:real_estate/data/model/product/property_plan_model.dart';

import 'additional_item.dart';
import 'aminit_model.dart';
import 'details_property_item.dart';
import 'nearest_location_model.dart';
import 'review_model.dart';
import 'slider_image_model.dart';

class SinglePropertyModel extends Equatable {
  final DetailsPropertyItem? propertyItemModel;
  final List<SliderImage>? sliders;
  final List<AminityItemDto>? aminities;
  final List<NearestLocationItem>? nearestLocations;
  final List<AdditionalInfoItem>? additionalInformations;
  final List<Review>? reviews;
  final List<PropertyPlan>? propertyPlans;
  final PropertyAgent? propertyAgent;

  const SinglePropertyModel({
    required this.propertyItemModel,
    required this.sliders,
    required this.aminities,
    required this.nearestLocations,
    required this.additionalInformations,
    required this.reviews,
    required this.propertyPlans,
    required this.propertyAgent,
  });

  SinglePropertyModel copyWith({
    DetailsPropertyItem? propertyItemModel,
    List<SliderImage>? sliders,
    List<AminityItemDto>? aminities,
    List<NearestLocationItem>? nearestLocations,
    List<AdditionalInfoItem>? additionalInformations,
    List<Review>? reviews,
    List<PropertyPlan>? propertyPlans,
    PropertyAgent? propertyAgent,
  }) {
    return SinglePropertyModel(
      propertyItemModel: propertyItemModel ?? this.propertyItemModel,
      sliders: sliders ?? this.sliders,
      aminities: aminities ?? this.aminities,
      nearestLocations: nearestLocations ?? this.nearestLocations,
      additionalInformations:
          additionalInformations ?? this.additionalInformations,
      reviews: reviews ?? this.reviews,
      propertyPlans: propertyPlans ?? this.propertyPlans,
      propertyAgent: propertyAgent ?? this.propertyAgent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'property': propertyItemModel!.toMap(),
      'sliders': sliders!.map((x) => x.toMap()).toList(),
      'aminities': aminities!.map((x) => x.toMap()).toList(),
      'nearest_locations': nearestLocations!.map((x) => x.toMap()).toList(),
      'additional_informations':
          additionalInformations!.map((x) => x.toMap()).toList(),
      'reviews': reviews!.map((x) => x.toMap()).toList(),
      'property_plans': propertyPlans!.map((x) => x.toMap()).toList(),
      'property_agent': propertyAgent!.toMap(),
    };
  }

  factory SinglePropertyModel.fromMap(Map<String, dynamic> map) {
    return SinglePropertyModel(
      propertyItemModel: map['property'] != null
          ? DetailsPropertyItem.fromMap(map['property'] as Map<String, dynamic>)
          : null,
      sliders: map['sliders'] != null
          ? List<SliderImage>.from(
              (map['sliders'] as List<dynamic>).map<SliderImage>(
                (x) => SliderImage.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      aminities: map['aminities'] != null
          ? List<AminityItemDto>.from(
              (map['aminities'] as List<dynamic>).map<AminityItemDto>(
                (x) => AminityItemDto.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      nearestLocations: map['nearest_locations'] != null
          ? List<NearestLocationItem>.from(
              (map['nearest_locations'] as List<dynamic>)
                  .map<NearestLocationItem>(
                (x) => NearestLocationItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      additionalInformations: map['additional_informations'] != null
          ? List<AdditionalInfoItem>.from(
              (map['additional_informations'] as List<dynamic>)
                  .map<AdditionalInfoItem>(
                (x) => AdditionalInfoItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      reviews: map['reviews']['data'] != null
          ? List<Review>.from(
              (map['reviews']['data'] as List<dynamic>).map<Review>(
                (x) => Review.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      propertyPlans: map['property_plans'] != null
          ? List<PropertyPlan>.from(
              (map['property_plans'] as List<dynamic>).map<PropertyPlan>(
                (x) => PropertyPlan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      propertyAgent: map['property_agent'] != null
          ? PropertyAgent.fromMap(map['property_agent'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SinglePropertyModel.fromJson(String source) =>
      SinglePropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      propertyItemModel!,
      sliders!,
      aminities!,
      nearestLocations!,
      additionalInformations!,
      reviews!,
      propertyPlans!,
      propertyAgent!,
    ];
  }
}
