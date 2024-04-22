import 'dart:convert';

import 'package:equatable/equatable.dart';

class MolliPayStackPayment extends Equatable {
  final int id;
  final String mollieKey;
  final int mollieStatus;
  final double mollieCurrencyRate;
  final String paystackPublicKey;
  final String paystackSecretKey;
  final double paystackCurrencyRate;
  final int paystackStatus;
  final String mollieCountryCode;
  final String mollieCurrencyCode;
  final String paystackCountryCode;
  final String paystackCurrencyCode;
  final String mollieImage;
  final String paystackImage;
  final String createdAt;
  final String updatedAt;

  const MolliPayStackPayment({
    required this.id,
    required this.mollieKey,
    required this.mollieStatus,
    required this.mollieCurrencyRate,
    required this.paystackPublicKey,
    required this.paystackSecretKey,
    required this.paystackCurrencyRate,
    required this.paystackStatus,
    required this.mollieCountryCode,
    required this.mollieCurrencyCode,
    required this.paystackCountryCode,
    required this.paystackCurrencyCode,
    required this.mollieImage,
    required this.paystackImage,
    required this.createdAt,
    required this.updatedAt,
  });

  MolliPayStackPayment copyWith({
    int? id,
    String? mollieKey,
    int? mollieStatus,
    double? mollieCurrencyRate,
    String? paystackPublicKey,
    String? paystackSecretKey,
    double? paystackCurrencyRate,
    int? paystackStatus,
    String? mollieCountryCode,
    String? mollieCurrencyCode,
    String? paystackCountryCode,
    String? paystackCurrencyCode,
    String? mollieImage,
    String? paystackImage,
    String? createdAt,
    String? updatedAt,
  }) {
    return MolliPayStackPayment(
      id: id ?? this.id,
      mollieKey: mollieKey ?? this.mollieKey,
      mollieStatus: mollieStatus ?? this.mollieStatus,
      mollieCurrencyRate: mollieCurrencyRate ?? this.mollieCurrencyRate,
      paystackPublicKey: paystackPublicKey ?? this.paystackPublicKey,
      paystackSecretKey: paystackSecretKey ?? this.paystackSecretKey,
      paystackCurrencyRate: paystackCurrencyRate ?? this.paystackCurrencyRate,
      paystackStatus: paystackStatus ?? this.paystackStatus,
      mollieCountryCode: mollieCountryCode ?? this.mollieCountryCode,
      mollieCurrencyCode: mollieCurrencyCode ?? this.mollieCurrencyCode,
      paystackCountryCode: paystackCountryCode ?? this.paystackCountryCode,
      paystackCurrencyCode: paystackCurrencyCode ?? this.paystackCurrencyCode,
      mollieImage: mollieImage ?? this.mollieImage,
      paystackImage: paystackImage ?? this.paystackImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mollie_key': mollieKey,
      'mollie_status': mollieStatus,
      'mollie_currency_rate': mollieCurrencyRate,
      'paystack_public_key': paystackPublicKey,
      'paystack_secret_key': paystackSecretKey,
      'paystack_currency_rate': paystackCurrencyRate,
      'paystack_status': paystackStatus,
      'mollie_country_code': mollieCountryCode,
      'mollie_currency_code': mollieCurrencyCode,
      'paystack_country_code': paystackCountryCode,
      'paystack_currency_code': paystackCurrencyCode,
      'mollie_image': mollieImage,
      'paystack_image': paystackImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory MolliPayStackPayment.fromMap(Map<String, dynamic> map) {
    return MolliPayStackPayment(
      id: map['id'] ?? '',
      mollieKey: map['mollie_key'] ?? '',
      mollieStatus: map['mollie_status'] != null
          ? int.parse(map['mollie_status'].toString())
          : 0,
      mollieCurrencyRate: map['mollie_currency_rate'] != null
          ? double.parse(map['mollie_currency_rate'].toString())
          : 0.0,
      paystackPublicKey: map['paystack_public_key'] ?? '',
      paystackSecretKey: map['paystack_secret_key'] ?? '',
      paystackCurrencyRate: map['paystack_currency_rate'] != null
          ? double.parse(map['paystack_currency_rate'].toString())
          : 0.0,
      paystackStatus: map['paystack_status'] != null
          ? int.parse(map['paystack_status'].toString())
          : 0,
      mollieCountryCode: map['mollie_country_code'] ?? '',
      mollieCurrencyCode: map['mollie_currency_code'] ?? '',
      paystackCountryCode: map['paystack_country_code'] ?? '',
      paystackCurrencyCode: map['paystack_currency_code'] ?? '',
      mollieImage: map['mollie_image'] ?? '',
      paystackImage: map['paystack_image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MolliPayStackPayment.fromJson(String source) =>
      MolliPayStackPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      mollieKey,
      mollieStatus,
      mollieCurrencyRate,
      paystackPublicKey,
      paystackSecretKey,
      paystackCurrencyRate,
      paystackStatus,
      mollieCountryCode,
      mollieCurrencyCode,
      paystackCountryCode,
      paystackCurrencyCode,
      mollieImage,
      paystackImage,
      createdAt,
      updatedAt,
    ];
  }
}
