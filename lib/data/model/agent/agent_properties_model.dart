import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../product/property_item_model.dart';

class AgentPropertiesModel extends Equatable {
  final int currentPage;
  final List<PropertyItemModel>? data;
  final int from;
  final int to;
  final int total;
  final int lastPage;
  final int perPage;

  const AgentPropertiesModel({
    required this.currentPage,
    required this.data,
    required this.from,
    required this.to,
    required this.total,
    required this.lastPage,
    required this.perPage,
  });

  AgentPropertiesModel copyWith({
    int? currentPage,
    List<PropertyItemModel>? data,
    int? from,
    int? to,
    int? total,
    int? lastPage,
    int? perPage,
  }) {
    return AgentPropertiesModel(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      from: from ?? this.from,
      to: to ?? this.to,
      total: total ?? this.total,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'data': data!.map((x) => x.toMap()).toList(),
      'from': from,
      'to': to,
      'total': total,
      'last_page': lastPage,
      'per_page': perPage,
    };
  }

  factory AgentPropertiesModel.fromMap(Map<String, dynamic> map) {
    return AgentPropertiesModel(
      currentPage: map['current_page'] != null
          ? int.parse(map['current_page'].toString())
          : 0,
      data: map['data'] != null
          ? List<PropertyItemModel>.from((map['data'] as List<dynamic>)
              .map<PropertyItemModel>(
                  (x) => PropertyItemModel.fromMap(x as Map<String, dynamic>)))
          : [],
      from: map['from'] != null ? int.parse(map['from'].toString()) : 0,
      to: map['to'] != null ? int.parse(map['to'].toString()) : 0,
      total: map['total'] != null ? int.parse(map['total'].toString()) : 0,
      lastPage:
          map['last_page'] != null ? int.parse(map['last_page'].toString()) : 0,
      perPage:
          map['per_page'] != null ? int.parse(map['per_page'].toString()) : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentPropertiesModel.fromJson(String source) =>
      AgentPropertiesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AgentPropertiesModel(currentPage: $currentPage, data: $data, from: $from, to: $to, total: $total, lastPage: $lastPage,perPage: $perPage)';
  }

  @override
  List<Object> get props {
    return [
      currentPage,
      data!,
      from,
      to,
      total,
      lastPage,
      perPage,
    ];
  }
}
