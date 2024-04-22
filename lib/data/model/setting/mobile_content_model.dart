// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MobileContent extends Equatable {
  final int id;
  final String splashScreen;
  final String onboardingOneTitle;
  final String onboardingOneDescription;
  final String onboardingOneIcon;
  final String onboardingTwoTitle;
  final String onboardingTwoDescription;
  final String onboardingTwoIcon;
  final String onboardingThreeTitle;
  final String onboardingThreeDescription;
  final String onboardingThreeIcon;
  final String loginBgImage;
  final String loginPageLogo;
  final String createdAt;
  final String updatedAt;
  const MobileContent({
    required this.id,
    required this.splashScreen,
    required this.onboardingOneTitle,
    required this.onboardingOneDescription,
    required this.onboardingOneIcon,
    required this.onboardingTwoTitle,
    required this.onboardingTwoDescription,
    required this.onboardingTwoIcon,
    required this.onboardingThreeTitle,
    required this.onboardingThreeDescription,
    required this.onboardingThreeIcon,
    required this.loginBgImage,
    required this.loginPageLogo,
    required this.createdAt,
    required this.updatedAt,
  });

  MobileContent copyWith({
    int? id,
    String? splashScreen,
    String? onboardingOneTitle,
    String? onboardingOneDescription,
    String? onboardingOneIcon,
    String? onboardingTwoTitle,
    String? onboardingTwoDescription,
    String? onboardingTwoIcon,
    String? onboardingThreeTitle,
    String? onboardingThreeDescription,
    String? onboardingThreeIcon,
    String? loginBgImage,
    String? loginPageLogo,
    String? createdAt,
    String? updatedAt,
  }) {
    return MobileContent(
      id: id ?? this.id,
      splashScreen: splashScreen ?? this.splashScreen,
      onboardingOneTitle: onboardingOneTitle ?? this.onboardingOneTitle,
      onboardingOneDescription:
          onboardingOneDescription ?? this.onboardingOneDescription,
      onboardingOneIcon: onboardingOneIcon ?? this.onboardingOneIcon,
      onboardingTwoTitle: onboardingTwoTitle ?? this.onboardingTwoTitle,
      onboardingTwoDescription:
          onboardingTwoDescription ?? this.onboardingTwoDescription,
      onboardingTwoIcon: onboardingTwoIcon ?? this.onboardingTwoIcon,
      onboardingThreeTitle: onboardingThreeTitle ?? this.onboardingThreeTitle,
      onboardingThreeDescription:
          onboardingThreeDescription ?? this.onboardingThreeDescription,
      onboardingThreeIcon: onboardingThreeIcon ?? this.onboardingThreeIcon,
      loginBgImage: loginBgImage ?? this.loginBgImage,
      loginPageLogo: loginPageLogo ?? this.loginPageLogo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'splash_screen': splashScreen,
      'onboarding_one_title': onboardingOneTitle,
      'onboarding_one_description': onboardingOneDescription,
      'onboarding_one_icon': onboardingOneIcon,
      'onboarding_two_title': onboardingTwoTitle,
      'onboarding_two_description': onboardingTwoDescription,
      'onboarding_two_icon': onboardingTwoIcon,
      'onboarding_three_title': onboardingThreeTitle,
      'onboarding_three_description': onboardingThreeDescription,
      'onboarding_three_icon': onboardingThreeIcon,
      'login_bg_image': loginBgImage,
      'login_page_logo': loginPageLogo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory MobileContent.fromMap(Map<String, dynamic> json) {
    return MobileContent(
      id: json['id'],
      splashScreen: json['splash_screen'],
      onboardingOneTitle: json['onboarding_one_title'],
      onboardingOneDescription: json['onboarding_one_description'],
      onboardingOneIcon: json['onboarding_one_icon'],
      onboardingTwoTitle: json['onboarding_two_title'],
      onboardingTwoDescription: json['onboarding_two_description'],
      onboardingTwoIcon: json['onboarding_two_icon'],
      onboardingThreeTitle: json['onboarding_three_title'],
      onboardingThreeDescription: json['onboarding_three_description'],
      onboardingThreeIcon: json['onboarding_three_icon'],
      loginBgImage: json['login_bg_image'],
      loginPageLogo: json['login_page_logo'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MobileContent.fromJson(String source) =>
      MobileContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      splashScreen,
      onboardingOneTitle,
      onboardingOneDescription,
      onboardingOneIcon,
      onboardingTwoTitle,
      onboardingTwoDescription,
      onboardingTwoIcon,
      onboardingThreeTitle,
      onboardingThreeDescription,
      onboardingThreeIcon,
      loginBgImage,
      loginPageLogo,
      createdAt,
      updatedAt,
    ];
  }
}
