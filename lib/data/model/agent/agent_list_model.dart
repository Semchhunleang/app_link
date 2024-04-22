import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/data/model/contact_us/contact_us_model.dart';
import '../auth/user_profile_model.dart';

class AgentListModel extends Equatable {
  final SeoSettingModel? seoSetting;
  final List<UserProfileModel>? agents;

  const AgentListModel({
    required this.seoSetting,
    required this.agents,
  });

  AgentListModel copyWith({
    SeoSettingModel? seoSetting,
    List<UserProfileModel>? agents,
  }) {
    return AgentListModel(
      seoSetting: seoSetting ?? this.seoSetting,
      agents: agents ?? this.agents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seo_setting': seoSetting?.toMap(),
      'agents': agents!.map((x) => x.toMap()).toList(),
    };
  }

  factory AgentListModel.fromMap(Map<String, dynamic> map) {
    return AgentListModel(
      seoSetting: map['seo_setting'] != null
          ? SeoSettingModel.fromMap(map['seo_setting'] as Map<String, dynamic>)
          : null,
      agents: map['agents']['data'] != null
          ? List<UserProfileModel>.from(
              (map['agents']['data'] as List<dynamic>).map<UserProfileModel?>(
                (x) => UserProfileModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentListModel.fromJson(String source) =>
      AgentListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [seoSetting!, agents!];
}
