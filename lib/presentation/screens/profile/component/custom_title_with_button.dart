import 'package:flutter/material.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class CustomTitleWithButton extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  const CustomTitleWithButton({super.key, this.title = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextStyle(
              text: title != "" ? title : "title",
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
              color: blackColor),
        ),
        Expanded(
          child: IconButton(
            onPressed: onTap ?? () {},
            icon: const CustomImage(
              path: KImages.settingIcon03,
              color: primaryColor,
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
      ],
    );
  }
}
