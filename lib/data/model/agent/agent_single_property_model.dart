import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/agent/single_agent_model.dart';

class AgentSingleProperty extends Equatable {
  final int id;
  final int agentId;
  final String title;
  final String slug;
  final String purpose;
  final String rentPeriod;
  final double price;
  final String thumbnailImage;
  final String address;
  final int totalBedroom;
  final int totalBathroom;
  final int totalArea;
  final String status;
  final String isFeatured;
  final int totalRating;
  final double ratingAvarage;
  final SingleAgent? agent;

  const AgentSingleProperty({
    required this.id,
    required this.agentId,
    required this.title,
    required this.slug,
    required this.purpose,
    required this.rentPeriod,
    required this.price,
    required this.thumbnailImage,
    required this.address,
    required this.totalBedroom,
    required this.totalBathroom,
    required this.totalArea,
    required this.status,
    required this.isFeatured,
    required this.totalRating,
    required this.ratingAvarage,
    required this.agent,
  });

  AgentSingleProperty copyWith({
    int? id,
    int? agentId,
    String? title,
    String? slug,
    String? purpose,
    String? rentPeriod,
    double? price,
    String? thumbnailImage,
    String? address,
    int? totalBedroom,
    int? totalBathroom,
    int? totalArea,
    String? status,
    String? isFeatured,
    int? totalRating,
    double? ratingAvarage,
    SingleAgent? agent,
  }) {
    return AgentSingleProperty(
      id: id ?? this.id,
      agentId: agentId ?? this.agentId,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      purpose: purpose ?? this.purpose,
      rentPeriod: rentPeriod ?? this.rentPeriod,
      price: price ?? this.price,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      address: address ?? this.address,
      totalBedroom: totalBedroom ?? this.totalBedroom,
      totalBathroom: totalBathroom ?? this.totalBathroom,
      totalArea: totalArea ?? this.totalArea,
      status: status ?? this.status,
      isFeatured: isFeatured ?? this.isFeatured,
      totalRating: totalRating ?? this.totalRating,
      ratingAvarage: ratingAvarage ?? this.ratingAvarage,
      agent: agent ?? this.agent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'agent_id': agentId,
      'title': title,
      'slug': slug,
      'purpose': purpose,
      'rent_period': rentPeriod,
      'price': price,
      'thumbnail_image': thumbnailImage,
      'address': address,
      'total_bedroom': totalBedroom,
      'total_bathroom': totalBathroom,
      'total_area': totalArea,
      'status': status,
      'is_featured': isFeatured,
      'totalRating': totalRating,
      'ratingAvarage': ratingAvarage,
      'agent': agent!.toMap(),
    };
  }

  factory AgentSingleProperty.fromMap(Map<String, dynamic> map) {
    return AgentSingleProperty(
      id: map['id'] ?? '',
      agentId:
          map['agent_id'] != null ? int.parse(map['agent_id'].toString()) : 0,
      title: map['title'] ?? '',
      slug: map['slug'] ?? '',
      purpose: map['purpose'] ?? '',
      rentPeriod: map['rent_period'] ?? '',
      price: map['price'] != null ? double.parse(map['price'].toString()) : 0.0,
      thumbnailImage: map['thumbnail_image'] ?? '',
      address: map['address'] ?? '',
      totalBedroom: map['total_bedroom'] != null
          ? int.parse(map['total_bedroom'].toString())
          : 0,
      totalBathroom: map['total_bathroom'] != null
          ? int.parse(map['total_bathroom'].toString())
          : 0,
      totalArea: map['total_area'] != null
          ? int.parse(map['total_bathroom'].toString())
          : 0,
      status: map['status'] ?? '',
      isFeatured: map['is_featured'] ?? '',
      totalRating: map['totalRating'] != null
          ? int.parse(map['totalRating'].toString())
          : 0,
      ratingAvarage: map['ratingAvarage'] != null
          ? double.parse(map['ratingAvarage'].toString())
          : 0.0,
      agent: map['agent'] != null
          ? SingleAgent.fromMap(map['agent'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentSingleProperty.fromJson(String source) =>
      AgentSingleProperty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      agentId,
      title,
      slug,
      purpose,
      rentPeriod,
      price,
      thumbnailImage,
      address,
      totalBedroom,
      totalBathroom,
      totalArea,
      status,
      isFeatured,
      totalRating,
      ratingAvarage,
      agent!,
    ];
  }
}
