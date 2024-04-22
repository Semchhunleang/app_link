import 'dart:convert';

import 'package:equatable/equatable.dart';

class SingleOrderModel extends Equatable {
  final int id;
  final String orderId;
  final int agentId;
  final int pricingPlanId;
  final String planType;
  final double planPrice;
  final String planName;
  final String expiredTime;
  final int numberOfProperty;
  final String featuredProperty;
  final int featuredPropertyQty;
  final String topProperty;
  final int topPropertyQty;
  final String urgentProperty;
  final int urgentPropertyQty;
  final String orderStatus;
  final String paymentStatus;
  final String transactionId;
  final String paymentMethod;
  final String expirationDate;
  final String createdAt;
  final String updatedAt;

  const SingleOrderModel({
    required this.id,
    required this.orderId,
    required this.agentId,
    required this.pricingPlanId,
    required this.planType,
    required this.planPrice,
    required this.planName,
    required this.expiredTime,
    required this.numberOfProperty,
    required this.featuredProperty,
    required this.featuredPropertyQty,
    required this.topProperty,
    required this.topPropertyQty,
    required this.urgentProperty,
    required this.urgentPropertyQty,
    required this.orderStatus,
    required this.paymentStatus,
    required this.transactionId,
    required this.paymentMethod,
    required this.expirationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  SingleOrderModel copyWith({
    int? id,
    String? orderId,
    int? agentId,
    int? pricingPlanId,
    String? planType,
    double? planPrice,
    String? planName,
    String? expiredTime,
    int? numberOfProperty,
    String? featuredProperty,
    int? featuredPropertyQty,
    String? topProperty,
    int? topPropertyQty,
    String? urgentProperty,
    int? urgentPropertyQty,
    String? orderStatus,
    String? paymentStatus,
    String? transactionId,
    String? paymentMethod,
    String? expirationDate,
    String? createdAt,
    String? updatedAt,
  }) {
    return SingleOrderModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      agentId: agentId ?? this.agentId,
      pricingPlanId: pricingPlanId ?? this.pricingPlanId,
      planType: planType ?? this.planType,
      planPrice: planPrice ?? this.planPrice,
      planName: planName ?? this.planName,
      expiredTime: expiredTime ?? this.expiredTime,
      numberOfProperty: numberOfProperty ?? this.numberOfProperty,
      featuredProperty: featuredProperty ?? this.featuredProperty,
      featuredPropertyQty: featuredPropertyQty ?? this.featuredPropertyQty,
      topProperty: topProperty ?? this.topProperty,
      topPropertyQty: topPropertyQty ?? this.topPropertyQty,
      urgentProperty: urgentProperty ?? this.urgentProperty,
      urgentPropertyQty: urgentPropertyQty ?? this.urgentPropertyQty,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      transactionId: transactionId ?? this.transactionId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      expirationDate: expirationDate ?? this.expirationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_id': orderId,
      'agent_id': agentId,
      'pricing_plan_id': pricingPlanId,
      'plan_type': planType,
      'plan_price': planPrice,
      'plan_name': planName,
      'expired_time': expiredTime,
      'number_of_property': numberOfProperty,
      'featured_property': featuredProperty,
      'featured_property_qty': featuredPropertyQty,
      'top_property': topProperty,
      'top_property_qty': topPropertyQty,
      'urgent_property': urgentProperty,
      'urgent_property_qty': urgentPropertyQty,
      'order_status': orderStatus,
      'payment_status': paymentStatus,
      'transaction_id': transactionId,
      'payment_method': paymentMethod,
      'expiration_date': expirationDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SingleOrderModel.fromMap(Map<String, dynamic> map) {
    return SingleOrderModel(
      id: map['id'] as int,
      orderId: map['order_id'] ?? '',
      agentId:
          map['agent_id'] != null ? int.parse(map['agent_id'].toString()) : 0,
      pricingPlanId: map['pricing_plan_id'] != null
          ? int.parse(map['pricing_plan_id'].toString())
          : 0,
      planType: map['plan_type'] ?? '',
      planPrice: map['plan_price'] != null
          ? double.parse(map['plan_price'].toString())
          : 0.0,
      planName: map['plan_name'] ?? '',
      expiredTime: map['expired_time'] ?? '',
      numberOfProperty: map['number_of_property'] != null
          ? int.parse(map['number_of_property'].toString())
          : 0,
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
      orderStatus: map['order_status'] ?? '',
      paymentStatus: map['payment_status'] ?? '',
      transactionId: map['transaction_id'] ?? '',
      paymentMethod: map['payment_method'] ?? '',
      expirationDate: map['expiration_date'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleOrderModel.fromJson(String source) =>
      SingleOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      orderId,
      agentId,
      pricingPlanId,
      planType,
      planPrice,
      planName,
      expiredTime,
      numberOfProperty,
      featuredProperty,
      featuredPropertyQty,
      topProperty,
      topPropertyQty,
      urgentProperty,
      urgentPropertyQty,
      orderStatus,
      paymentStatus,
      transactionId,
      paymentMethod,
      expirationDate,
      createdAt,
      updatedAt,
    ];
  }
}
