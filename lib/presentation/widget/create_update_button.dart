import 'package:real_estate/presentation/widget/primary_button.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../utils/constraints.dart';

class CreateUpdateSubmitButton extends StatelessWidget {
  const CreateUpdateSubmitButton({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh * 0.1,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: PrimaryButton(
        text: title,
        onPressed: press,
        bgColor: yellowColor,
        borderRadiusSize: radius,
        textColor: blackColor,
        fontSize: titleFontSize,
      ),
    );
  }
}
