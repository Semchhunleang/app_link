import 'package:flutter/material.dart';
import 'package:real_estate/presentation/router/route_packages_name.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../widget/custom_test_style.dart';

class CustomRowTextStyle extends StatelessWidget {
  final String title;
  final String value;
  const CustomRowTextStyle({super.key, this.title = "", this.value = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CustomTextStyle(
              text: title != "" ? title : "title",
              fontSize: detailFontSize,
              fontWeight: FontWeight.w500,
              color: blackColor),
        ),
        const SizedBox(
          width: 40.0,
        ),
        Expanded(
          flex: 2,
          child: CustomTextStyle(
              text: value != "" ? value : "value",
              fontSize: detailFontSize,
              fontWeight: FontWeight.w600,
              color: blackColor),
        ),
      ],
    );
  }
}
