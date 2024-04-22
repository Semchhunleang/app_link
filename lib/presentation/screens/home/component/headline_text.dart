import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../widget/custom_test_style.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText(
      {Key? key,
      required this.text,
      required this.onTap,
      this.isPadding = true})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isPadding ? paddingHorizontal : 0.0).copyWith(bottom: spaceTitleAndCard),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextStyle(
            text: text,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w500,
          ),
          GestureDetector(
            onTap: onTap,
            child: const CustomTextStyle(
              text: 'See All',
              fontSize: subtitleFontSize,
              color: Color(0xFF7E8BA0),
            ),
          ),
        ],
      ),
    );
  }
}
