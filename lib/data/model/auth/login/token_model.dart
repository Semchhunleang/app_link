import 'dart:convert';

import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  final String tokenType;
  final int expiresIn;
  final String accessToken;
  final String refreshToken;

  const TokenModel(
      {required this.tokenType,
      required this.expiresIn,
      required this.accessToken,
      required this.refreshToken});

  TokenModel copyWith({
    String? tokenType,
    int? expiresIn,
    String? accessToken,
    String? refreshToken,
  }) {
    return TokenModel(
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token_type': tokenType,
      'expires_in': expiresIn,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    //print('uuuuuuuuuuuuuu');
    return TokenModel(
      tokenType: map['token_type'] ?? 0,
      expiresIn: map['expires_in'] ?? '',
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [tokenType, expiresIn, accessToken, refreshToken];
}
