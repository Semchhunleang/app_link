// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NearestLocationDto extends Equatable {
  final int id;
  final int locationId;
  final String distances;
  const NearestLocationDto({
    this.id = 0,

    required this.locationId,
    required this.distances,
  });

  NearestLocationDto copyWith({
    int? id,
    int? locationId,
    String? distances,
  }) {
    return NearestLocationDto(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      distances: distances ?? this.distances,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nearest_locations': locationId.toString(),
      'distances': distances,
    };
  }

  factory NearestLocationDto.fromMap(Map<String, dynamic> map) {
    return NearestLocationDto(
      id: map['id'] ?? 0,
      locationId: map['nearest_locations'] as int,
      distances: map['distances'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NearestLocationDto.fromJson(String source) =>
      NearestLocationDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, locationId, distances];
}
