// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'package:equatable/equatable.dart';

// class PropertyVideoDto extends Equatable {
//   final String videoThumbnail;
//   final String videoId;
//   final String videoDescription;

//   const PropertyVideoDto({
//     required this.videoThumbnail,
//     required this.videoId,
//     required this.videoDescription,
//   });

//   PropertyVideoDto copyWith({
//     String? videoThumbnail,
//     String? videoId,
//     String? videoDescription,
//   }) {
//     return PropertyVideoDto(
//       videoThumbnail: videoThumbnail ?? this.videoThumbnail,
//       videoId: videoId ?? this.videoId,
//       videoDescription: videoDescription ?? this.videoDescription,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'video_thumbnail': videoThumbnail,
//       'video_id': videoId,
//       'video_description': videoDescription,
//     };
//   }

//   factory PropertyVideoDto.fromMap(Map<String, dynamic> map) {
//     return PropertyVideoDto(
//       videoThumbnail: map['video_thumbnail'] ?? "",
//       videoId: map['video_id'] as String,
//       videoDescription: map['video_description'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory PropertyVideoDto.fromJson(String source) =>
//       PropertyVideoDto.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool get stringify => true;

//   @override
//   List<Object> get props => [videoThumbnail, videoId, videoDescription];
// }
