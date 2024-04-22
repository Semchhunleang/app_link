// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'existing_add_info_model.dart';
import 'existing_aminity.dart';
import 'existing_plan.dart';
import 'existing_slider.dart';

import '../../category/property_category_model.dart';
import '../../product/aminit_model.dart';
import '../../product/details_property_item.dart';
import '../../product/nearest_location_model.dart';
import '../cities_model.dart';
import 'existing_nearest_location_model.dart';

class EditInfoModel extends Equatable {
  final DetailsPropertyItem property;
  final List<PropertyCategory> types;
  final List<CitiesModel> cities;
  final List<AminityModel> aminities;
  final List<NearestLocationModel> nearestLocations;
  final List<ExistingSlider> existingSliders;
  final List<ExistingAminity> existingAminities;
  final List<ExistingNearestModel> existingNearest;
  final List<ExistingAddInfo> existingAddInfo;
  final List<ExistingPlan> existingPlan;
  const EditInfoModel({
    required this.property,
    required this.types,
    required this.cities,
    required this.aminities,
    required this.nearestLocations,
    required this.existingSliders,
    required this.existingAminities,
    required this.existingNearest,
    required this.existingAddInfo,
    required this.existingPlan,
  });

  EditInfoModel copyWith({
    DetailsPropertyItem? property,
    List<PropertyCategory>? types,
    List<CitiesModel>? cities,
    List<AminityModel>? aminities,
    List<NearestLocationModel>? nearestLocations,
    List<ExistingSlider>? existingSliders,
    List<ExistingAminity>? existingAminities,
    List<ExistingNearestModel>? existingNearest,
    List<ExistingAddInfo>? existingAddInfo,
    List<ExistingPlan>? existingPlan,
  }) {
    return EditInfoModel(
      property: property ?? this.property,
      types: types ?? this.types,
      cities: cities ?? this.cities,
      aminities: aminities ?? this.aminities,
      nearestLocations: nearestLocations ?? this.nearestLocations,
      existingSliders: existingSliders ?? this.existingSliders,
      existingAminities: existingAminities ?? this.existingAminities,
      existingNearest: existingNearest ?? this.existingNearest,
      existingAddInfo: existingAddInfo ?? this.existingAddInfo,
      existingPlan: existingPlan ?? this.existingPlan,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'property': property.toMap(),
      'types': types.map((x) => x.toMap()).toList(),
      'cities': cities.map((x) => x.toMap()).toList(),
      'aminities': aminities.map((x) => x.toMap()).toList(),
      'nearest_locations': nearestLocations.map((x) => x.toMap()).toList(),
      'existing_sliders': existingSliders.map((x) => x.toMap()).toList(),
      'existing_aminities': existingAminities.map((x) => x.toMap()).toList(),
      'existing_nearest_locations':
          existingNearest.map((x) => x.toMap()).toList(),
      'existing_add_informations':
          existingAddInfo.map((x) => x.toMap()).toList(),
      'existing_plans': existingPlan.map((x) => x.toMap()).toList(),
    };
  }

  factory EditInfoModel.fromMap(Map<String, dynamic> map) {
    return EditInfoModel(
      property:
          DetailsPropertyItem.fromMap(map['property'] as Map<String, dynamic>),
      types: List<PropertyCategory>.from(
        (map['types'] as List<dynamic>).map<PropertyCategory>(
          (x) => PropertyCategory.fromMap(x as Map<String, dynamic>),
        ),
      ),
      cities: List<CitiesModel>.from(
        (map['cities'] as List<dynamic>).map<CitiesModel>(
          (x) => CitiesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      aminities: List<AminityModel>.from(
        (map['aminities'] as List<dynamic>).map<AminityModel>(
          (x) => AminityModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      nearestLocations: List<NearestLocationModel>.from(
        (map['nearest_locations'] as List<dynamic>).map<NearestLocationModel>(
          (x) => NearestLocationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      existingSliders: List<ExistingSlider>.from(
        (map['existing_sliders'] as List<dynamic>).map<ExistingSlider>(
          (x) => ExistingSlider.fromMap(x as Map<String, dynamic>),
        ),
      ),
      existingAminities: List<ExistingAminity>.from(
        (map['existing_aminities'] as List<dynamic>).map<ExistingAminity>(
          (x) => ExistingAminity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      existingNearest: List<ExistingNearestModel>.from(
        (map['existing_nearest_locations'] as List<dynamic>)
            .map<ExistingNearestModel>(
          (x) => ExistingNearestModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      existingAddInfo: List<ExistingAddInfo>.from(
        (map['existing_add_informations'] as List<dynamic>)
            .map<ExistingAddInfo>(
          (x) => ExistingAddInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      existingPlan: List<ExistingPlan>.from(
        (map['existing_plans'] as List<dynamic>).map<ExistingPlan>(
          (x) => ExistingPlan.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory EditInfoModel.fromJson(String source) =>
      EditInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      property,
      types,
      cities,
      aminities,
      nearestLocations,
      existingSliders,
      existingAminities,
      existingNearest,
      existingAddInfo,
      existingPlan,
    ];
  }
}
