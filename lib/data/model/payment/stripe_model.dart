// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class StripePayment extends Equatable {
  final int id;
  final int status;
  final String stripeKey;
  final String stripeSecret;
  final String createdAt;
  final String updatedAt;
  final String countryCode;
  final String currencyCode;
  final double currencyRate;
  final String image;

  const StripePayment({
    required this.id,
    required this.status,
    required this.stripeKey,
    required this.stripeSecret,
    required this.createdAt,
    required this.updatedAt,
    required this.countryCode,
    required this.currencyCode,
    required this.currencyRate,
    required this.image,
  });

  StripePayment copyWith({
    int? id,
    int? status,
    String? stripeKey,
    String? stripeSecret,
    String? createdAt,
    String? updatedAt,
    String? countryCode,
    String? currencyCode,
    double? currencyRate,
    String? image,
  }) {
    return StripePayment(
      id: id ?? this.id,
      status: status ?? this.status,
      stripeKey: stripeKey ?? this.stripeKey,
      stripeSecret: stripeSecret ?? this.stripeSecret,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      currencyRate: currencyRate ?? this.currencyRate,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'stripe_key': stripeKey,
      'stripe_secret': stripeSecret,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'country_code': countryCode,
      'currency_code': currencyCode,
      'currency_rate': currencyRate,
      'image': image,
    };
  }

  factory StripePayment.fromMap(Map<String, dynamic> map) {
    return StripePayment(
      id: map['id'] ?? 0,
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      stripeKey: map['stripe_key'] ?? '',
      stripeSecret: map['stripe_secret'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      countryCode: map['country_code'] ?? '',
      currencyCode: map['currency_code'] ?? '',
      currencyRate: map['currency_rate'] != null
          ? double.parse(map['status'].toString())
          : 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StripePayment.fromJson(String source) =>
      StripePayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      status,
      stripeKey,
      stripeSecret,
      createdAt,
      updatedAt,
      countryCode,
      currencyCode,
      currencyRate,
      image,
    ];
  }
}
