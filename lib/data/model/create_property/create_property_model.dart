// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../category/property_category_model.dart';
import '../product/aminit_model.dart';
import '../product/nearest_location_model.dart';
import 'cities_model.dart';

class CreatePropertyInfo extends Equatable {
  final List<PropertyCategory> types;
  final List<CitiesModel> cities;
  final List<AminityModel> aminities;
  final List<NearestLocationModel> nearestLocations;
  final String requestPurpose;
  const CreatePropertyInfo({
    required this.types,
    required this.cities,
    required this.aminities,
    required this.nearestLocations,
    required this.requestPurpose,
  });

  CreatePropertyInfo copyWith({
    List<PropertyCategory>? types,
    List<CitiesModel>? cities,
    List<AminityModel>? aminities,
    List<NearestLocationModel>? nearestLocations,
    String? requestPurpose,
  }) {
    return CreatePropertyInfo(
      types: types ?? this.types,
      cities: cities ?? this.cities,
      aminities: aminities ?? this.aminities,
      nearestLocations: nearestLocations ?? this.nearestLocations,
      requestPurpose: requestPurpose ?? this.requestPurpose,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'types': types.map((x) => x.toMap()).toList(),
      'cities': cities.map((x) => x.toMap()).toList(),
      'aminities': aminities.map((x) => x.toMap()).toList(),
      'nearestLocations': nearestLocations.map((x) => x.toMap()).toList(),
      'requestPurpose': requestPurpose,
    };
  }

  factory CreatePropertyInfo.fromMap(Map<String, dynamic> map) {
    return CreatePropertyInfo(
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
      requestPurpose: map['request_purpose'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePropertyInfo.fromJson(String source) =>
      CreatePropertyInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      types,
      cities,
      aminities,
      nearestLocations,
      requestPurpose,
    ];
  }
}
