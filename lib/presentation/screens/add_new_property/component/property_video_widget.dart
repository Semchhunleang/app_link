// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:real_estate/presentation/widget/custom_textfield.dart';
// import '../../../../data/model/create_property/property_video_dto.dart';
// import '../../../../logic/bloc/create_property/bloc/property_create_bloc.dart';
// import '../../../utils/k_images.dart';
// import '../../../utils/utils.dart';
// import '../../../widget/custom_images.dart';
// import '../../../widget/custom_test_style.dart';
// import '../../../widget/form_header_title.dart';
// import '../../profile/component/person_single_property.dart';

// class PropertyVideoWidget extends StatefulWidget {
//   const PropertyVideoWidget({super.key});

//   @override
//   State<PropertyVideoWidget> createState() => _PropertyVideoWidgetState();
// }

// class _PropertyVideoWidgetState extends State<PropertyVideoWidget> {
//   String thumbImage = KImages.placeholderImage;
//   String videoId = '';
//   String description = '';

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<PropertyCreateBloc>();
//     return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//       builder: (context, state) {
//         final imageItem = state.propertyVideoDto.videoThumbnail;
//         videoId = state.propertyVideoDto.videoId;
//         description = state.propertyVideoDto.videoDescription;
//         thumbImage = imageItem.isEmpty ? KImages.placeholderImage : imageItem;

//         bool isFile = imageItem.isNotEmpty
//             ? imageItem.contains('https://')
//                 ? false
//                 : true
//             : false;

//         return Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.r),
//               border: Border.all(
//                 width: 0.5,
//                 color: Colors.black,
//               )),
//           child: Column(
//             children: [
//               const FormHeaderTitle(title: "Property Video"),
//               Padding(
//                 padding: EdgeInsets.all(8.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const CustomTextStyle(text: "Video Thumbnail Image"),
//                     Utils.verticalSpace(12.h),
//                     Container(
//                       height: 170.h,
//                       decoration: BoxDecoration(
//                           color: const Color(0xffF5F4FF),
//                           borderRadius: BorderRadius.circular(4.r),
//                           border: Border.all(
//                             width: 0.2,
//                             color: Colors.grey,
//                           )),
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(4.r),
//                               child: CustomImage(
//                                 path: thumbImage,
//                                 height: imageItem.isEmpty ? 60.h : 170.h,
//                                 width: double.infinity,
//                                 fit: imageItem.isEmpty ? BoxFit.contain: BoxFit.cover,
//                                 isFile: isFile,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: GestureDetector(
//                               onTap: () async {
//                                 final imageSourcePath =
//                                     await Utils.pickSingleImage();
//                                 thumbImage = imageSourcePath!;
//                                 bloc.add(PropertyPropertyVideoEvent(
//                                     propertyVideo: PropertyVideoDto(
//                                   videoThumbnail: thumbImage,
//                                   videoId: videoId,
//                                   videoDescription: description,
//                                 )));
//                               },
//                               child: const EditBtn())),
//                         ],
//                       ),
//                     ),

//                     Utils.verticalSpace(15.h),
//                     CustomTextField(
//                       onChanged: (value) {
//                         videoId = value;
//                         bloc.add(PropertyPropertyVideoEvent(
//                             propertyVideo: PropertyVideoDto(
//                           videoThumbnail: thumbImage,
//                           videoId: videoId,
//                           videoDescription: description,
//                         ))
//                         );
//                       },
//                       hintText: 'Video Id *',
//                       labelText: 'Video Id *',
//                       initialValue: state.propertyVideoDto.videoId,
//                       keyboardType: TextInputType.text,
//                     ),
//                     Utils.verticalSpace(10.h),
//                     CustomTextField(
//                       onChanged: (value) {
//                         description = value;
//                           bloc.add(PropertyPropertyVideoEvent(
//                               propertyVideo: PropertyVideoDto(
//                             videoThumbnail: thumbImage,
//                             videoId: videoId,
//                             videoDescription: description,
//                           ))
//                         );
//                       },
//                       hintText: 'Video Description *',
//                       labelText: 'Video Description *',
//                       initialValue: state.propertyVideoDto.videoDescription,
//                       keyboardType: TextInputType.text,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
