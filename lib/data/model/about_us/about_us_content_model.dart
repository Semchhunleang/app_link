import 'dart:convert';
import 'package:equatable/equatable.dart';

class AboutUsContentModel extends Equatable {
  final String experienceText1;
  final String experienceText2;
  final String backgroundImage;
  final String authorImage;
  final String authorName;
  final String authorDesignation;
  final String shortTitle;
  final String longTitle;
  final String description1;
  final String description2;
  final AboutUsItems? items1;
  final AboutUsItems? items2;

  const AboutUsContentModel({
    required this.experienceText1,
    required this.experienceText2,
    required this.backgroundImage,
    required this.authorImage,
    required this.authorName,
    required this.authorDesignation,
    required this.shortTitle,
    required this.longTitle,
    required this.description1,
    required this.description2,
    this.items1,
    this.items2,
  });

  AboutUsContentModel copyWith({
    String? experienceText1,
    String? experienceText2,
    String? backgroundImage,
    String? authorImage,
    String? authorName,
    String? authorDesignation,
    String? shortTitle,
    String? longTitle,
    String? description1,
    String? description2,
    AboutUsItems? items1,
    AboutUsItems? items2,
  }) {
    return AboutUsContentModel(
      experienceText1: experienceText1 ?? this.experienceText1,
      experienceText2: experienceText2 ?? this.experienceText2,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      authorImage: authorImage ?? this.authorImage,
      authorName: authorName ?? this.authorName,
      authorDesignation: authorDesignation ?? this.authorDesignation,
      shortTitle: shortTitle ?? this.shortTitle,
      longTitle: longTitle ?? this.longTitle,
      description1: description1 ?? this.description1,
      description2: description2 ?? this.description2,
      items1: items1 ?? this.items1,
      items2: items2 ?? this.items2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'experience_text_1': experienceText1,
      'experience_text_2': experienceText2,
      'background_image': backgroundImage,
      'author_image': authorImage,
      'author_name': authorName,
      'author_designation': authorDesignation,
      'short_title': shortTitle,
      'long_title': longTitle,
      'description_1': description1,
      'description_2': description2,
      'items1': items1!.toMap(),
      'items2': items2!.toMap(),
    };
  }

  factory AboutUsContentModel.fromMap(Map<String, dynamic> map) {
    return AboutUsContentModel(
      experienceText1: map['experience_text_1'] ?? '',
      experienceText2: map['experience_text_2'] ?? '',
      backgroundImage: map['background_image'] ?? '',
      authorImage: map['author_image'] ?? '',
      authorName: map['author_name'] ?? '',
      authorDesignation: map['author_designation'] ?? '',
      shortTitle: map['short_title'] ?? '',
      longTitle: map['long_title'] ?? '',
      description1: map['description_1'] ?? '',
      description2: map['description_2'] ?? '',
      items1: map['items1'] != null
          ? AboutUsItems.fromMap(map['items1'] as Map<String, dynamic>)
          : null,
      items2: map['items2'] != null
          ? AboutUsItems.fromMap(map['items2'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutUsContentModel.fromJson(String source) =>
      AboutUsContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      experienceText1,
      experienceText2,
      backgroundImage,
      authorImage,
      authorName,
      authorDesignation,
      shortTitle,
      longTitle,
      description1,
      description2,
      items1!,
      items2!,
    ];
  }
}

class AboutUsItems extends Equatable {
  final String icon;
  final String title;
  final String title2;
  final String description;

  const AboutUsItems({
    required this.icon,
    required this.title,
    required this.title2,
    required this.description,
  });

  AboutUsItems copyWith({
    String? icon,
    String? title,
    String? title2,
    String? description,
  }) {
    return AboutUsItems(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      title2: title2 ?? this.title2,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'title': title,
      'title2': title2,
      'description': description,
    };
  }

  factory AboutUsItems.fromMap(Map<String, dynamic> map) {
    return AboutUsItems(
      icon: map['icon'] ?? '',
      title: map['title'] ?? '',
      title2: map['title2'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutUsItems.fromJson(String source) =>
      AboutUsItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [icon, title, title2, description];
}
