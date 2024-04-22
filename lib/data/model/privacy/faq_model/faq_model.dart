import 'dart:convert';

import 'package:equatable/equatable.dart';

class FaqModel extends Equatable {
  final FaqContentModel? content;
  final List<SingleFaqContent>? faqs;

  const FaqModel({
    required this.content,
    this.faqs,
  });

  FaqModel copyWith({
    FaqContentModel? content,
    List<SingleFaqContent>? faqs,
  }) {
    return FaqModel(
      content: content ?? this.content,
      faqs: faqs ?? this.faqs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content!.toMap(),
      'faqs': faqs!.map((x) => x.toMap()).toList(),
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      content: FaqContentModel.fromMap(map['content']),
      faqs: map['faqs'] != null
          ? List<SingleFaqContent>.from(
              (map['faqs'] as List<dynamic>).map<SingleFaqContent?>(
                (x) => SingleFaqContent.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [content!, faqs!];
}

class FaqContentModel extends Equatable {
  final String shortTitle;
  final String longTitle;
  final String supportImage;
  final String supportTime;
  final String supportTitle;

  const FaqContentModel({
    required this.shortTitle,
    required this.longTitle,
    required this.supportImage,
    required this.supportTime,
    required this.supportTitle,
  });

  FaqContentModel copyWith({
    String? shortTitle,
    String? longTitle,
    String? supportImage,
    String? supportTime,
    String? supportTitle,
  }) {
    return FaqContentModel(
      shortTitle: shortTitle ?? this.shortTitle,
      longTitle: longTitle ?? this.longTitle,
      supportImage: supportImage ?? this.supportImage,
      supportTime: supportTime ?? this.supportTime,
      supportTitle: supportTitle ?? this.supportTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'short_title': shortTitle,
      'long_title': longTitle,
      'support_image': supportImage,
      'support_time': supportTime,
      'support_title': supportTitle,
    };
  }

  factory FaqContentModel.fromMap(Map<String, dynamic> map) {
    return FaqContentModel(
      shortTitle: map['short_title'] ?? '',
      longTitle: map['long_title'] ?? '',
      supportImage: map['support_image'] ?? '',
      supportTime: map['support_time'] ?? '',
      supportTitle: map['support_title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqContentModel.fromJson(String source) =>
      FaqContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      shortTitle,
      longTitle,
      supportImage,
      supportTime,
      supportTitle,
    ];
  }
}

class SingleFaqContent extends Equatable {
  final int id;
  final String question;
  final String answer;
  final int status;
  final String createdAt;
  final String updatedAt;

  const SingleFaqContent({
    required this.id,
    required this.question,
    required this.answer,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  SingleFaqContent copyWith({
    int? id,
    String? question,
    String? answer,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return SingleFaqContent(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'answer': answer,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SingleFaqContent.fromMap(Map<String, dynamic> map) {
    return SingleFaqContent(
      id: map['id'] ?? 0,
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleFaqContent.fromJson(String source) =>
      SingleFaqContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      question,
      answer,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
