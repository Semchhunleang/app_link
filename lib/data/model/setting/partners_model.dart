// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PartnersModel extends Equatable {
  final int id;
  final String link;
  final String logo;
  final String home3Logo;
  final int status;
  final String createdAt;
  final String updatedAt;
  const PartnersModel({
    required this.id,
    required this.link,
    required this.logo,
    required this.home3Logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  PartnersModel copyWith({
    int? id,
    String? link,
    String? logo,
    String? home3Logo,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return PartnersModel(
      id: id ?? this.id,
      link: link ?? this.link,
      logo: logo ?? this.logo,
      home3Logo: home3Logo ?? this.home3Logo,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'link': link,
      'logo': logo,
      'home3_logo': home3Logo,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory PartnersModel.fromMap(Map<String, dynamic> map) {
    return PartnersModel(
      id: map['id'] as int,
      link: map['link'] ?? "",
      logo: map['logo'] ?? "",
      home3Logo: map['home3_logo'] ?? "",
      status: map['status'] as int,
      createdAt: map['created_at'] ?? "",
      updatedAt: map['updated_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PartnersModel.fromJson(String source) =>
      PartnersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      link,
      logo,
      home3Logo,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
