// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactUsModel extends Equatable {
  final SeoSettingModel? seoSetting;
  final ContactComponent? contact;

  const ContactUsModel({
    required this.seoSetting,
    required this.contact,
  });

  ContactUsModel copyWith({
    SeoSettingModel? seoSetting,
    ContactComponent? contact,
  }) {
    return ContactUsModel(
      seoSetting: seoSetting ?? this.seoSetting,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seo_setting': seoSetting?.toMap(),
      'contact': contact?.toMap(),
    };
  }

  factory ContactUsModel.fromMap(Map<String, dynamic> map) {
    return ContactUsModel(
      seoSetting: map['seo_setting'] != null
          ? SeoSettingModel.fromMap(map['seo_setting'] as Map<String, dynamic>)
          : null,
      contact: map['contact'] != null
          ? ContactComponent.fromMap(map['contact'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUsModel.fromJson(String source) =>
      ContactUsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [seoSetting!, contact!];
}

class SeoSettingModel extends Equatable {
  final int id;
  final String pageName;
  final String seoTitle;
  final String seoDescription;
  final String createdAt;
  final String updatedAt;

  const SeoSettingModel({
    required this.id,
    required this.pageName,
    required this.seoTitle,
    required this.seoDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  SeoSettingModel copyWith({
    int? id,
    String? pageName,
    String? seoTitle,
    String? seoDescription,
    String? createdAt,
    String? updatedAt,
  }) {
    return SeoSettingModel(
      id: id ?? this.id,
      pageName: pageName ?? this.pageName,
      seoTitle: seoTitle ?? this.seoTitle,
      seoDescription: seoDescription ?? this.seoDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'page_name': pageName,
      'seo_title': seoTitle,
      'seo_description': seoDescription,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SeoSettingModel.fromMap(Map<String, dynamic> map) {
    return SeoSettingModel(
      id: map['id'] ?? 0,
      pageName: map['page_name'] ?? '',
      seoTitle: map['seo_title'] ?? '',
      seoDescription: map['seo_description'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SeoSettingModel.fromJson(String source) =>
      SeoSettingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      pageName,
      seoTitle,
      seoDescription,
      createdAt,
      updatedAt,
    ];
  }
}

class ContactComponent extends Equatable {
  final int id;
  final String supporterImage;
  final String supportTime;
  final String offDay;
  final String email;
  final String address;
  final String phone;
  final String map;
  final String createdAt;
  final String updatedAt;

  const ContactComponent({
    required this.id,
    required this.supporterImage,
    required this.supportTime,
    required this.offDay,
    required this.email,
    required this.address,
    required this.phone,
    required this.map,
    required this.createdAt,
    required this.updatedAt,
  });

  ContactComponent copyWith({
    int? id,
    String? supporterImage,
    String? supportTime,
    String? offDay,
    String? email,
    String? address,
    String? phone,
    String? map,
    String? createdAt,
    String? updatedAt,
  }) {
    return ContactComponent(
      id: id ?? this.id,
      supporterImage: supporterImage ?? this.supporterImage,
      supportTime: supportTime ?? this.supportTime,
      offDay: offDay ?? this.offDay,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      map: map ?? this.map,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'supporter_image': supporterImage,
      'support_time': supportTime,
      'off_day': offDay,
      'email': email,
      'address': address,
      'phone': phone,
      'map': map,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory ContactComponent.fromMap(Map<String, dynamic> map) {
    return ContactComponent(
      id: map['id'] ?? 0,
      supporterImage: map['supporter_image'] ?? '',
      supportTime: map['support_time'] ?? '',
      offDay: map['off_day'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      map: map['map'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactComponent.fromJson(String source) =>
      ContactComponent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      supporterImage,
      supportTime,
      offDay,
      email,
      address,
      phone,
      map,
      createdAt,
      updatedAt,
    ];
  }
}
