// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FlutterWavePayment extends Equatable {
  final int id;
  final String publicKey;
  final String secretKey;
  final double currencyRate;
  final String countryCode;
  final String currencyCode;
  final String title;
  final String logo;
  final int status;
  final String createdAt;
  final String updatedAt;

  const FlutterWavePayment({
    required this.id,
    required this.publicKey,
    required this.secretKey,
    required this.currencyRate,
    required this.countryCode,
    required this.currencyCode,
    required this.title,
    required this.logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  FlutterWavePayment copyWith({
    int? id,
    String? publicKey,
    String? secretKey,
    double? currencyRate,
    String? countryCode,
    String? currencyCode,
    String? title,
    String? logo,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return FlutterWavePayment(
      id: id ?? this.id,
      publicKey: publicKey ?? this.publicKey,
      secretKey: secretKey ?? this.secretKey,
      currencyRate: currencyRate ?? this.currencyRate,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      title: title ?? this.title,
      logo: logo ?? this.logo,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'public_key': publicKey,
      'secret_key': secretKey,
      'currency_rate': currencyRate,
      'country_code': countryCode,
      'currency_code': currencyCode,
      'title': title,
      'logo': logo,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory FlutterWavePayment.fromMap(Map<String, dynamic> map) {
    return FlutterWavePayment(
      id: map['id'] ?? '',
      publicKey: map['public_key'] ?? '',
      secretKey: map['secret_key'] ?? '',
      currencyRate: map['currency_rate'] != null
          ? double.parse(map['currency_rate'].toString())
          : 0.0,
      countryCode: map['country_code'] ?? '',
      currencyCode: map['currency_code'] ?? '',
      title: map['title'] ?? '',
      logo: map['logo'] ?? '',
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlutterWavePayment.fromJson(String source) =>
      FlutterWavePayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      publicKey,
      secretKey,
      currencyRate,
      countryCode,
      currencyCode,
      title,
      logo,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
