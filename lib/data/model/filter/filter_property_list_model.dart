import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/user_profile_model.dart';
import '../contact_us/contact_us_model.dart';
import '../home/location_model.dart';
import '../product/property_type_model.dart';
import '../search_response_model/search_response_model.dart';

class FilterPropertyListModel extends Equatable {
  final SeoSettingModel? seoSetting;
  final List<LocationItemModel>? location;
  final List<PropertyTypeModel>? propertyType;
  final List<UserProfileModel>? sliderAgent;
  final SearchResponseModel? properties;
  final int maxBedRooms;
  final int maxBathRooms;
  final double maxArea;
  final double maxPrice;

  const FilterPropertyListModel({
    this.seoSetting,
    this.location,
    this.propertyType,
    this.sliderAgent,
    this.properties,
    required this.maxBedRooms,
    required this.maxBathRooms,
    required this.maxArea,
    required this.maxPrice,
  });

  // "max_bed_room": 12,
  // "max_bath_room": 10,
  // "max_area": 6500,
  // "max_price": 5000

  FilterPropertyListModel copyWith({
    SeoSettingModel? seoSetting,
    List<LocationItemModel>? location,
    List<PropertyTypeModel>? propertyType,
    List<UserProfileModel>? sliderAgent,
    SearchResponseModel? properties,
    int? maxBedRooms,
    int? maxBathRooms,
    double? maxArea,
    double? maxPrice,
  }) {
    return FilterPropertyListModel(
      seoSetting: seoSetting ?? this.seoSetting,
      location: location ?? this.location,
      propertyType: propertyType ?? this.propertyType,
      sliderAgent: sliderAgent ?? this.sliderAgent,
      properties: properties ?? this.properties,
      maxBedRooms: maxBedRooms ?? this.maxBedRooms,
      maxBathRooms: maxBathRooms ?? this.maxBathRooms,
      maxArea: maxArea ?? this.maxArea,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seo_setting': seoSetting?.toMap(),
      'locations': location!.map((x) => x.toMap()).toList(),
      'property_types': propertyType!.map((x) => x.toMap()).toList(),
      'slider_agents': sliderAgent!.map((x) => x.toMap()).toList(),
      'properties': properties!.toMap(),
      'max_bed_room': maxBedRooms,
      'max_bath_room': maxBathRooms,
      'max_area': maxArea,
      'max_price': maxPrice,
    };
  }

  factory FilterPropertyListModel.fromMap(Map<String, dynamic> map) {
    return FilterPropertyListModel(
      seoSetting: map['seo_setting'] != null
          ? SeoSettingModel.fromMap(map['seo_setting'] as Map<String, dynamic>)
          : null,
      location: map['locations'] != null
          ? List<LocationItemModel>.from(
              (map['locations'] as List<dynamic>).map<LocationItemModel?>(
                (x) => LocationItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      propertyType: map['property_types'] != null
          ? List<PropertyTypeModel>.from(
              (map['property_types'] as List<dynamic>).map<PropertyTypeModel?>(
                (x) => PropertyTypeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      sliderAgent: map['slider_agents'] != null
          ? List<UserProfileModel>.from(
              (map['slider_agents'] as List<dynamic>).map<UserProfileModel?>(
                (x) => UserProfileModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      properties: map['properties'] != null
          ? SearchResponseModel.fromMap(
              map['properties'] as Map<String, dynamic>)
          : null,
      maxBedRooms: map['max_bed_room'] != null
          ? int.parse(map['max_bed_room'].toString())
          : 0,
      maxBathRooms: map['max_bath_room'] != null
          ? int.parse(map['max_bath_room'].toString())
          : 0,
      maxArea: map['max_area'] != null
          ? double.parse(map['max_area'].toString())
          : 0.0,
      maxPrice: map['max_price'] != null
          ? double.parse(map['max_price'].toString())
          : 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterPropertyListModel.fromJson(String source) =>
      FilterPropertyListModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      seoSetting!,
      location!,
      propertyType!,
      sliderAgent!,
      properties!,
      maxBedRooms,
      maxBathRooms,
      maxArea,
      maxPrice,
    ];
  }
}
