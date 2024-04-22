import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/data/model/auth/user_profile_model.dart';
import 'single_order_model.dart';

class OrderModel extends Equatable {
  final UserProfileModel? user;
  final List<SingleOrderModel>? orders;

  const OrderModel({
    required this.user,
    required this.orders,
  });

  OrderModel copyWith({
    UserProfileModel? user,
    List<SingleOrderModel>? orders,
  }) {
    return OrderModel(
      user: user ?? this.user,
      orders: orders ?? this.orders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toMap(),
      'orders': orders!.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      user: map['user'] != null
          ? UserProfileModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      orders: map['orders']['data'] != null
          ? List<SingleOrderModel>.from(
              (map['orders']['data'] as List<dynamic>).map<SingleOrderModel?>(
                (x) => SingleOrderModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user!, orders!];
}
