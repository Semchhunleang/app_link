import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_estate/presentation/utils/utils.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../../data/model/product/single_property_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class PropertyImagesSlider extends StatefulWidget {
  final SinglePropertyModel property;
  const PropertyImagesSlider({Key? key, required this.property})
      : super(key: key);

  @override
  State<PropertyImagesSlider> createState() => _PropertyImagesSliderState();
}

class _PropertyImagesSliderState extends State<PropertyImagesSlider> {
  final int initialPage = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.property.sliders;
    final item = widget.property.propertyItemModel;

    return SizedBox(
      height: 1.sh * 0.4,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const ClipRRect(
            child: CustomImage(
              path: KImages.profileBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: 1.0.sw * 0.03,
            child: Row(
              children: [
                const BtnCycleBack(isBackGroundWhite: true,),
                SizedBox(width: 8.w),
                const CustomTextStyle(
                  text: 'Property Details',
                  fontWeight: FontWeight.w500,
                  fontSize: titleFontSize,
                  color: whiteColor,
                )
              ],
            ),
          ),
          Positioned(
            top: 55,
            left: 0.0,
            right: 0.0,
            child: CarouselSlider(
              items: images!
                  .map((e) => CustomImage(path: e.image, fit: BoxFit.cover, width: 1.sw,))
                  .toList(),
              options: CarouselOptions(
                height: (1.sh * 0.4) -55,
                viewportFraction: 1,
                initialPage: initialPage,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Positioned(
            right: 1.sw * 0.1,
            top: 1.sh * 0.1,
            child: Row(
              children: List.generate(
                images.length,
                (index) {
                  final isActive = _currentIndex == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: isActive ? 13.0 : 12.0,
                    width: isActive ? 13.0 : 12.0,
                    margin: EdgeInsets.only(right: 5.5.w),
                    decoration: BoxDecoration(
                      color: isActive ? primaryColor : transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? transparent : blackColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: -(1.sh * 0.02),
            right: 1.sw * 0.1,
            child: Container(
              padding: EdgeInsets.all(propertyCardPadding),
              // height: item!.rentPeriod.isNotEmpty ? 80.0 : 60.0,
              
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: borderRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextStyle(
                    text: Utils.formatPrice(context, item!.price),
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                  ),
                  item.rentPeriod.isNotEmpty
                    ? CustomTextStyle(
                        text: '/${item.rentPeriod}',
                        fontSize: detailFontSize,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      )
                    : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }
}

final List<String> images = [
  KImages.detailsImage,
  KImages.detailsImage,
  KImages.detailsImage,
  KImages.detailsImage,
];
