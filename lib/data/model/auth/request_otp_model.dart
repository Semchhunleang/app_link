import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/auth/message_request_otp_data.dart';
import 'package:real_estate/logic/cubit/otp/request_otp_state.dart';

class RequestOtpModel extends Equatable {
  final String status;
  final String message;
  final MessageRequestOtpData? messageRequestOtpData;
  final RequestOtpState requestOtpState;

  const RequestOtpModel({
    this.status = '',
    this.message = '',
    this.messageRequestOtpData,
    this.requestOtpState = const OtpStateInitial(),
  });

  RequestOtpModel copyWith(
      {String? status,
      String? message,
      MessageRequestOtpData? messageRequestOtpData,
      RequestOtpState? requestOtpState}) {
    return RequestOtpModel(
      status: status ?? this.status,
      message: status ?? this.status,
      messageRequestOtpData:
          messageRequestOtpData ?? this.messageRequestOtpData,
      requestOtpState: requestOtpState ?? this.requestOtpState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': messageRequestOtpData!.toMap(),
    };
  }

  factory RequestOtpModel.fromMap(Map<String, dynamic> map) {
    return RequestOtpModel(
      status: map['phone'] ?? '',
      message: map['code'] ?? '',
      messageRequestOtpData: map['data'] != null
          ? MessageRequestOtpData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestOtpModel.fromJson(String source) =>
      RequestOtpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [status, message, messageRequestOtpData, requestOtpState];
}
