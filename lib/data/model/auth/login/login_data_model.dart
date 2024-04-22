import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/auth/login/token_model.dart';
import 'package:real_estate/data/model/auth/login/user_data_model.dart';

class LoginDataModel extends Equatable {
  final UserDataModel userDataModel;
  final TokenModel tokenModel;

  const LoginDataModel({
    required this.userDataModel,
    required this.tokenModel,
  });

  LoginDataModel copyWith({
    UserDataModel? userDataModel,
    TokenModel? tokenModel,
  }) {
    return LoginDataModel(
      userDataModel: userDataModel ?? this.userDataModel,
      tokenModel: tokenModel ?? this.tokenModel,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': userDataModel.toMap()});
    result.addAll({'token': tokenModel.toMap()});
    return result;
  }

  factory LoginDataModel.fromMap(Map<String, dynamic> map) {
    return LoginDataModel(
        userDataModel: UserDataModel.fromMap(map['data']),
        tokenModel: TokenModel.fromMap(map['token']));
  }

  String toJson() => json.encode(toMap());

  factory LoginDataModel.fromJson(String source) =>
      LoginDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginDataModel(data: $userDataModel, token: $tokenModel)';
  }

  @override
  List<Object?> get props => [userDataModel, tokenModel];
}
