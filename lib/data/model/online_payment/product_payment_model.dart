import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/online_payment/product_data_model.dart';

class ProductPaymentModel extends Equatable {
  final List<ProductDataModel> productDataModel;

  const ProductPaymentModel({required this.productDataModel});

  ProductPaymentModel copyWith({List<ProductDataModel>? productDataModel}) {
    return ProductPaymentModel(
        productDataModel: productDataModel ?? this.productDataModel);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': productDataModel.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductPaymentModel.fromMap(Map<String, dynamic> map) {
    return ProductPaymentModel(
      productDataModel: map['data'] != null
          ? List<ProductDataModel>.from(
              (map['data'] as List<dynamic>).map<ProductDataModel>(
                (x) => ProductDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPaymentModel.fromJson(String source) =>
      ProductPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [productDataModel];
}
