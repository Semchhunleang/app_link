
import 'package:real_estate/data/model/apier/summary_model.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';

class SelectBoxWidget extends StatelessWidget {
  final Function onTap;
  final bool showOptions;
  final String selectedOption;
  const SelectBoxWidget({super.key, required this.onTap, required this.showOptions, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () =>onTap(),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextStyle(text: selectedOption),
            Icon(showOptions ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

// class SelectBoxListWidget extends StatelessWidget {
//   const SelectBoxListWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class LevelListWidget extends StatelessWidget {
  final Function onTap;
  final DataSummaryModel summaryLevel;
  const LevelListWidget({super.key, required this.summaryLevel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
            bottom: BorderSide(width: 3, color: colorSpanishGrey.withOpacity(0.1))
          )
        ),
        
        height: 90,
        child: Row(
          children: [
            TriangleWidget(level: summaryLevel.level.toString(),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextStyle(
                    textAlign: TextAlign.center,
                    text: "Total Invited:   ${summaryLevel.invite}",
                    fontSize: detailFontSize,
                    fontWeight: FontWeight.w400,
                    color: colorSpanishGrey,
                    height: 1.8,
                  ),
                  CustomTextStyle(
                    textAlign: TextAlign.center,
                    text: "Total Earned:   ${summaryLevel.amountFormat}",
                    fontSize: detailFontSize,
                    fontWeight: FontWeight.w400,
                    color: colorSpanishGrey,
                  ),
                ],
              )
              ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Icons.arrow_forward_ios_rounded, size: iconSize, weight: 0.01, color: colorSpanishGrey.withOpacity(0.7),),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBTN extends StatelessWidget {
  final Function onTap;
  const SearchBTN({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Card(
        color: primaryColor,
        child: Container(
          height: 40,
          width: 60,
          alignment: Alignment.center,
          child: const Icon(
            Icons.search, color: whiteColor,
            size: iconSize +5,),
        ),
      )
    );
  }
}

class BigCard extends StatelessWidget {
  final String title;
  final String value;
  const BigCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextStyle(
                textAlign: TextAlign.center,
                text: title,
                fontSize: detailFontSize,
                fontWeight: FontWeight.w400,
                color: whiteColor,
              ),
                CustomTextStyle(
                textAlign: TextAlign.center,
                text: value,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w400,
                color: whiteColor,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleWidget extends StatelessWidget {
  final String level;
  const TriangleWidget({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(75, 55), // Size of the widget
            painter: TrianglePainter(), 
          ),
          Positioned(
            width: 75,
            height: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTextStyle(
                  textAlign: TextAlign.center,
                  text: "APIer",
                  fontSize: detailFontSize,
                  fontWeight: FontWeight.w400,
                   color: whiteColor,
                ),
                 CustomTextStyle(
                  textAlign: TextAlign.center,
                  text: level,
                  fontSize: detailFontSize,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                ),
              ],
            )
            )
        ],
      ),
    );
  }
}


class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor // Color of the triangle
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(0, 0); // Starting point
    path.lineTo(size.width, 0); // Top-right point
    path.lineTo(size.width / 2, size.height); 
    path.close(); // Close the path to form a triangle
    canvas.drawPath(path, paint); // Draw the triangle on the canvas
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


// class SmallCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final double fontSize;
//   final double paddingHorizentalIcon;
//   const SmallCard({super.key, required this.title, required this.icon, this.fontSize = 13, this.paddingHorizentalIcon = 12});

//   @override
//   Widget build(BuildContext context) {
//     return  Expanded(
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         semanticContainer: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         color: primaryColor,
//         child: Row(
//           children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical:8, horizontal: paddingHorizentalIcon),
//                 child: Icon(icon, color: whiteColor,),
//               ),
//               CustomTextStyle(
//               textAlign: TextAlign.center,
//               text: title,
//               fontSize: fontSize,
//               fontWeight: FontWeight.w500,
//               color: whiteColor,
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
