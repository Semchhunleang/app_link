import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/presentation/utils/constraints.dart';

class FormHeaderTitle extends StatelessWidget {
  const FormHeaderTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 15),
      decoration: BoxDecoration(
          color: const Color(0xff32395c),
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          border: Border.all(
            color: Colors.black,
          )),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: titleFontSize, fontWeight: FontWeight.w500, color: whiteColor),
      ),
    );
  }
}