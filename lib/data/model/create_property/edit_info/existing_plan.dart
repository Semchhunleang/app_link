import 'dart:convert';
import 'package:equatable/equatable.dart';

class ExistingPlan extends Equatable {
  final int id;
  final int propertyId;
  final String title;
  final String description;
  final String image;

  const ExistingPlan({
    required this.id,
    required this.propertyId,
    required this.title,
    required this.description,
    required this.image,
  });

  ExistingPlan copyWith({
    int? id,
    int? propertyId,
    String? title,
    String? description,
    String? image,
  }) {
    return ExistingPlan(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory ExistingPlan.fromMap(Map<String, dynamic> map) {
    return ExistingPlan(
      id: map['id'] as int,
      propertyId: map['property_id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ExistingPlan.fromJson(String source) =>
      ExistingPlan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      propertyId,
      title,
      description,
      image,
    ];
  }
}
