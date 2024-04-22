// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/data/model/auth/user_profile_model.dart';
import '../agent/agent_properties_model.dart';

class WishListModel extends Equatable {
  final UserProfileModel? user;
  final AgentPropertiesModel? properties;

  const WishListModel({
    required this.user,
    required this.properties,
  });

  WishListModel copyWith({
    UserProfileModel? user,
    AgentPropertiesModel? properties,
  }) {
    return WishListModel(
      user: user ?? this.user,
      properties: properties ?? this.properties,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user!.toMap(),
      'properties': properties!.toMap(),
    };
  }

  factory WishListModel.fromMap(Map<String, dynamic> map) {
    return WishListModel(
      user: map['user'] != null
          ? UserProfileModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      properties: map['properties'] != null
          ? AgentPropertiesModel.fromMap(
              map['properties'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WishListModel.fromJson(String source) =>
      WishListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user!, properties!];
}
