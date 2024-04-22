import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyAgent extends Equatable {
  final String agentType;
  final int id;
  final String name;
  final String userName;
  final String designation;
  final String email;
  final String image;
  final String phone;

  const PropertyAgent({
    required this.agentType,
    required this.id,
    required this.name,
    required this.userName,
    required this.designation,
    required this.email,
    required this.image,
    required this.phone,
  });

  PropertyAgent copyWith({
    String? agentType,
    int? id,
    String? name,
    String? userName,
    String? designation,
    String? email,
    String? image,
    String? phone,
  }) {
    return PropertyAgent(
      agentType: agentType ?? this.agentType,
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      designation: designation ?? this.designation,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agent_type': agentType,
      'id': id,
      'name': name,
      'user_name': userName,
      'designation': designation,
      'email': email,
      'image': image,
      'phone': phone,
    };
  }

  factory PropertyAgent.fromMap(Map<String, dynamic> map) {
    return PropertyAgent(
      agentType: map['agent_type'] ?? '',
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      userName: map['user_name'] ?? '',
      designation: map['designation'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyAgent.fromJson(String source) =>
      PropertyAgent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      agentType,
      id,
      name,
      userName,
      designation,
      email,
      image,
      phone,
    ];
  }
}
