// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExistingSlider extends Equatable {
  final int id;
  final int propertyId;
  final String image;

  const ExistingSlider({
    this.id = 0,
    this.propertyId = 0,
    required this.image,
  });

  ExistingSlider copyWith({
    int? id,
    int? propertyId,
    String? image,
  }) {
    return ExistingSlider(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'image': image,
    };
  }

  factory ExistingSlider.fromMap(Map<String, dynamic> map) {
    return ExistingSlider(
      id: map['id'] as int,
      propertyId: map['property_id'] as int,
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ExistingSlider.fromJson(String source) =>
      ExistingSlider.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, propertyId, image];
}
