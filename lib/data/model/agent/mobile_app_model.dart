// import 'dart:convert';
//
// import 'package:equatable/equatable.dart';
//
// class MobileAppModel extends Equatable {
//   final bool visibility;
//   final String appBg;
//   final String fullTitle;
//   final String description;
//   final String playStore;
//   final String appStore;
//   final String image;
//   final String appleBtnText1;
//   final String appleBtnText2;
//   final String googleBtnText1;
//   final String googleBtnText2;
//
//   const MobileAppModel({
//     required this.visibility,
//     required this.appBg,
//     required this.fullTitle,
//     required this.description,
//     required this.playStore,
//     required this.appStore,
//     required this.image,
//     required this.appleBtnText1,
//     required this.appleBtnText2,
//     required this.googleBtnText1,
//     required this.googleBtnText2,
//   });
//
//   MobileAppModel copyWith({
//     bool? visibility,
//     String? appBg,
//     String? fullTitle,
//     String? description,
//     String? playStore,
//     String? appStore,
//     String? image,
//     String? appleBtnText1,
//     String? appleBtnText2,
//     String? googleBtnText1,
//     String? googleBtnText2,
//   }) {
//     return MobileAppModel(
//       visibility: visibility ?? this.visibility,
//       appBg: appBg ?? this.appBg,
//       fullTitle: fullTitle ?? this.fullTitle,
//       description: description ?? this.description,
//       playStore: playStore ?? this.playStore,
//       appStore: appStore ?? this.appStore,
//       image: image ?? this.image,
//       appleBtnText1: appleBtnText1 ?? this.appleBtnText1,
//       appleBtnText2: appleBtnText2 ?? this.appleBtnText2,
//       googleBtnText1: googleBtnText1 ?? this.googleBtnText1,
//       googleBtnText2: googleBtnText2 ?? this.googleBtnText2,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'visibility': visibility,
//       'app_bg': appBg,
//       'full_title': fullTitle,
//       'description': description,
//       'play_store': playStore,
//       'app_store': appStore,
//       'image': image,
//       'apple_btn_text1': appleBtnText1,
//       'apple_btn_text2': appleBtnText2,
//       'google_btn_text1': googleBtnText1,
//       'google_btn_text2': googleBtnText2,
//     };
//   }
//
//   factory MobileAppModel.fromMap(Map<String, dynamic> map) {
//     return MobileAppModel(
//       visibility: map['visibility'] ?? false,
//       appBg: map['app_bg'] ?? '',
//       fullTitle: map['full_title'] ?? '',
//       description: map['description'] ?? '',
//       playStore: map['play_store'] ?? '',
//       appStore: map['app_store'] ?? '',
//       image: map['image'] ?? '',
//       appleBtnText1: map['apple_btn_text1'] ?? '',
//       appleBtnText2: map['apple_btn_text2'] ?? '',
//       googleBtnText1: map['google_btn_text1'] ?? '',
//       googleBtnText2: map['google_btn_text2'] ?? '',
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory MobileAppModel.fromJson(String source) =>
//       MobileAppModel.fromMap(json.decode(source));
//
//   @override
//   String toString() {
//     return 'MobileAppModel(visibility: $visibility, appBg: $appBg, fullTitle: $fullTitle, description: $description, playStore: $playStore, appStore: $appStore, image: $image, appleBtnText1: $appleBtnText1, appleBtnText2: $appleBtnText2, googleBtnText1: $googleBtnText1, googleBtnText2: $googleBtnText2)';
//   }
//
//   @override
//   List<Object> get props {
//     return [
//       visibility,
//       appBg,
//       fullTitle,
//       description,
//       playStore,
//       appStore,
//       image,
//       appleBtnText1,
//       appleBtnText2,
//       googleBtnText1,
//       googleBtnText2,
//     ];
//   }
// }
