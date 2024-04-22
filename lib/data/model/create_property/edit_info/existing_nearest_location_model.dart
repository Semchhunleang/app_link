// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExistingNearestModel extends Equatable {
  final int id;
  final int propertyId;
  final int nearestLocationId;
  final String distance;
  const ExistingNearestModel({
    required this.id,
    required this.propertyId,
    required this.nearestLocationId,
    required this.distance,
  });

  ExistingNearestModel copyWith({
    int? id,
    int? propertyId,
    int? nearestLocationId,
    String? distance,
  }) {
    return ExistingNearestModel(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      nearestLocationId: nearestLocationId ?? this.nearestLocationId,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'nearest_location_id': nearestLocationId,
      'distance': distance,
    };
  }

  factory ExistingNearestModel.fromMap(Map<String, dynamic> map) {
    return ExistingNearestModel(
      id: map['id'] as int,
      propertyId: map['property_id'] as int,
      nearestLocationId: map['nearest_location_id'] as int,
      distance: map['distance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExistingNearestModel.fromJson(String source) =>
      ExistingNearestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, propertyId, nearestLocationId, distance];
}
