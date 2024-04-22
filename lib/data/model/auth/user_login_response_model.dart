import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user_profile_model.dart';

class UserLoginResponseModel extends Equatable {
  final UserProfileModel user;
  final String accessToken;
  final int expiresIn;
  final String tokenType;
  const UserLoginResponseModel({
    required this.user,
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
  });

  UserLoginResponseModel copyWith({
    UserProfileModel? user,
    String? accessToken,
    int? expiresIn,
    String? tokenType,
  }) {
    return UserLoginResponseModel(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      tokenType: tokenType ?? this.tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user.toMap()});
    result.addAll({'access_token': accessToken});
    result.addAll({'expires_in': expiresIn});
    result.addAll({'token_type': tokenType});

    return result;
  }

  factory UserLoginResponseModel.fromMap(Map<String, dynamic> map) {
    return UserLoginResponseModel(
      user: UserProfileModel.fromMap(map['user']),
      accessToken: map['access_token'] ?? '',
      expiresIn: map['expires_in'] ?? '',
      tokenType: map['token_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginResponseModel.fromJson(String source) =>
      UserLoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserLoginResponseModel(user: $user, access_token: $accessToken, expires_in: $expiresIn, token_type: $tokenType)';
  }

  @override
  List<Object> get props => [
        user,
        expiresIn,
        tokenType,
        accessToken,
      ];
}
