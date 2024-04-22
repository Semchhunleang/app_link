import 'dart:convert';

import 'package:equatable/equatable.dart';

class DescriptionModel extends Equatable {
  final String? name;

  const DescriptionModel({required this.name});

  DescriptionModel copyWith({
    String? name,
  }) {
    return DescriptionModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory DescriptionModel.fromMap(Map<String, dynamic> map) {
    return DescriptionModel(
      name: map['name'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory DescriptionModel.fromJson(String source) =>
      DescriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name!];
}
