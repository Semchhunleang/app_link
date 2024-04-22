import 'dart:convert';

import 'package:equatable/equatable.dart';

class PricePlan extends Equatable {
  final int id;
  final String planName;
  final String planSlug;
  final double planPrice;
  final String planType;
  final String expiredTime;
  final int numberOfProperty;
  final String featuredProperty;
  final int featuredPropertyQty;
  final String topProperty;
  final int topPropertyQty;
  final String urgentProperty;
  final int urgentPropertyQty;
  final int serial;
  final String status;
  final String createdAt;
  final String updatedAt;

  const PricePlan({
    required this.id,
    required this.planName,
    required this.planSlug,
    required this.planPrice,
    required this.planType,
    required this.expiredTime,
    required this.numberOfProperty,
    required this.featuredProperty,
    required this.featuredPropertyQty,
    required this.topProperty,
    required this.topPropertyQty,
    required this.urgentProperty,
    required this.urgentPropertyQty,
    required this.serial,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  PricePlan copyWith({
    int? id,
    String? planName,
    String? planSlug,
    double? planPrice,
    String? planType,
    String? expiredTime,
    int? numberOfProperty,
    String? featuredProperty,
    int? featuredPropertyQty,
    String? topProperty,
    int? topPropertyQty,
    String? urgentProperty,
    int? urgentPropertyQty,
    int? serial,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return PricePlan(
      id: id ?? this.id,
      planName: planName ?? this.planName,
      planSlug: planSlug ?? this.planSlug,
      planPrice: planPrice ?? this.planPrice,
      planType: planType ?? this.planType,
      expiredTime: expiredTime ?? this.expiredTime,
      numberOfProperty: numberOfProperty ?? this.numberOfProperty,
      featuredProperty: featuredProperty ?? this.featuredProperty,
      featuredPropertyQty: featuredPropertyQty ?? this.featuredPropertyQty,
      topProperty: topProperty ?? this.topProperty,
      topPropertyQty: topPropertyQty ?? this.topPropertyQty,
      urgentProperty: urgentProperty ?? this.urgentProperty,
      urgentPropertyQty: urgentPropertyQty ?? this.urgentPropertyQty,
      serial: serial ?? this.serial,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'plan_name': planName,
      'plan_slug': planSlug,
      'plan_price': planPrice,
      'plan_type': planType,
      'expired_time': expiredTime,
      'number_of_property': numberOfProperty,
      'featured_property': featuredProperty,
      'featured_property_qty': featuredPropertyQty,
      'top_property': topProperty,
      'top_property_qty': topPropertyQty,
      'urgent_property': urgentProperty,
      'urgent_property_qty': urgentPropertyQty,
      'serial': serial,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory PricePlan.fromMap(Map<String, dynamic> map) {
    return PricePlan(
      id: map['id'] ?? '',
      planName: map['plan_name'] ?? '',
      planSlug: map['plan_slug'] ?? '',
      planPrice: map['plan_price'] != null
          ? double.parse(map['plan_price'].toString())
          : 0.0,
      planType: map['plan_type'] ?? '',
      expiredTime: map['expired_time'] ?? '',
      numberOfProperty: map['number_of_property'] ?? '',
      featuredProperty: map['featured_property'] ?? '',
      featuredPropertyQty: map['featured_property_qty'] != null
          ? int.parse(map['featured_property_qty'].toString())
          : 0,
      topProperty: map['top_property'] ?? '',
      topPropertyQty: map['top_property_qty'] != null
          ? int.parse(map['top_property_qty'].toString())
          : 0,
      urgentProperty: map['urgent_property'] ?? '',
      urgentPropertyQty: map['urgent_property_qty'] != null
          ? int.parse(map['urgent_property_qty'].toString())
          : 0,
      serial: map['serial'] != null ? int.parse(map['serial'].toString()) : 0,
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PricePlan.fromJson(String source) =>
      PricePlan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      planName,
      planSlug,
      planPrice,
      planType,
      expiredTime,
      numberOfProperty,
      featuredProperty,
      featuredPropertyQty,
      topProperty,
      topPropertyQty,
      urgentProperty,
      urgentPropertyQty,
      serial,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
