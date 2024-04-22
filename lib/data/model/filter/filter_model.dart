import 'dart:convert';

import 'package:equatable/equatable.dart';

class FilterProperty extends Equatable {
  final String search;
  final String featureProperty;
  final String location;
  final String purpose;
  final String type;
  final List<int> rooms;
  final List<int> bathRooms;
  final double minArea;
  final double maxArea;
  final double minPrice;
  final double maxPrice;

  const FilterProperty({
    required this.search,
    required this.featureProperty,
    required this.location,
    required this.purpose,
    required this.type,
    required this.rooms,
    required this.bathRooms,
    required this.minArea,
    required this.maxArea,
    required this.minPrice,
    required this.maxPrice,
  });

  FilterProperty copyWith({
    String? search,
    String? featureProperty,
    String? location,
    String? purpose,
    String? type,
    List<int>? rooms,
    List<int>? bathRooms,
    double? minArea,
    double? maxArea,
    double? minPrice,
    double? maxPrice,
  }) {
    return FilterProperty(
      search: search ?? this.search,
      featureProperty: featureProperty ?? this.featureProperty,
      location: location ?? this.location,
      purpose: purpose ?? this.purpose,
      type: type ?? this.type,
      rooms: rooms ?? this.rooms,
      bathRooms: bathRooms ?? this.bathRooms,
      minArea: minArea ?? this.minArea,
      maxArea: maxArea ?? this.maxArea,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, String>{};
    // return <String, dynamic>{
    // final result = <String, String>{};
    //   'search': search,
    //   'feature_property': featureProperty,
    //   'location': location,
    //   'purpose': purpose,
    //   'type': type,
    //   'bathRooms': bathRooms,
    //   'minArea': minArea,
    //   'maxArea': maxArea,
    //   'minPrice': minPrice,
    //   'maxPrice': maxPrice,
    // };
    result.addAll({'search': search});
    result.addAll({'feature_property': featureProperty});
    result.addAll({'location': location});
    result.addAll({'purpose': purpose});
    result.addAll({'type': type});
    //result.addAll({'purpose': purpose});
    rooms.toList().asMap().forEach((k, value) {
      if (value != -1) {
        result.addAll({'rooms[$k]': rooms.toString()});
      }
    });

    bathRooms.toList().asMap().forEach((k, value) {
      if (value != -1) {
        result.addAll({'bath_rooms[$k]': bathRooms.toString()});
      }
    });
    result.addAll({'min_area': minArea.toString()});
    result.addAll({'max_area': maxArea.toString()});
    result.addAll({'min_price': minPrice.toString()});
    result.addAll({'max_price': maxPrice.toString()});
    // result.addAll({'purpose': purpose});
    return result;
  }

  // factory FilterProperty.fromMap(Map<String, dynamic> map) {
  //   return FilterProperty(
  //       search: map['search'] as String,
  //       featureProperty: map['featureProperty'] as String,
  //       location: map['location'] as String,
  //       purpose: map['purpose'] as String,
  //       type: map['type'] as String,
  //       rooms: List<int>.from((map['rooms'] as List<int>),
  //   bathRooms: List<int>.from((map['bathRooms'] as List<int>),
  //   minArea: map['minArea'] as double,
  //   maxArea: map['maxArea'] as double,
  //   minPrice: map['minPrice'] as double,
  //   maxPrice: map['maxPrice'] as double,
  //   );
  //   }

  String toJson() => json.encode(toMap());

  // factory FilterProperty.fromJson(String source) =>
  //     FilterProperty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      search,
      featureProperty,
      location,
      purpose,
      type,
      rooms,
      bathRooms,
      minArea,
      maxArea,
      minPrice,
      maxPrice,
    ];
  }
}
