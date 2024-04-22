import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/data/model/create_property/edit_info/existing_slider.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';

import '../../../../data/model/create_property/property_images_dto.dart';
import '../../../../logic/bloc/create_property/bloc/property_create_bloc.dart';
import '../../../../logic/cubit/create_property/cubit/update_cubit.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/error_text.dart';
import '../../../widget/form_header_title.dart';
import '../../profile/component/person_single_property.dart';

class PropertyImageSection extends StatefulWidget {
  const PropertyImageSection({super.key});

  @override
  State<PropertyImageSection> createState() => _PropertyImageSectionState();
}

class _PropertyImageSectionState extends State<PropertyImageSection> {
  List<ExistingSlider> multipleSliderImages = <ExistingSlider>[];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        final imageItem = state.propertyImageDto.thumbnailImage;
        //print("image======== 1: ${state.propertyImageDto.thumbnailImage}");
        // print(imageItem);

        final updateCubit = context.read<UpdateCubit>();

        // String thumbImage = state.propertyImageDto.thumbnailImage;
        String thumbImage =
            imageItem.isEmpty ? KImages.placeholderImage : imageItem;

        multipleSliderImages = state.propertyImageDto.sliderImages;
        bool isFile = imageItem.isNotEmpty
            ? imageItem.contains('https://')
                ? false
                : true
            : false;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          child: Column(
            children: [
              const FormHeaderTitle(title: "Property Image"),
              Padding(
                padding: EdgeInsets.all(7.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextStyle(text: "Thumbnail Image"),
                    Utils.verticalSpace(8),
                    BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 170.h,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF5F4FF),
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                    width: 0.2,
                                    color: grayColor,
                                  )),
                              child: Stack(
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CustomImage(
                                        path: thumbImage,
                                        height: imageItem.isEmpty ? 60.h : 170.h,
                                        width: double.infinity,
                                        fit: imageItem.isEmpty
                                            ? BoxFit.contain
                                            : BoxFit.cover,
                                        isFile: isFile,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final imageSourcePath = await Utils.pickSingleImage();
                                        thumbImage = imageSourcePath!;
                                        bloc.add(
                                          PropertyPropertyImageEvent(
                                            propertyImage: PropertyImageDto(
                                              thumbnailImage: thumbImage,
                                              sliderImages:
                                                  multipleSliderImages,
                                            ),
                                          ),
                                        );
                                        setState(() {});
                                      },
                                      child: const EditBtn()
                                    )
                                  ),
                                ],
                              ),
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.thumbnailImage.isNotEmpty)
                                ErrorText(
                                  text:stateStatus.errors.thumbnailImage.first)
                            ]
                          ],
                        );
                      },
                    ),
                    Utils.verticalSpace(15.h),
                    if (multipleSliderImages.isNotEmpty) ...[
                      const CustomTextStyle(text: "Slider Images"),
                      Utils.verticalSpace(10.h),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Wrap(
                          runSpacing: 10.h,
                          spacing: 10.w,
                          children: [
                            ...List.generate(multipleSliderImages.length,
                                (index) {
                              final item = multipleSliderImages[index];
                              String sliderImage = item.image.isEmpty
                                  ? KImages.placeholderImage
                                  : item.image;
                              bool isSliderFile = item.image.isNotEmpty
                                  ? item.image.contains('https://') ? false: true: false;
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  SizedBox(
                                    width: 120.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: CustomImage(
                                        path: sliderImage,
                                        height: 120.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        isFile: isSliderFile,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -5,
                                    right: -5,
                                    child: CircleAvatar(
                                      radius: 15.h,
                                      backgroundColor: whiteColor,
                                      child: IconButton(
                                        onPressed: () async {
                                          if (item.id != 0) {
                                            final result = await updateCubit
                                                .deleteSliderImage(item.id.toString());

                                            result.fold(
                                              (failure) {
                                                Utils.errorSnackBar(context,
                                                    failure.errorMessage);
                                              },
                                              (data) {
                                                Utils.showSnackBar(
                                                    context, "$data");
                                                multipleSliderImages
                                                    .removeAt(index);
                                                bloc.add(
                                                    PropertyPropertyImageEvent(
                                                        propertyImage:
                                                            PropertyImageDto(
                                                  thumbnailImage: imageItem,
                                                  sliderImages:
                                                      multipleSliderImages,
                                                )));
                                              },
                                            );
                                          } else {
                                            multipleSliderImages
                                                .removeAt(index);
                                            bloc.add(PropertyPropertyImageEvent(
                                                propertyImage: PropertyImageDto(
                                              thumbnailImage: imageItem,
                                              sliderImages: multipleSliderImages,
                                            )));
                                          }

                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: redColor,
                                          size: iconSize,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                      Utils.verticalSpace(16),
                    ],
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      // alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () async {
                          final tempImages = await Utils.pickMultipleImage();
                          print("TempImages: $tempImages");
                          final temp = <ExistingSlider>[];
                          for (var item in tempImages) {
                            temp.add(ExistingSlider(image: item));
                          }
                          multipleSliderImages = temp;

                          bloc.add(
                            PropertyPropertyImageEvent(
                              propertyImage: PropertyImageDto(
                                thumbnailImage: thumbImage,
                                sliderImages: multipleSliderImages,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.upload,
                              size: iconSize,
                              color: blackColor,
                            ),
                            Utils.horizontalSpace(4.w),
                            const Text(
                              "Upload Slider Images",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: detailFontSize,
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
