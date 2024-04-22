import 'package:real_estate/state_inject_package_names.dart';
import '../utils/constraints.dart';
import 'custom_test_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.showButton = true,
      this.bgColor = scaffoldBackground,
      this.action})
      : super(key: key);
  final String title;
  final bool showButton;
  final Color bgColor;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: bgColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: action,
      actionsIconTheme:
          const IconThemeData(color: primaryColor, size: 40, fill: 0.6),
      // actions: [const SizedBox()],
      title: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Row(
          children: [
            showButton ? const BtnCycleBack() : const SizedBox(),
            SizedBox(width: showButton ? 14.w : 10.w),
            CustomTextStyle(
              text: title,
              fontWeight: FontWeight.w500,
              fontSize: titleFontSize,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
