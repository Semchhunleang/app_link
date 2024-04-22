import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final int id;
  final int propertyId;
  final int userId;
  final int agentId;
  final String review;
  final int rating;
  final int status;
  final String createdAt;
  final String updatedAt;
  final ReviewPropertyModel? property;

  const ReviewModel({
    required this.id,
    required this.propertyId,
    required this.userId,
    required this.agentId,
    required this.review,
    required this.rating,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.property,
  });

  ReviewModel copyWith({
    int? id,
    int? propertyId,
    int? userId,
    int? agentId,
    String? review,
    int? rating,
    int? status,
    String? createdAt,
    String? updatedAt,
    ReviewPropertyModel? property,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      userId: userId ?? this.userId,
      agentId: agentId ?? this.agentId,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      property: property ?? this.property,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'property_id': propertyId,
      'user_id': userId,
      'agent_id': agentId,
      'review': review,
      'rating': rating,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'property': property!.toMap(),
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'] != null ? int.parse(map['id'].toString()) : 0,
      propertyId: map['property_id'] != null
          ? int.parse(map['property_id'].toString())
          : 0,
      userId: map['user_id'] != null ? int.parse(map['user_id'].toString()) : 0,
      agentId:
          map['agent_id'] != null ? int.parse(map['agent_id'].toString()) : 0,
      review: map['review'] ?? '',
      rating: map['rating'] != null ? int.parse(map['rating'].toString()) : 0,
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      property: map['property'] != null
          ? ReviewPropertyModel.fromMap(map['property'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      propertyId,
      userId,
      agentId,
      review,
      rating,
      status,
      createdAt,
      updatedAt,
      property!,
    ];
  }
}

class ReviewPropertyModel extends Equatable {
  final int id;
  final String title;
  final String slug;
  final String thumbnailImage;
  final int agentId;
  final int totalRating;
  final double ratingAvarage;

  const ReviewPropertyModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.thumbnailImage,
    required this.agentId,
    required this.totalRating,
    required this.ratingAvarage,
  });

  ReviewPropertyModel copyWith({
    int? id,
    String? title,
    String? slug,
    String? thumbnailImage,
    int? agentId,
    int? totalRating,
    double? ratingAvarage,
  }) {
    return ReviewPropertyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      agentId: agentId ?? this.agentId,
      totalRating: totalRating ?? this.totalRating,
      ratingAvarage: ratingAvarage ?? this.ratingAvarage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slug': slug,
      'thumbnail_image': thumbnailImage,
      'agent_id': agentId,
      'totalRating': totalRating,
      'ratingAvarage': ratingAvarage,
    };
  }

  factory ReviewPropertyModel.fromMap(Map<String, dynamic> map) {
    return ReviewPropertyModel(
      id: map['id'] != null ? int.parse(map['id'].toString()) : 0,
      title: map['title'] ?? '',
      slug: map['slug'] ?? '',
      thumbnailImage: map['thumbnail_image'] ?? '',
      agentId:
          map['agent_id'] != null ? int.parse(map['agent_id'].toString()) : 0,
      totalRating: map['totalRating'] != null
          ? int.parse(map['totalRating'].toString())
          : 0,
      ratingAvarage: map['ratingAvarage'] != null
          ? double.parse(map['ratingAvarage'].toString())
          : 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewPropertyModel.fromJson(String source) =>
      ReviewPropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      slug,
      thumbnailImage,
      agentId,
      totalRating,
      ratingAvarage,
    ];
  }
}
