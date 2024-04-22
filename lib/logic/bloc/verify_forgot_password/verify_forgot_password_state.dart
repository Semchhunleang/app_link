import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/model/auth/auth_error_model.dart';

class VerifyForgotPasswordModelState extends Equatable {
  final String phone;
  final String countryCode;
  final VerifyForgotPasswordState state;
  const VerifyForgotPasswordModelState({
    this.phone = '',
    this.countryCode = '',
    this.state = const VerifyForgotPasswordStateInitial(),
  });

  VerifyForgotPasswordModelState copyWith({
    String? phone,
    String? countryCode,
    VerifyForgotPasswordState? state,
  }) {
    return VerifyForgotPasswordModelState(
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'phone': "$countryCode$phone".trim()});

    return result;
  }

  VerifyForgotPasswordModelState clear() {
    return const VerifyForgotPasswordModelState(
      phone: "",
      countryCode: "",
      state: VerifyForgotPasswordStateInitial(),
    );
  }

  factory VerifyForgotPasswordModelState.fromMap(Map<String, dynamic> map) {
    return VerifyForgotPasswordModelState(
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyForgotPasswordModelState.fromJson(String source) =>
      VerifyForgotPasswordModelState.fromMap(json.decode(source));

  @override
  String toString() =>
      'VerifyForgotPasswordModelState(phone: $phone, country_code: $countryCode, state: $state)';

  @override
  List<Object> get props => [phone, countryCode, state];
}

abstract class VerifyForgotPasswordState extends Equatable {
  const VerifyForgotPasswordState();

  @override
  List<Object> get props => [];
}

class VerifyForgotPasswordStateInitial extends VerifyForgotPasswordState {
  const VerifyForgotPasswordStateInitial();
}

class VerifyForgotPasswordStateFormInvalid extends VerifyForgotPasswordState {
  final Errors error;
  const VerifyForgotPasswordStateFormInvalid(this.error);
  @override
  List<Object> get props => [error];
}

class VerifyForgotPasswordStateLoading extends VerifyForgotPasswordState {
  const VerifyForgotPasswordStateLoading();
}

class VerifyForgotPasswordStateLoaded extends VerifyForgotPasswordState {
  final String message;

  const VerifyForgotPasswordStateLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class VerifyForgotPassStateError extends VerifyForgotPasswordState {
  const VerifyForgotPassStateError(this.errorMsg);

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}

class VerifyForgotPasswordStateError extends VerifyForgotPasswordState {
  final String errorMsg;
  final int statusCode;

  const VerifyForgotPasswordStateError(this.errorMsg, this.statusCode);

  @override
  List<Object> get props => [errorMsg, statusCode];
}
