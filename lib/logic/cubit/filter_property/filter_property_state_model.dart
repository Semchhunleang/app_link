import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'filter_property_cubit.dart';

class FilterPropertyStateModel extends Equatable {
  final String search;
  final String featureProperty;
  final String location;
  final String purpose;
  final String type;
  final List<int> rooms;
  final List<int> bathRooms;
  final int minArea;
  final int maxArea;
  final int minPrice;
  final int maxPrice;
  final FilterPropertyState filterState;

  const FilterPropertyStateModel({
    this.search = '',
    this.featureProperty = '',
    this.location = '',
    this.purpose = '',
    this.type = '',
    this.rooms = const [],
    this.bathRooms = const [],
    this.minArea = 0,
    this.maxArea = 0,
    this.minPrice = 0,
    this.maxPrice = 0,
    this.filterState = const FilterPropertyInitial(),
  });

  FilterPropertyStateModel copyWith({
    String? search,
    String? featureProperty,
    String? location,
    String? purpose,
    String? type,
    List<int>? rooms,
    List<int>? bathRooms,
    int? minArea,
    int? maxArea,
    int? minPrice,
    int? maxPrice,
    FilterPropertyState? filterState,
  }) {
    return FilterPropertyStateModel(
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
      filterState: filterState ?? this.filterState,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, String>{};
    result.addAll({'search': search});
    result.addAll({'feature_property': featureProperty});
    result.addAll({'location': location});
    result.addAll({'purpose': purpose});
    result.addAll({'type': type});

    rooms.toSet().toList().asMap().forEach((k, value) {
      if (value != -1) {
        result.addAll({'rooms[$k]': rooms[k].toString()});
        print('k values: $k');
        print('value: $value');
      }
    });

    bathRooms.toSet().toList().asMap().forEach((k, value) {
      if (value != -1) {
        result.addAll({'bath_rooms[$k]': bathRooms[k].toString()});
      }
    });
    result.addAll({'min_area': minArea.toString()});
    result.addAll({'max_area': maxArea.toString()});
    result.addAll({'min_price': minPrice.toString()});
    result.addAll({'max_price': maxPrice.toString()});
    return result;
  }

  static FilterPropertyStateModel init() {
    return const FilterPropertyStateModel(
      search: '',
      featureProperty: '',
      location: '',
      purpose: '',
      type: '',
      rooms: [],
      bathRooms: [],
      minArea: 0,
      maxArea: 0,
      minPrice: 0,
      maxPrice: 0,
      filterState: FilterPropertyInitial(),
    );
  }

  FilterPropertyStateModel clear() {
    return const FilterPropertyStateModel(
      search: '',
      featureProperty: '',
      location: '',
      purpose: '',
      type: '',
      rooms: [],
      bathRooms: [],
      minArea: 0,
      maxArea: 0,
      minPrice: 0,
      maxPrice: 0,
      filterState: FilterPropertyInitial(),
    );
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
      filterState,
    ];
  }
}
