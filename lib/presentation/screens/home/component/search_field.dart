import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/router/route_names.dart';
import '/presentation/widget/custom_test_style.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteNames.searchScreen),
            child: Container(
              height: 50,
              width: 1.sw - 50 - 30 - 24.w -(isIpad ? 10: 0), 
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: borderWithOpacityColor,
                  border: Border.all(color: whiteColor)),
              child: Row(
                children: [
                  CustomImage(
                    path: KImages.searchIcon,
                    color: primaryColor,
                    height: iconSize,
                  ),
                  SizedBox(width: 20),
                  const CustomTextStyle(text: 'Find your house..')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, RouteNames.filterPropertyScreen,
                arguments: ''),
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(radius),
              ),
              child:  CustomImage(
                path: KImages.filterIcon,
                color: whiteColor,
                height: iconSize,
                // height: 1.sw > dWidthSize ? 12.sp : 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Flexible buildFlexible() {
  //   return Flexible(
  //     child: TextFormField(
  //       onTap: () => print('hhhhh'),
  //       enabled: false,
  //       decoration: const InputDecoration(
  //           prefixIcon: SizedBox(
  //             height: 55.0,
  //             width: 40.0,
  //             child: Center(
  //               child: CustomImage(
  //                 path: KImages.searchIcon,
  //                 color: primaryColor,
  //               ),
  //             ),
  //           ),
  //           hintText: 'Find your house..'),
  //     ),
  //   );
  // }
}
