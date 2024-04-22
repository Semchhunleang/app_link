import 'dart:convert';

import 'package:equatable/equatable.dart';

class DescriptionProductModel extends Equatable {
  final String name;

  const DescriptionProductModel({required this.name});

  DescriptionProductModel copyWith({String? name}) {
    return DescriptionProductModel(name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory DescriptionProductModel.fromMap(Map<String, dynamic> map) {
    return DescriptionProductModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionProductModel.fromJson(String source) =>
      DescriptionProductModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name];
}
