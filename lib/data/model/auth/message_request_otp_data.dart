import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageRequestOtpData extends Equatable {
  final String phone;
  // final int code;
  final String retryIn;
  final int retryInSecond;

  const MessageRequestOtpData(
      {required this.phone,
      // required this.code,
      required this.retryIn,
      required this.retryInSecond});

  MessageRequestOtpData copyWith(
      {String? phone, int? code, String? retryIn, int? retryInSecond}) {
    return MessageRequestOtpData(
        phone: phone ?? this.phone,
        // code: code ?? this.code,
        retryIn: retryIn ?? this.retryIn,
        retryInSecond: retryInSecond ?? this.retryInSecond);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      // 'code': code,
      'retry_in': retryIn,
      'retry_in_second': retryInSecond,
    };
  }

  factory MessageRequestOtpData.fromMap(Map<String, dynamic> map) {
    return MessageRequestOtpData(
      phone: map['phone'] ?? '',
      // code:
      //     //map['code'] ?? '',
      //     map['code'] != null ? int.parse(map['code'].toString()) : 0,
      retryIn: map['retry_in'] ?? '',
      retryInSecond: map['retry_in_second'] != null
          ? int.parse(map['retry_in_second'].toString())
          : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageRequestOtpData.fromJson(String source) =>
      MessageRequestOtpData.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        phone,
        // code,
        retryIn,
        retryInSecond,
      ];
}
