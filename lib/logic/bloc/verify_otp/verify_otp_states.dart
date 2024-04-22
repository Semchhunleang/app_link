import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/model/auth/auth_error_model.dart';

class VerifyOtpModelState extends Equatable {
  final String phone;
  final String countryCode;
  final String code;
  final String callBackType;
  final String checkVerifyOnly;
  final String password;
  final String confirmPassword;
  final VerifyOtpState state;
  const VerifyOtpModelState({
    this.phone = '',
    this.countryCode = '',
    this.code = '',
    this.callBackType = '',
    this.checkVerifyOnly = '',
    this.password = '',
    this.confirmPassword = '',
    this.state = const VerifyOtpStateInitial(),
  });

  VerifyOtpModelState copyWith({
    String? phone,
    String? countryCode,
    String? code,
    String? callBackType,
    String? checkVerifyOnly,
    String? password,
    String? confirmPassword,
    VerifyOtpState? state,
  }) {
    return VerifyOtpModelState(
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      code: code ?? this.code,
      callBackType: callBackType ?? this.callBackType,
      checkVerifyOnly: checkVerifyOnly ?? this.checkVerifyOnly,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'phone': "$countryCode$phone".trim()});
    result.addAll({'code': code.trim()});
    result.addAll({'callback_type': callBackType.trim()});
    result.addAll({'check_verify_only': checkVerifyOnly.trim()});
    result.addAll({'password': password.trim()});
    result.addAll({'password_confirmation': confirmPassword.trim()});

    return result;
  }

  factory VerifyOtpModelState.fromMap(Map<String, dynamic> map) {
    return VerifyOtpModelState(
      phone: map['phone'] ?? '',
      code: map['code'] ?? '',
      callBackType: map['callback_type'] ?? '',
      checkVerifyOnly: map['check_verify_only'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpModelState.fromJson(String source) =>
      VerifyOtpModelState.fromMap(json.decode(source));

  @override
  String toString() =>
      'VerifyOtpModelState(phone: $phone, country_code: $countryCode, code: $code, callback_type: $callBackType, check_verify_only: $checkVerifyOnly, password: $password, password_confirmation: $confirmPassword, state: $state)';

  @override
  List<Object> get props => [
        phone,
        countryCode,
        code,
        callBackType,
        checkVerifyOnly,
        password,
        confirmPassword,
        state
      ];
}

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpStateInitial extends VerifyOtpState {
  const VerifyOtpStateInitial();
}

class VerifyOtpStateFormInvalid extends VerifyOtpState {
  final Errors error;
  const VerifyOtpStateFormInvalid(this.error);
  @override
  List<Object> get props => [error];
}

class VerifyOtpStateLoading extends VerifyOtpState {
  const VerifyOtpStateLoading();
}

class VerifyOtpStatesLoaded extends VerifyOtpState {
  final String message;

  const VerifyOtpStatesLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class VerifyOtpStateErrorMessage extends VerifyOtpState {
  const VerifyOtpStateErrorMessage(this.errorMsg);

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}

class VerifyOtpStatesError extends VerifyOtpState {
  final String errorMsg;
  final int statusCode;

  const VerifyOtpStatesError(this.errorMsg, this.statusCode);

  @override
  List<Object> get props => [errorMsg, statusCode];
}
