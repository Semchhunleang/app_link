// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PayPalPayment extends Equatable {
  final int id;
  final int status;
  final String accountMode;
  final String clientId;
  final String secretId;
  final String countryCode;
  final String currencyCode;
  final int currencyRate;
  final String image;
  final String createdAt;
  final String updatedAt;

  const PayPalPayment({
    required this.id,
    required this.status,
    required this.accountMode,
    required this.clientId,
    required this.secretId,
    required this.countryCode,
    required this.currencyCode,
    required this.currencyRate,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  PayPalPayment copyWith({
    int? id,
    int? status,
    String? accountMode,
    String? clientId,
    String? secretId,
    String? countryCode,
    String? currencyCode,
    int? currencyRate,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return PayPalPayment(
      id: id ?? this.id,
      status: status ?? this.status,
      accountMode: accountMode ?? this.accountMode,
      clientId: clientId ?? this.clientId,
      secretId: secretId ?? this.secretId,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      currencyRate: currencyRate ?? this.currencyRate,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'account_mode': accountMode,
      'client_id': clientId,
      'secret_id': secretId,
      'country_code': countryCode,
      'currency_code': currencyCode,
      'currency_rate': currencyRate,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory PayPalPayment.fromMap(Map<String, dynamic> map) {
    return PayPalPayment(
      id: map['id'] ?? 0,
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      accountMode: map['account_mode'] ?? '',
      clientId: map['client_id'] ?? '',
      secretId: map['secret_id'] ?? '',
      countryCode: map['country_code'] ?? '',
      currencyCode: map['currency_code'] ?? '',
      currencyRate: map['currency_rate'] ?? '',
      image: map['image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PayPalPayment.fromJson(String source) =>
      PayPalPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      status,
      accountMode,
      clientId,
      secretId,
      countryCode,
      currencyCode,
      currencyRate,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
