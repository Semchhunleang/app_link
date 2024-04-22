// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RazorPayPayment extends Equatable {
  final int id;
  final int status;
  final String name;
  final double currencyRate;
  final String countryCode;
  final String currencyCode;
  final String description;
  final String image;
  final String color;
  final String key;
  final String secretKey;
  final String createdAt;
  final String updatedAt;

  const RazorPayPayment({
    required this.id,
    required this.status,
    required this.name,
    required this.currencyRate,
    required this.countryCode,
    required this.currencyCode,
    required this.description,
    required this.image,
    required this.color,
    required this.key,
    required this.secretKey,
    required this.createdAt,
    required this.updatedAt,
  });

  RazorPayPayment copyWith({
    int? id,
    int? status,
    String? name,
    double? currencyRate,
    String? countryCode,
    String? currencyCode,
    String? description,
    String? image,
    String? color,
    String? key,
    String? secretKey,
    String? createdAt,
    String? updatedAt,
  }) {
    return RazorPayPayment(
      id: id ?? this.id,
      status: status ?? this.status,
      name: name ?? this.name,
      currencyRate: currencyRate ?? this.currencyRate,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      description: description ?? this.description,
      image: image ?? this.image,
      color: color ?? this.color,
      key: key ?? this.key,
      secretKey: secretKey ?? this.secretKey,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'name': name,
      'currency_rate': currencyRate,
      'country_code': countryCode,
      'currency_code': currencyCode,
      'description': description,
      'image': image,
      'color': color,
      'key': key,
      'secret_key': secretKey,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory RazorPayPayment.fromMap(Map<String, dynamic> map) {
    return RazorPayPayment(
      id: map['id'] ?? '',
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      name: map['name'] ?? '',
      currencyRate: map['currency_rate'] != null
          ? double.parse(map['currency_rate'].toString())
          : 0.0,
      countryCode: map['country_code'] ?? '',
      currencyCode: map['currency_code'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      color: map['color'] ?? '',
      key: map['key'] ?? '',
      secretKey: map['secret_key'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RazorPayPayment.fromJson(String source) =>
      RazorPayPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      status,
      name,
      currencyRate,
      countryCode,
      currencyCode,
      description,
      image,
      color,
      key,
      secretKey,
      createdAt,
      updatedAt,
    ];
  }
}
