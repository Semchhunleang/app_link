// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/create_property/edit_info/existing_slider.dart';

class PropertyImageDto extends Equatable {
  final String thumbnailImage;
  final bool isExistingThumb;
  final List<ExistingSlider> sliderImages;

  const PropertyImageDto({
    required this.thumbnailImage,
    this.isExistingThumb = false,
     this.sliderImages = const [],
  });

  PropertyImageDto copyWith({
    String? thumbnailImage,
    bool? isExistingThumb,
    List<ExistingSlider>? sliderImages,
  }) {
    return PropertyImageDto(
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      isExistingThumb: isExistingThumb ?? this.isExistingThumb,
      sliderImages: sliderImages ?? this.sliderImages,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, String>{};
    result.addAll({'thumbnail_image': thumbnailImage});
    if (sliderImages.isNotEmpty) {
      for (var i = 0; i < sliderImages.length; i++) {
        result.addAll({'slider_images[$i]': sliderImages[i].image});
      }
    }
    return result;
  }

  factory PropertyImageDto.fromMap(Map<String, dynamic> map) {
    return PropertyImageDto(
        thumbnailImage: map['thumbnail_image'] ?? "",
        sliderImages: List<ExistingSlider>.from(
          (map['slider_images'] as List<ExistingSlider>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory PropertyImageDto.fromJson(String source) =>
      PropertyImageDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [thumbnailImage, sliderImages];
}
