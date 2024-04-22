import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/utils/k_images.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../router/route_names.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/primary_button.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              KImages.success,
              // KImages.wrong,
              width: 70.0,
              height: 70.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const CustomTextStyle(
              // text: "Fail Payment",
              text: "Success Payment",
              fontWeight: FontWeight.w600,
              fontSize: profileNameFontSize,
            ),
            const SizedBox(
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: PrimaryButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.homeScreen);
                },
                text: "Back Home",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
