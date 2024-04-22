import 'package:real_estate/presentation/widget/property_card_list.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/search_response_model/search_property_model.dart';
// import '../../../utils/constraints.dart';
// import '../../../utils/k_images.dart';
// import '../../../utils/utils.dart';
// import '../../../widget/custom_images.dart';
// import '../../../widget/custom_test_style.dart';
// import '../../../widget/favorite_button.dart';

class SingleFilterProperties extends StatelessWidget {
  const SingleFilterProperties({Key? key, required this.property})
      : super(key: key);
  final SearchProperty property;
 
  @override
  Widget build(BuildContext context) {
    return PropertyCardList(property: property);
    // Container(
    //   height: 140.0.h,
    //   margin: EdgeInsets.symmetric(vertical: 8.h),
    //   decoration: BoxDecoration(
    //     color: whiteColor,
    //     borderRadius: BorderRadius.circular(radius),
    //   ),
    //   child: Row(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.all(10.h).copyWith(right: 12.w),
    //         child: ClipRRect(
    //           borderRadius: borderRadius,
    //           child: Stack(
    //             children: [
    //               CustomImage(
    //                 path: property.thumbnailImage,
    //                 height: double.infinity,
    //                 width: 130.w,
    //                 fit: BoxFit.cover,
    //               ),
    //               Positioned(
    //                 top: 8.0,
    //                 left: 8.0,
    //                 child: FavoriteButton(id: property.id.toString()),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               CustomTextStyle(
    //                 text: Utils.formatPrice(
    //                     context, property.price.toStringAsFixed(2)),
    //                 color: primaryColor,
    //                 fontWeight: FontWeight.w700,
    //                 fontSize: 16.0,
    //               ),
    //               CustomTextStyle(
    //                 text: property.rentPeriod.isNotEmpty
    //                     ? '/${property.rentPeriod}'
    //                     : property.rentPeriod,
    //                 color: grayColor,
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 15.0,
    //               ),
    //             ],
    //           ),
    //           ConstrainedBox(
    //             constraints: BoxConstraints(maxHeight: 45.h, maxWidth: 170.w),
    //             child: CustomTextStyle(
    //               text: property.title,
    //               color: blackColor,
    //               fontWeight: FontWeight.w600,
    //               fontSize: 16.0,
    //               maxLine: 2,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //           SizedBox(height: 4.h),
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: EdgeInsets.only(top: 5.h),
    //                 child: CustomImage(path: KImages.locationIcon ,height: 12.h,)),
    //               SizedBox(width: 6.h),
    //               ConstrainedBox(
    //                 constraints: BoxConstraints(maxHeight: 45.h, maxWidth: 165.w),
    //                 child: CustomTextStyle(
    //                   text: property.address,
    //                   color: grayColor,
    //                   fontWeight: FontWeight.w400,
    //                   fontSize: 15.0,
    //                   maxLine: 2,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
