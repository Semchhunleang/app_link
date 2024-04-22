import 'dart:convert';

import 'package:equatable/equatable.dart';

class LinkModel extends Equatable {
  final String? url;
  final String? label;
  final bool? active;

  const LinkModel({
    this.url,
    this.label,
    this.active,
  });

  LinkModel copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return LinkModel(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    return LinkModel(
      url: map['agent'] ?? '',
      label: map['label'] ?? '',
      active: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkModel.fromJson(String source) =>
      LinkModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      label,
      active,
    ];
  }
}
