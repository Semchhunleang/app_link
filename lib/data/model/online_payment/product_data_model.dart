import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/online_payment/description_product_mode.dart';

class ProductDataModel extends Equatable {
  final int id;
  final String code;
  final String name;
  final String price;
  final String group;
  final int defaults;
  final int order;
  final List<DescriptionProductModel> descriptionProductModel;

  const ProductDataModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.price,
      required this.group,
      required this.defaults,
      required this.order,
      required this.descriptionProductModel});

  ProductDataModel copyWith(
      {int? id,
      String? code,
      String? name,
      String? price,
      String? group,
      int? defaults,
      int? order,
      List<DescriptionProductModel>? descriptionProductModel}) {
    return ProductDataModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      price: price ?? this.price,
      group: group ?? this.group,
      defaults: defaults ?? this.defaults,
      order: order ?? this.order,
      descriptionProductModel:
          descriptionProductModel ?? this.descriptionProductModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'price': price,
      'group': group,
      'default': defaults,
      'order': order,
      'description': descriptionProductModel.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'] ?? 0,
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      group: map['group'] ?? '',
      defaults: map['default'] ?? 0,
      order: map['order'] ?? 0,
      descriptionProductModel: map['description'] != null
          ? List<DescriptionProductModel>.from(
              (map['description'] as List<dynamic>)
                  .map<DescriptionProductModel>(
                (x) =>
                    DescriptionProductModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDataModel.fromJson(String source) =>
      ProductDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        price,
        group,
        defaults,
        order,
        descriptionProductModel,
      ];
}
