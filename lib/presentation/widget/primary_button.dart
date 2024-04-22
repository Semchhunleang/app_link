import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../utils/constraints.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      this.maximumSize,
      required this.text,
      this.fontSize = titleFontSize,
      required this.onPressed,
      this.textColor = whiteColor,
      this.bgColor = primaryColor,
      this.minimumSize,
      this.borderRadiusSize = 0,
      this.padding = const EdgeInsets.all(5.0)})
      : super(key: key);

  final VoidCallback? onPressed;

  //final List<Color> grediantColor;
  final String text;
  final Size? maximumSize;
  final Size? minimumSize;
  final double fontSize;
  final double borderRadiusSize;
  final Color textColor;
  final Color bgColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(borderRadiusSize);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        splashFactory: NoSplash.splashFactory,
        shadowColor: MaterialStateProperty.all(transparent),
        overlayColor: MaterialStateProperty.all(transparent),
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: borderRadius)),
        minimumSize: MaterialStateProperty.all(minimumSize ?? Size(double.infinity, 52)),
        maximumSize: MaterialStateProperty.all(maximumSize ?? Size(double.infinity, 52)),
        padding: MaterialStateProperty.all(padding),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: textColor,
            // fontSize: 1.sw > dWidthSize ? fontSize.sp - 10 :fontSize.sp,
            //  fontSize: 1.sw > dWidthSize ? fontSize + (fontSize.sp / sizeDivideIn): fontSize.sp,
            // height: 1.5,
            fontSize: fontSize,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
