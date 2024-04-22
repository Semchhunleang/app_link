// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SocialLinksModel extends Equatable {
  final int id;
  final String link;
  final String icon;
  final String createdAt;
  final String updatedAt;
  const SocialLinksModel({
    required this.id,
    required this.link,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  SocialLinksModel copyWith({
    int? id,
    String? link,
    String? icon,
    String? createdAt,
    String? updatedAt,
  }) {
    return SocialLinksModel(
      id: id ?? this.id,
      link: link ?? this.link,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'link': link,
      'icon': icon,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SocialLinksModel.fromMap(Map<String, dynamic> map) {
    return SocialLinksModel(
      id: map['id'] as int,
      link: map['link'] ?? "",
      icon: map['icon'] ?? "",
      createdAt: map['created_at'] ?? "",
      updatedAt: map['updated_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLinksModel.fromJson(String source) =>
      SocialLinksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      link,
      icon,
      createdAt,
      updatedAt,
    ];
  }
}
