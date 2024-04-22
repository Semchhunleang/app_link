import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/product_subscription/data_subscription_model.dart';

class ProductSubscriptionModel extends Equatable {
  final List<DataSubscriptionModel>? dataSubscription;

  const ProductSubscriptionModel({required this.dataSubscription});

  ProductSubscriptionModel copyWith(
      {List<DataSubscriptionModel>? dataSubscription}) {
    return ProductSubscriptionModel(
        dataSubscription: dataSubscription ?? this.dataSubscription);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "data": dataSubscription,
    };
  }

  factory ProductSubscriptionModel.fromMap(Map<String, dynamic> map) {
    return ProductSubscriptionModel(
      dataSubscription: map['data'] != null
          ? List<DataSubscriptionModel>.from(
              (map['data'] as List<dynamic>).map<DataSubscriptionModel?>(
                (x) => DataSubscriptionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSubscriptionModel.fromJson(String source) =>
      ProductSubscriptionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [dataSubscription];
}
