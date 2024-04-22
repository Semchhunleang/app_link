import 'package:flutter/material.dart';
import '../../../../data/model/product/property_type_model.dart';
import '../../../widget/custom_test_style.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';

class SingleCategoryCircle extends StatelessWidget {
  const SingleCategoryCircle({Key? key, required this.category})
      : super(key: key);
  final PropertyTypeModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 120.0,
          width: 110.0,
          alignment: Alignment.center,
          child: Column(
            children: [
              CategoryImage(
                path: category.icon == "" ? "assets/images/" : category.icon,
                height: 85.0,
                width: 85.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              CustomTextStyle(
                text: category.name,
                fontSize: detailFontSize,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500,
                maxLine: 1,
              ),
              // CustomTextStyle(
              //   text: "${category.totalProperty} + Property",
              //   fontSize: detailFontSize,
              //   color: const Color(0xFF000000),
              //   textAlign: TextAlign.start,
              // )
            ],
          ),
        ),
        // ),
      ],
    );
  }
}
