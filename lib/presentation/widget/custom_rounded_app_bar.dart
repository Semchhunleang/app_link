import 'package:real_estate/state_inject_package_names.dart';
import '../utils/constraints.dart';
import 'custom_test_style.dart';

class CustomRoundedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomRoundedAppBar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(top: 18),
        child: Row(
          children: [
            const BtnCycleBack(isBackGroundWhite:true),
            SizedBox(width: 10.w),
            CustomTextStyle(
              text: text,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
              color: whiteColor,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
