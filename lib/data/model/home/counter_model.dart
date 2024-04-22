import 'dart:convert';

import 'package:equatable/equatable.dart';

class CounterModel extends Equatable {
  final bool visibility;
  final CounterContent content;
  final List<CounterItems> items;

  const CounterModel({
    required this.visibility,
    required this.content,
    required this.items,
  });

  CounterModel copyWith({
    bool? visibility,
    CounterContent? content,
    List<CounterItems>? items,
  }) {
    return CounterModel(
      visibility: visibility ?? this.visibility,
      content: content ?? this.content,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'visibility': visibility,
      'content': content.toMap(),
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CounterModel.fromMap(Map<String, dynamic> map) {
    return CounterModel(
      visibility: map['visibility'] as bool,
      content: CounterContent.fromMap(map['content'] as Map<String, dynamic>),
      items: List<CounterItems>.from(
        (map['items'] as List<dynamic>).map<CounterItems>(
          (x) => CounterItems.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterModel.fromJson(String source) =>
      CounterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [visibility, content, items];
}

class CounterItems extends Equatable {
  final int id;
  final String title;
  final String icon;
  final int number;

  const CounterItems({
    required this.id,
    required this.title,
    required this.icon,
    required this.number,
  });

  CounterItems copyWith({
    int? id,
    String? title,
    String? icon,
    int? number,
  }) {
    return CounterItems(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'icon': icon,
      'number': number,
    };
  }

  factory CounterItems.fromMap(Map<String, dynamic> map) {
    return CounterItems(
      id: map['id'] as int,
      title: map['title'] ?? "",
      icon: map['icon'] ?? "",
      number: map['number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterItems.fromJson(String source) =>
      CounterItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, icon, number];
}

class CounterContent extends Equatable {
  final String title;
  final String description;
  final String bgImage;
  final String list1;
  final String list2;
  final String list3;

  const CounterContent({
    required this.title,
    required this.description,
    required this.bgImage,
    required this.list1,
    required this.list2,
    required this.list3,
  });

  CounterContent copyWith({
    String? title,
    String? description,
    String? bgImage,
    String? list1,
    String? list2,
    String? list3,
  }) {
    return CounterContent(
      title: title ?? this.title,
      description: description ?? this.description,
      bgImage: bgImage ?? this.bgImage,
      list1: list1 ?? this.list1,
      list2: list2 ?? this.list2,
      list3: list3 ?? this.list3,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'bg_image': bgImage,
      'list_1': list1,
      'list_2': list2,
      'list_3': list3,
    };
  }

  factory CounterContent.fromMap(Map<String, dynamic> map) {
    return CounterContent(
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      bgImage: map['bg_image'] ?? "",
      list1: map['list_1'] ?? "",
      list2: map['list_2'] ?? "",
      list3: map['list_3'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterContent.fromJson(String source) =>
      CounterContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      title,
      description,
      bgImage,
      list1,
      list2,
      list3,
    ];
  }
}
