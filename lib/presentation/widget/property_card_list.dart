import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/utils/k_images.dart';
import 'package:real_estate/presentation/utils/utils.dart';
import 'package:real_estate/presentation/widget/custom_images.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/presentation/widget/favorite_button.dart';
import 'package:real_estate/state_inject_package_names.dart';

class PropertyCardList extends StatelessWidget {
  final dynamic property;
  const PropertyCardList({super.key, required this.property,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: const EdgeInsets.all(propertyCardListPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: propertyCardListPadding),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                children: [
                  CustomImage(
                    path: property.thumbnailImage,
                    height: double.infinity,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: FavoriteButton(id: property.id.toString()),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextStyle(
                      text: Utils.formatPrice(
                          context, property.price.toStringAsFixed(2)),
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: titleFontSize,
                    ),
                    CustomTextStyle(
                      text: property.rentPeriod.isNotEmpty
                          ? '/${property.rentPeriod}'
                          : property.rentPeriod,
                      color: grayColor,
                      fontWeight: FontWeight.w400,
                      fontSize: detailFontSize,
                    ),
                  ],
                ),
                CustomTextStyle(
                  text: property.title,
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: titleFontSize,
                  maxLine: 2,
                  height: 1.3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImage(path: KImages.locationIcon, height: propertyCardIconSize),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CustomTextStyle(
                        text: property.address,
                        color: grayColor,
                        fontWeight: FontWeight.w400,
                        fontSize: detailFontSize,
                        maxLine: 2,
                        height: 1.3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}