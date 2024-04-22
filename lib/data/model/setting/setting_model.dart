// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SettingModel extends Equatable {
  final int id;
  final String logo;

  final String favicon;
  final String preloaderStatus;
  final String propertyAutoApproval;
  final String textDirection;
  final String appName;
  final String currencyName;
  final String currencyIcon;
  final int selectedTheme;
  final String defaultAvatar;
  final bool isReferralCode;
  const SettingModel({
    required this.id,
    required this.logo,
    required this.favicon,
    required this.preloaderStatus,
    required this.propertyAutoApproval,
    required this.textDirection,
    required this.appName,
    required this.currencyName,
    required this.currencyIcon,
    required this.selectedTheme,
    required this.defaultAvatar,
    required this.isReferralCode,
  });

  SettingModel copyWith({
    int? id,
    String? logo,
    String? favicon,
    String? preloaderStatus,
    String? propertyAutoApproval,
    String? textDirection,
    String? appName,
    String? currencyName,
    String? currencyIcon,
    int? selectedTheme,
    String? defaultAvatar,
    bool? isReferralCode,
  }) {
    return SettingModel(
        id: id ?? this.id,
        logo: logo ?? this.logo,
        favicon: favicon ?? this.favicon,
        preloaderStatus: preloaderStatus ?? this.preloaderStatus,
        propertyAutoApproval: propertyAutoApproval ?? this.propertyAutoApproval,
        textDirection: textDirection ?? this.textDirection,
        appName: appName ?? this.appName,
        currencyName: currencyName ?? this.currencyName,
        currencyIcon: currencyIcon ?? this.currencyIcon,
        selectedTheme: selectedTheme ?? this.selectedTheme,
        defaultAvatar: defaultAvatar ?? this.defaultAvatar,
        isReferralCode: isReferralCode ?? this.isReferralCode);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo': logo,
      'favicon': favicon,
      'preloader_status': preloaderStatus,
      'property_auto_approval': propertyAutoApproval,
      'text_direction': textDirection,
      'app_name': appName,
      'currency_name': currencyName,
      'currency_icon': currencyIcon,
      'selected_theme': selectedTheme,
      'default_avatar': defaultAvatar,
      'is_referral_code': isReferralCode
    };
  }

  factory SettingModel.fromMap(Map<String, dynamic> map) {
    return SettingModel(
        id: map['id'] ?? 0,
        logo: map['logo'] ?? '',
        favicon: map['favicon'] ?? '',
        preloaderStatus: map['preloader_status'] ?? '',
        propertyAutoApproval: map['property_auto_approval'] ?? '',
        textDirection: map['text_direction'] ?? '',
        appName: map['app_name'] ?? '',
        currencyName: map['currency_name'] ?? '',
        currencyIcon: map['currency_icon'] ?? '',
        selectedTheme: map['selected_theme'] ?? 0,
        defaultAvatar: map['default_avatar'] ?? '',
        isReferralCode: map['is_referral_code'] ?? false);
  }

  String toJson() => json.encode(toMap());

  factory SettingModel.fromJson(String source) =>
      SettingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      logo,
      favicon,
      preloaderStatus,
      propertyAutoApproval,
      textDirection,
      appName,
      currencyName,
      currencyIcon,
      selectedTheme,
      defaultAvatar,
      isReferralCode
    ];
  }
}
