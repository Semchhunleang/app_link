import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/presentation/utils/k_images.dart';
import 'package:real_estate/presentation/utils/utils.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '/data/data_provider/remote_url.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../router/route_names.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

int _index = 0;
PageController controller = PageController();
late WebViewController controllerGlobal;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final onBoardingList = context.read<AppSettingCubit>().onBoarding;
    //print(size.height);
    return WillPopScope(
      onWillPop: () => exitApp(context),
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: 25, vertical: size.height * 0.05)
                  .copyWith(bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20)),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFECEAFF)),
                      elevation: MaterialStateProperty.all(0.0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                      ),
                    ),
                    onPressed: () {
                      context.read<AppSettingCubit>().cachOnBoarding();
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.loginScreen, (route) => false);
                    },
                    // onPressed: () => controller.jumpToPage(onBoardingList.length - 1),
                    child: const CustomTextStyle(
                      text: 'Skip',
                      color: Color(0xFF3A3F67),
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1.sh * 0.65,
              width: 1.sw,
              margin: EdgeInsets.only(bottom: 1.sh* 0.04),
              // color: Colors.red,
              child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    _index = index;
                    print(_index.toString());
                  });
                },
                controller: controller,
                physics: const BouncingScrollPhysics(),
                children: onBoardingList
                    .map(
                      (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImage(
                            path: RemoteUrls.imageUrl(e.image),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextStyle(
                            text: e.title,
                            fontWeight: FontWeight.w700,
                            fontSize: titleFontSize,
                            color: blackColor,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                            child: Text(
                              e.description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w400,
                                fontSize: subtitleFontSize,
                                height: 1.8,
                                color: const Color(0xFF7E8BA0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            // if (_index == onBoardingList.length - 1) ...[
            //   locationEnable(size)
            // ] else ...[
            //   nextButton(size),
            // ],
            nextButton(size),
            //locationEnable(size),
          ],
        ),
      ),
    );
  }

  Widget nextButton(Size size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 1.sw * 0.3,
          height: 3.0,
          margin: EdgeInsets.only(bottom: size.height * 0.03),
          decoration: BoxDecoration(
              color: borderWithOpacityColor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Row(
            children: List.generate(
                context.read<AppSettingCubit>().onBoarding.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: size.width * 0.1,
                height: 3.0,
                decoration: BoxDecoration(
                  color: _index == index ? blackColor : transparent,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              );
            }),
          ),
        ),
        GestureDetector(
          onTap: () {
            final list = context.read<AppSettingCubit>().onBoarding.length - 1;
            if (_index == list) {
              context.read<AppSettingCubit>().cachOnBoarding();
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginScreen, (route) => false);
              //print('last index');
            } else {
              controller.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInOut);
            }
            //print(_index);
          },
          child: Container(
            width: size.width * 0.5,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                .copyWith(bottom: 0.0),
            height: size.height * 0.06,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CustomTextStyle(
                    text: 'Next',
                    fontWeight: FontWeight.w500,
                    fontSize: titleFontSize,
                    color: whiteColor,
                  ),
                ),
                //const SizedBox(width: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: size.width * 0.12,
                    height: size.height * 0.04,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.22),
                      borderRadius: borderRadius,
                    ),
                    child: const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: whiteColor,
                      size: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget locationEnable(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.2, vertical: size.height * 0.02),
      child: Column(
        children: [
          PrimaryButton(
            text: 'Allow Location',
            onPressed: () {
              context.read<AppSettingCubit>().cachOnBoarding();
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginScreen, (route) => false);
            },
            fontSize: titleFontSize,
            borderRadiusSize: radius,
            textColor: whiteColor,
          ),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.loginScreen, (route) => false),
            child: const CustomTextStyle(
              text: 'Skip for Now',
              fontWeight: FontWeight.w500,
              color: grayColor,
              fontSize: subtitleFontSize,
            ),
          )
        ],
      ),
    );
  }

  exitApp(BuildContext context) async {
    Utils.showCustomDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: KImages.logoutIcon),
            const SizedBox(height: 10.0),
            const CustomTextStyle(
              textAlign: TextAlign.center,
              text: 'Are you sure\nYou want to Exit?',
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoutButton(
                    'No', () => Navigator.of(context).pop(), blackColor),
                const SizedBox(width: 14.0),
                logoutButton('Exit', () => SystemNavigator.pop(), primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton(String text, VoidCallback onPressed, Color bgColor) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100.0, 40.0)),
          backgroundColor: MaterialStateProperty.all(bgColor),
          elevation: MaterialStateProperty.all(0.0),
          shadowColor: MaterialStateProperty.all(transparent),
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadius))),
      child: CustomTextStyle(
        text: text,
        fontWeight: FontWeight.w500,
        fontSize: titleFontSize,
        color: whiteColor,
      ),
    );
  }
}
