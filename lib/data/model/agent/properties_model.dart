import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/agent/agent_single_property_model.dart';
import 'package:real_estate/data/model/link/link_model.dart';

class PropertiesModel extends Equatable {
  final int? currentPage;
  final List<AgentSingleProperty>? agentSingleProperty;
  final String? firstPageUrl;
  final int? from;
  //final int? lastPage;
  // final String? lastPageUrl;
  // final List<LinkModel>? links;
  // final String? nextPageUrl;
  // final String? path;
  // final int? perPage;
  // final String? prevPageUrl;
  // final int? to;
  // final int? total;

  const PropertiesModel({
    required this.currentPage,
    required this.agentSingleProperty,
    required this.firstPageUrl,
    required this.from,
    //required this.lastPage,
    // required this.lastPageUrl,
    // required this.links,
    // required this.nextPageUrl,
    // required this.path,
    // required this.perPage,
    // required this.prevPageUrl,
    // required this.to,
    // required this.total
  });

  PropertiesModel copyWith({
    int? currentPage,
    List<AgentSingleProperty>? agentSingleProperty,
    String? firstPageUrl,
    int? from,
    //int? lastPage,
    // String? lastPageUrl,
    // List<LinkModel>? links,
    // String? nextPageUrl,
    // String? path,
    // int? perPage,
    // String? prevPageUrl,
    // int? to,
    // int? total,
  }) {
    return PropertiesModel(
      currentPage: currentPage ?? this.currentPage,
      agentSingleProperty: agentSingleProperty ?? this.agentSingleProperty,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      //lastPage: lastPage ?? this.lastPage,
      // lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      // links: links ?? this.links,
      // nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      // path: path ?? this.path,
      // perPage: perPage ?? this.perPage,
      // prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      // to: to ?? this.to,
      // total: total ?? this.total
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'data': agentSingleProperty!.map((x) => x.toMap()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      //'last_page': lastPage,
      // 'last_page_url': lastPageUrl,
      // 'links': links!.map((x) => x.toMap()).toList(),
      // 'next_page_url': nextPageUrl,
      // 'path': path,
      // 'per_page': perPage,
      // 'prev_page_url': prevPageUrl,
      // 'to': to,
      // 'total': total,
    };
  }

  factory PropertiesModel.fromMap(Map<String, dynamic> map) {
    return PropertiesModel(
      currentPage: map['current_page'] != null
          ? int.parse(map['current_page'].toString())
          : 0,
      agentSingleProperty: map['data'] != null
          ? List<AgentSingleProperty>.from(
              (map['data'] as List<dynamic>).map<AgentSingleProperty?>(
                (x) => AgentSingleProperty.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      firstPageUrl: map['first_page_url'] ?? '',
      from: map['from'] != null ? int.parse(map['from'].toString()) : 0,
      // lastPage:
      //     map['last_page'] != null ? int.parse(map['from'].toString()) : 0,
      // lastPageUrl: map['last_page_url'] ?? '',
      // links: map['links'] != null
      //     ? List<LinkModel>.from(
      //         (map['links'] as List<dynamic>).map<AgentSingleProperty?>(
      //           (x) => AgentSingleProperty.fromMap(x as Map<String, dynamic>),
      //         ),
      //       )
      //     : [],
      // nextPageUrl: map['next_page_url'] ?? '',
      // path: map['path'] ?? '',
      // prevPageUrl: map['prev_page_url'] ?? '',
      // to: map['to'] != null ? int.parse(map['to'].toString()) : 0,
      // total: map['total'] != null ? int.parse(map['from'].toString()) : 0,
      // perPage:
      //     map['per_page'] != null ? int.parse(map['per_page'].toString()) : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertiesModel.fromJson(String source) =>
      PropertiesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      currentPage,
      agentSingleProperty,
      firstPageUrl,
      from,
      // lastPage,
      // lastPageUrl,
      // links,
      // nextPageUrl,
      // path,
      // perPage,
      // prevPageUrl,
      // to,
      // total,
    ];
  }
}
