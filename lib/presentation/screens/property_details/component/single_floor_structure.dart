import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/product/property_plan_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class SingleFloorStructure extends StatelessWidget {
  const SingleFloorStructure(
      {Key? key, required this.plan, this.isExpand = false})
      : super(key: key);
  final bool isExpand;
  final PropertyPlan plan;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFE3E3E3);
    return Container(
      width: double.infinity,
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpand,
          childrenPadding:EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h).copyWith(top: 0.0),
          iconColor: grayColor,
          collapsedIconColor: grayColor,
          title: CustomTextStyle(
              text: plan.title,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
              color: blackColor),
          children: [
            CustomImage(path:plan.image),
            const SizedBox(height: 10.0),
            MyReadMoreText(
              text: plan.description,
              trimLines: 4,
              trimLength: 180,
            ),
          ],
        ),
      ),
    );
  }
}
