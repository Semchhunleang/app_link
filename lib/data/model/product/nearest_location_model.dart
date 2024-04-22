import 'dart:convert';

import 'package:equatable/equatable.dart';

class NearestLocationItem extends Equatable {
  final int id;
  final int propertyId;
  final int nearestLocationId;
  final String distance;
  final String createdAt;
  final String updatedAt;
  final NearestLocationModel? location;

  const NearestLocationItem({
    required this.id,
    required this.propertyId,
    required this.nearestLocationId,
    required this.distance,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
  });

  NearestLocationItem copyWith({
    int? id,
    int? propertyId,
    int? nearestLocationId,
    String? distance,
    String? createdAt,
    String? updatedAt,
    NearestLocationModel? location,
  }) {
    return NearestLocationItem(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      nearestLocationId: nearestLocationId ?? this.nearestLocationId,
      distance: distance ?? this.distance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'nearest_location_id': nearestLocationId,
      'distance': distance,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'location': location!.toMap(),
    };
  }

  factory NearestLocationItem.fromMap(Map<String, dynamic> map) {
    return NearestLocationItem(
      id: map['id'] as int,
      propertyId: map['property_id'] != null
          ? int.parse(map['property_id'].toString())
          : 0,
      nearestLocationId: map['nearest_location_id'] != null
          ? int.parse(map['nearest_location_id'].toString())
          : 0,
      distance: map['distance'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      location: map['location'] != null
          ? NearestLocationModel.fromMap(
              map['location'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NearestLocationItem.fromJson(String source) =>
      NearestLocationItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      propertyId,
      nearestLocationId,
      distance,
      createdAt,
      updatedAt,
      location!,
    ];
  }
}

class NearestLocationModel extends Equatable {
  final int id;
  final String location;
  final int status;

  const NearestLocationModel({
    required this.id,
    required this.location,
    required this.status,
  });

  NearestLocationModel copyWith({
    int? id,
    String? location,
    int? status,
  }) {
    return NearestLocationModel(
      id: id ?? this.id,
      location: location ?? this.location,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': location,
      'status': status,
    };
  }

  factory NearestLocationModel.fromMap(Map<String, dynamic> map) {
    return NearestLocationModel(
      id: map['id'] != null ? int.parse(map['id'].toString()) : 0,
      location: map['location'] ?? '',
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NearestLocationModel.fromJson(String source) =>
      NearestLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, location, status];
}
