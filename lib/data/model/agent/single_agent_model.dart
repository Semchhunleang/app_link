import 'dart:convert';

import 'package:equatable/equatable.dart';

class SingleAgent extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String designation;
  final String image;

  const SingleAgent({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.designation,
    required this.image,
  });

  SingleAgent copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? designation,
    String? image,
  }) {
    return SingleAgent(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      designation: designation ?? this.designation,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'designation': designation,
      'image': image,
    };
  }

  factory SingleAgent.fromMap(Map<String, dynamic> map) {
    return SingleAgent(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      designation: map['designation'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleAgent.fromJson(String source) =>
      SingleAgent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      phone,
      email,
      designation,
      image,
    ];
  }
}
