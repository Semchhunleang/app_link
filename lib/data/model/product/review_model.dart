import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/user_profile_model.dart';

class Review extends Equatable {
  final int id;
  final int propertyId;
  final int userId;
  final int agentId;
  final String review;
  final int rating;
  final int status;
  final String createdAt;
  final String updatedAt;
  final UserProfileModel? user;

  const Review({
    required this.id,
    required this.propertyId,
    required this.userId,
    required this.agentId,
    required this.review,
    required this.rating,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  Review copyWith({
    int? id,
    int? propertyId,
    int? userId,
    int? agentId,
    String? review,
    int? rating,
    int? status,
    String? createdAt,
    String? updatedAt,
    UserProfileModel? user,
  }) {
    return Review(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      userId: userId ?? this.userId,
      agentId: agentId ?? this.agentId,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
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
      'user': user!.toMap(),
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'] as int,
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
      user: map['user'] != null
          ? UserProfileModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

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
      user!,
    ];
  }
}
