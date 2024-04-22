import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/privacy/faq_model/faq_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';

class SingleExpansionTile extends StatelessWidget {
  const SingleExpansionTile(
      {Key? key, this.isExpand = false, required this.faqContent})
      : super(key: key);

  final SingleFaqContent faqContent;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFE3E3E3);
    return Container(
      width: double.infinity,
      // alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h)
          .copyWith(bottom: 2.0),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpand,
          childrenPadding:
            EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h).copyWith(top: 0.0),
          iconColor: grayColor,
          collapsedIconColor: grayColor,
          title: CustomTextStyle(
              text: faqContent.question,
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.w700,
              color: blackColor),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Text(
                faqContent.answer,
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSans(
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    color: grayColor,
                    fontSize: detailFontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
