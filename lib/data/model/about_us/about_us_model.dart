import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../contact_us/contact_us_model.dart';
import '../home/counter_model.dart';
import '../product/property_type_model.dart';
import 'about_us_content_model.dart';

class AboutUsModel extends Equatable {
  final SeoSettingModel? seoSetting;
  final AboutUsContentModel? aboutUs;
  final CounterModel? counter;
  final List<PropertyTypeModel>? category;

  const AboutUsModel({
    required this.seoSetting,
    required this.aboutUs,
    required this.counter,
    required this.category,
  });

  AboutUsModel copyWith({
    SeoSettingModel? seoSetting,
    AboutUsContentModel? aboutUs,
    CounterModel? counter,
    List<PropertyTypeModel>? category,
  }) {
    return AboutUsModel(
      seoSetting: seoSetting ?? this.seoSetting,
      aboutUs: aboutUs ?? this.aboutUs,
      counter: counter ?? this.counter,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seo_setting': seoSetting?.toMap(),
      'about_us': aboutUs?.toMap(),
      'counter': counter?.toMap(),
      'category': category!.map((x) => x.toMap()).toList(),
    };
  }

  factory AboutUsModel.fromMap(Map<String, dynamic> map) {
    return AboutUsModel(
      seoSetting: map['seo_setting'] != null
          ? SeoSettingModel.fromMap(map['seo_setting'] as Map<String, dynamic>)
          : null,
      aboutUs: map['about_us'] != null
          ? AboutUsContentModel.fromMap(map['about_us'] as Map<String, dynamic>)
          : null,
      counter: map['counter'] != null
          ? CounterModel.fromMap(map['counter'] as Map<String, dynamic>)
          : null,
      category: map['category']['property_types'] != null
          ? List<PropertyTypeModel>.from(
              (map['category']['property_types'] as List<dynamic>)
                  .map<PropertyTypeModel?>(
                (x) => PropertyTypeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutUsModel.fromJson(String source) =>
      AboutUsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [seoSetting!, aboutUs!, counter!, category!];
}
