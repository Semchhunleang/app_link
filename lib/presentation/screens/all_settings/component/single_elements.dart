import 'package:real_estate/state_inject_package_names.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class SingleElement extends StatelessWidget {
  const SingleElement(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onTap,
      this.showBorder = true})
      : super(key: key);
  final String icon;
  final String text;
  final VoidCallback onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
            child: Row(
              children: [
                CustomImage(
                color: primaryColor,
                  path: icon,
                  width: iconSize,
                  height: iconSize,
                  // fit: BoxFit.cover,
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: CustomTextStyle(
                    text: text,
                    fontWeight: FontWeight.w400,
                    fontSize: titleFontSize,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          showBorder
          ? Container(
              width: double.infinity,
              height: 1.0,
              color: borderColor,
            )
          : const SizedBox(),
        ],
      ),
    );
  }
}
