import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyOtpModel extends Equatable {
  final String phone;
  final String code;
  final String callBackType;
  final String checkVerifyOnly;
  final String password;
  final String confirmPassword;

  const VerifyOtpModel(
      {required this.phone,
      required this.code,
      required this.callBackType,
      this.checkVerifyOnly = '',
      this.password = '',
      this.confirmPassword = ''});

  VerifyOtpModel copyWith(
      {String? phone,
      String? code,
      String? callBackType,
      String? checkVerifyOnly,
      String? password,
      String? confirmPassword}) {
    return VerifyOtpModel(
      phone: phone ?? this.phone,
      code: code ?? this.code,
      callBackType: callBackType ?? this.callBackType,
      checkVerifyOnly: checkVerifyOnly ?? this.checkVerifyOnly,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'phone': phone});
    result.addAll({'code': code});
    result.addAll({'callback_type': callBackType});
    result.addAll({'check_verify_only': checkVerifyOnly});
    result.addAll({'password': password});
    result.addAll({'password_confirmation': confirmPassword});
    return result;
  }

  factory VerifyOtpModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpModel(
      phone: map['phone'] ?? '',
      code: map['code'] ?? '',
      callBackType: map['callback_type'] ?? '',
      checkVerifyOnly: map['check_verify_only'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpModel.fromJson(String source) =>
      VerifyOtpModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VerifyOtpModel(phone: $phone,code: $code, callback_type: $callBackType, check_verify_only: $checkVerifyOnly, password: $password, password_confirmation: $confirmPassword)';
  }

  @override
  List<Object?> get props =>
      [phone, code, callBackType, checkVerifyOnly, password, confirmPassword];
}
