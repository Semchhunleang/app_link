// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:real_estate/data/model/setting/mobile_content_model.dart';
import 'package:real_estate/data/model/setting/partners_model.dart';
import 'package:real_estate/data/model/setting/setting_model.dart';
import 'package:real_estate/data/model/setting/social_links_model.dart';

import '../category/property_category_model.dart';

class WebsiteSetupModel extends Equatable {
  final SettingModel setting;
  final MobileContent mobileAppContent;
  final List<SocialLinksModel> socialLinks;
  final List<PartnersModel> partners;
  final List<PropertyCategory> footerCategories;
  const WebsiteSetupModel({
    required this.setting,
    required this.mobileAppContent,
    required this.socialLinks,
    required this.partners,
    required this.footerCategories,
  });

  WebsiteSetupModel copyWith({
    SettingModel? setting,
    MobileContent? mobileAppContent,
    List<SocialLinksModel>? socialLinks,
    List<PartnersModel>? partners,
    List<PropertyCategory>? footerCategories,
  }) {
    return WebsiteSetupModel(
      setting: setting ?? this.setting,
      mobileAppContent: mobileAppContent ?? this.mobileAppContent,
      socialLinks: socialLinks ?? this.socialLinks,
      partners: partners ?? this.partners,
      footerCategories: footerCategories ?? this.footerCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setting': setting.toMap(),
      'mobile_app_content': mobileAppContent.toMap(),
      'social_links': socialLinks.map((x) => x.toMap()).toList(),
      'partners': partners.map((x) => x.toMap()).toList(),
      'footer_categories': footerCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory WebsiteSetupModel.fromMap(Map<String, dynamic> map) {
    return WebsiteSetupModel(
      setting: SettingModel.fromMap(map['setting'] as Map<String, dynamic>),
      mobileAppContent: MobileContent.fromMap(
          map['mobile_app_content'] as Map<String, dynamic>),
      socialLinks: List<SocialLinksModel>.from(
        (map['social_links'] as List<dynamic>).map<SocialLinksModel>(
          (x) => SocialLinksModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      partners: List<PartnersModel>.from(
        (map['partners'] as List<dynamic>).map<PartnersModel>(
          (x) => PartnersModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      footerCategories: List<PropertyCategory>.from(
        (map['footer_categories'] as List<dynamic>).map<PropertyCategory>(
          (x) => PropertyCategory.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WebsiteSetupModel.fromJson(String source) =>
      WebsiteSetupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      setting,
      mobileAppContent,
      socialLinks,
      partners,
      footerCategories,
    ];
  }
}
