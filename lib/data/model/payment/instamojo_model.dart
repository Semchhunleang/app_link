// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class InstamojoPayment extends Equatable {
  final int id;
  final String apiKey;
  final String authToken;
  final double currencyRate;
  final String accountMode;
  final int status;
  final String image;
  final String createdAt;
  final String updatedAt;

  const InstamojoPayment({
    required this.id,
    required this.apiKey,
    required this.authToken,
    required this.currencyRate,
    required this.accountMode,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  InstamojoPayment copyWith({
    int? id,
    String? apiKey,
    String? authToken,
    double? currencyRate,
    String? accountMode,
    int? status,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return InstamojoPayment(
      id: id ?? this.id,
      apiKey: apiKey ?? this.apiKey,
      authToken: authToken ?? this.authToken,
      currencyRate: currencyRate ?? this.currencyRate,
      accountMode: accountMode ?? this.accountMode,
      status: status ?? this.status,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'api_key': apiKey,
      'auth_token': authToken,
      'currency_rate': currencyRate,
      'account_mode': accountMode,
      'status': status,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory InstamojoPayment.fromMap(Map<String, dynamic> map) {
    return InstamojoPayment(
      id: map['id'] ?? 0,
      apiKey: map['api_key'] ?? '',
      authToken: map['auth_token'] ?? '',
      currencyRate: map['currency_rate'] != null
          ? double.parse(map['currency_rate'].toString())
          : 0.0,
      accountMode: map['account_mode'] ?? '',
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      image: map['image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InstamojoPayment.fromJson(String source) =>
      InstamojoPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      apiKey,
      authToken,
      currencyRate,
      accountMode,
      status,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
