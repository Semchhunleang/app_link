import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/auth/login/subscription_model.dart';

class UserDataModel extends Equatable {
  final int id;
  final String uuid;
  final String firstName;
  final String lastName;
  final String nickname;
  final String email;
  final String phone;
  final String refCode;
  final String profileOriginal;
  final String refCodeImage;
  final String refCodeDeepLink;
  final SubscriptionModel subscription;

  const UserDataModel(
      {required this.id,
      required this.uuid,
      required this.firstName,
      required this.lastName,
      required this.nickname,
      required this.email,
      required this.phone,
      required this.refCode,
      required this.profileOriginal,
      required this.refCodeImage,
      required this.refCodeDeepLink,
      required this.subscription});

  UserDataModel copyWith({
    int? id,
    String? uuid,
    String? firstName,
    String? lastName,
    String? nickname,
    String? email,
    String? phone,
    String? refCode,
    String? profileOriginal,
    String? refCodeImage,
    String? refCodeDeepLink,
    SubscriptionModel? subscription
  }) {
    return UserDataModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      refCode: refCode ?? this.refCode,
      profileOriginal: profileOriginal ?? this.profileOriginal,
      refCodeImage: refCodeImage ?? this.refCodeImage,
      refCodeDeepLink: refCodeDeepLink ?? this.refCodeDeepLink, 
      subscription: subscription ?? this.subscription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'first_name': firstName,
      'last_name': lastName,
      'nickname': nickname,
      'email': email,
      'phone': phone,
      'ref_code': refCode,
      'profile_original': profileOriginal,
      'ref_code_image': refCodeImage,
      'ref_code_deep_link': refCodeDeepLink,
      'subscription': subscription
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    //print('uuuuuuuuuuuuuu');
    return UserDataModel(
        id: map['id'] ?? 0,
        uuid: map['uuid'] ?? '',
        firstName: map['first_name'] ?? '',
        lastName: map['last_name'] ?? '',
        nickname: map['nickname'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? '',
        refCode: map['ref_code'] ?? '',
        profileOriginal: map['profile_original'] ?? '',
        refCodeImage: map['ref_code_image'] ?? '',
        refCodeDeepLink: map['ref_code_deep_link'] ?? '',
        subscription: SubscriptionModel.fromJson(map['subscription']) 
        );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        uuid,
        firstName,
        lastName,
        nickname,
        email,
        phone,
        refCode,
        profileOriginal,
        refCodeImage,
        refCodeDeepLink,
        subscription
      ];
}
