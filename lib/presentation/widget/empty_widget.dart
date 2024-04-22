import 'package:flutter/material.dart';
import 'package:real_estate/presentation/utils/constraints.dart';

import 'custom_images.dart';
import 'custom_test_style.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.icon, required this.title})
      : super(key: key);
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage(path: icon),
        const SizedBox(height: 10.0),
        CustomTextStyle(
            text: title, fontSize: titleFontSize, fontWeight: FontWeight.w500),
      ],
    );
  }
}
