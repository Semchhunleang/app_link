import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/product_subscription/description_model.dart';

class DataSubscriptionModel extends Equatable {
  final int? id;
  final String? code;
  final String? name;
  final String? price;
  final String? group;
  final int? defaults;
  final int? order;
  final List<DescriptionModel>? description;
  final String? createdAt;
  final String? updatedAt;

  const DataSubscriptionModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.price,
      required this.group,
      required this.defaults,
      required this.createdAt,
      required this.description,
      required this.order,
      required this.updatedAt});

  DataSubscriptionModel copyWith({
    int? id,
    String? code,
    String? name,
    String? price,
    String? group,
    int? defaults,
    int? order,
    List<DescriptionModel>? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return DataSubscriptionModel(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
        group: group ?? this.group,
        defaults: defaults ?? this.defaults,
        createdAt: createdAt ?? this.createdAt,
        description: description ?? this.description,
        order: order ?? this.order,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "code": code,
      "name": name,
      "price": price,
      "group": group,
      "default": defaults,
      "created_at": createdAt,
      "description": description,
      "order": order,
      "updated_at": updatedAt,
    };
  }

  factory DataSubscriptionModel.fromMap(Map<String, dynamic> map) {
    return DataSubscriptionModel(
        id: map['id'] as int,
        code: map['code'] ?? "",
        name: map['name'] ?? "",
        price: map['price'] ?? "",
        group: map['group'] ?? "",
        defaults:
            map['default'] != null ? int.parse(map['default'].toString()) : 0,
        createdAt: map['created_at'] ?? "",
        description: map['description'] != null
            ? List<DescriptionModel>.from(
                (map['description'] as List<dynamic>).map<DescriptionModel?>(
                  (x) => DescriptionModel.fromMap(x as Map<String, dynamic>),
                ),
              )
            : [],
        order: map['order'] != null ? int.parse(map['order'].toString()) : 0,
        updatedAt: map['updated_at'] ?? "");
  }

  String toJson() => json.encode(toMap());

  factory DataSubscriptionModel.fromJson(String source) =>
      DataSubscriptionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

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
        createdAt,
        description,
        order,
        updatedAt
      ];
}
