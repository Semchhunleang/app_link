import 'package:real_estate/state_inject_package_names.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class SingleChooseOption extends StatelessWidget {
  const SingleChooseOption({
    Key? key,
    required this.onTap,
    required this.text,
    required this.subText,
    required this.icon,
    required this.iconBgColor,
  }) : super(key: key);
  final VoidCallback onTap;
  final String icon;
  final String text;
  final String subText;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 1.sh * 0.18,
        // width: 1.sw,
        padding: const EdgeInsets.all(propertyCardPadding),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            Container(
              height: isIpad? 100:90,
              width: isIpad? 100:90,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right:isIpad ? 20:12, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: CustomImage(
                path: icon,
                height: 65,
                width: 65,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextStyle(
                    text: text,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  SizedBox(height: 6.h),
                  CustomTextStyle(
                    text: subText,
                    fontSize: detailFontSize,
                    color: grayColor,
                    maxLine: 5,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
