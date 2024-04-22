import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, required this.logo, required this.image})
      : super(key: key);

  final String logo;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 75.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImage(
            path: logo,
            height: 47,
            width: 47,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () =>
                    // Navigator.pushNamed(
                    //     context, RouteNames.subscriptionProductScreen,
                    //     arguments: 0
                    Navigator.pushNamed(
                        context, RouteNames.choosePropertyOptionScreen),
                child: Container(
                  height: 50,
                  width: 100,
                  margin: EdgeInsets.only(right: 14.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: whiteColor, width: 2.0),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: CustomTextStyle(
                        text: 'Create',
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () => Navigator.pushNamed(
              //       context, RouteNames.premiumMembershipScreen),
              //   child: Container(
              //     height: 50.0,
              //     width: 100.0,
              //     margin: const EdgeInsets.only(right: 14.0),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15.0),
              //       border: Border.all(color: whiteColor, width: 2.0),
              //     ),
              //     child: DecoratedBox(
              //       decoration: BoxDecoration(
              //           color: yellowColor,
              //           borderRadius: BorderRadius.circular(15.0)),
              //       child: const Align(
              //         alignment: Alignment.center,
              //         child: CustomTextStyle(
              //           text: 'Create',
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.profileScreen),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: whiteColor, width: 2.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CustomImage(
                      path: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
