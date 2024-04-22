import 'package:real_estate/presentation/utils/utils.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../widget/custom_images.dart';
import 'package:intl/intl.dart';

// const Color primaryColor = Color(0xFF7166F0);
const Color primaryColor = Color(0xFFef462c);

const Color blackColor = Color(0xFF111111);
const Color grayColor = Color(0xFF7E8BA0);
const Color whiteColor = Color(0xFFFFFFFF);
const Color yellowColor = Color(0xFFF2C94C);
const Color borderColor = Color(0xFFECEAFF);
const Color scaffoldBackground = Color(0xFFECEAFF);
const Color borderWithOpacityColor = Color(0xFFF5F4FF);
const Color redColor = Colors.red;
const Color greenColor = Color(0xFF198754);
const Color transparent = Colors.transparent;
const Color colorMiddleBlue = Color(0xff85d1d8);
const Color colorSpanishGrey = Color(0xff939598);
const Color secondaryColor = Color(0xff85D1D8);

const duration = Duration(seconds: 1);
double radius = 4.0;
BorderRadius borderRadius = BorderRadius.circular(radius);

const double priceFontSize = 22;
const double profileNameFontSize = 20;
const double titleFontSize = 17;
const double subtitleFontSize = 16;
const double detailFontSize = 15;
const double textFieldSize = 15;

const double iconSize = 22;
const double textFieldIconSize = 16;
const double propertyCardIconSize = 14; // icon location

final double paddingHorizontal = 12.w; // padding left right of full screen

const double propertyHomePageCardWidth = 270;

const double propertyHomeImageCardWidth = 170; // image thumnail

const double propertyCardPadding = 15; // padding property in card(home sceen)

const double homeScreenSpace = 30; // space between rows

const double homeScreenSpaceVertical = 15; // space home screen top and bottom

const double spaceTitleAndCard = 15; // homeScreen space between title and card

const double spaceBetweenCardAndCard = 20; // home screen

const double propertyCardListPadding =
    10; // padding property list card(list screen)

const double buttonIconSize = 40; // delete edit add button

final dateFmt = DateFormat('dd-MMM-yyyy');

final dateFmtYMD = DateFormat('yyyy-MM-dd');

// const bool isIpad = false;
const double dWidthSize = 600;
final bool isIpad = 1.sw > dWidthSize ? true : false;
const double selectBoxHeight = 40;
const double checkBoxSize = 1.6;

final defaultVerticalSpace = Utils.verticalSpace(16);
// const double sizeDivideIn = 50.0;

const labelStyle = TextStyle(
    fontSize: textFieldSize, color: grayColor, fontWeight: FontWeight.w400);
const hintStyle = labelStyle;

const textFieldStyle =
    TextStyle(fontSize: textFieldSize, fontWeight: FontWeight.w500);

const floatingLabelStyle =
    TextStyle(fontSize: textFieldSize + 3, color: grayColor);

credentialIcon(String icon) {
  return SizedBox(
    height: 40.0,
    width: 40.0,
    child: Center(
      child: CustomImage(
        path: icon,
        fit: BoxFit.cover,
      ),
    ),
  );
}
