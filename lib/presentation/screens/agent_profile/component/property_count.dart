import 'package:dotted_border/dotted_border.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/agent/agent_details_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';

class PropertyCount extends StatelessWidget {
  const PropertyCount({Key? key, required this.propertyCount})
      : super(key: key);
  final AgentDetailsModel propertyCount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Map<String, String>> propertyList = [
      {
        "number": propertyCount.totalProperty.toString(),
        "title": 'Total Property'
      },
      {"number": propertyCount.totalReview.toString(), "title": 'Total Review'},
      // {"number": '40', "title": 'Apartment'},
    ];
    return Container(
      height: 80,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h)
          .copyWith(top: 0.0),
      child: DottedBorder(
        color: primaryColor,
        dashPattern: const [6, 3],
        strokeCap: StrokeCap.square,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            propertyList.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextStyle(
                    text: propertyList[index]['number']!.padLeft(2, '0'),
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                    color: blackColor),
                const SizedBox(height: 5.0),
                CustomTextStyle(
                    text: propertyList[index]['title']!,
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w400,
                    color: grayColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
