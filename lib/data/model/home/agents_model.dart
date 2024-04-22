// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/user_profile_model.dart';

class AgentsModel extends Equatable {
  final bool visibility;
  final String title;
  final String description;
  final List<UserProfileModel> agents;
  const AgentsModel({
    required this.visibility,
    required this.title,
    required this.description,
    required this.agents,
  });

  AgentsModel copyWith({
    bool? visibility,
    String? title,
    String? description,
    List<UserProfileModel>? agents,
  }) {
    return AgentsModel(
      visibility: visibility ?? this.visibility,
      title: title ?? this.title,
      description: description ?? this.description,
      agents: agents ?? this.agents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'visibility': visibility,
      'title': title,
      'description': description,
      'agents': agents.map((x) => x.toMap()).toList(),
    };
  }

  factory AgentsModel.fromMap(Map<String, dynamic> map) {
    return AgentsModel(
      visibility: map['visibility'] as bool,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      agents: List<UserProfileModel>.from(
        (map['agents'] as List<dynamic>).map<UserProfileModel>(
          (x) => UserProfileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentsModel.fromJson(String source) =>
      AgentsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [visibility, title, description, agents];
}
