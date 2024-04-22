import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'search_property_model.dart';

class SearchResponseModel extends Equatable {
  final int currentPage;
  final int from;
  final int lastPage;
  final int perPage;
  final int to;
  final int total;
  final String firstPageUrl;
  final String lastPageUrl;
  final String nextPageUrl;
  final String prevPageUrl;
  final List<SearchProperty>? data;

  const SearchResponseModel({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.to,
    required this.total,
    required this.data,
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.prevPageUrl,
  });

  SearchResponseModel copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    int? perPage,
    int? to,
    int? total,
    String? firstPageUrl,
    String? lastPageUrl,
    String? nextPageUrl,
    String? prevPageUrl,
    List<SearchProperty>? data,
  }) {
    return SearchResponseModel(
      currentPage: currentPage ?? this.currentPage,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      to: to ?? this.to,
      total: total ?? this.total,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'from': from,
      'last_page': lastPage,
      'per_page': perPage,
      'to': to,
      'total': total,
      'first_page_url': firstPageUrl,
      'last_page_url': lastPageUrl,
      'next_page_url': nextPageUrl,
      'prev_page_url': prevPageUrl,
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchResponseModel.fromMap(Map<String, dynamic> map) {
    return SearchResponseModel(
      currentPage: map['current_page'] != null
          ? int.parse(map['current_page'].toString())
          : 0,
      from: map['from'] != null ? int.parse(map['from'].toString()) : 0,
      lastPage:
          map['last_page'] != null ? int.parse(map['last_page'].toString()) : 0,
      perPage:
          map['per_page'] != null ? int.parse(map['per_page'].toString()) : 0,
      to: map['to'] != null ? int.parse(map['to'].toString()) : 0,
      total: map['total'] != null ? int.parse(map['total'].toString()) : 0,
      data: map['data'] != null
          ? List<SearchProperty>.from(
              (map['data'] as List<dynamic>).map<SearchProperty>(
                (x) => SearchProperty.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      firstPageUrl: map['first_page_url'] ?? '',
      lastPageUrl: map['last_page_url'] ?? '',
      nextPageUrl: map['next_page_url'] ?? '',
      prevPageUrl: map['prev_page_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResponseModel.fromJson(String source) =>
      SearchResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      currentPage,
      from,
      lastPage,
      perPage,
      to,
      total,
      data!,
      firstPageUrl,
      lastPageUrl,
      nextPageUrl,
      prevPageUrl,
    ];
  }
}
