import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../utils/constraints.dart';


class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.w400,
      this.fontSize = detailFontSize,
      this.height = 1.4,
      this.maxLine = 6,
      this.color = blackColor,
      this.overflow = TextOverflow.ellipsis,
      this.textAlign = TextAlign.start, this.letterSpacing,})
      : super(key: key);
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final TextAlign textAlign;
  final int maxLine;
  final TextOverflow overflow;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: GoogleFonts.poppins(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}


class MyReadMoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final int trimLength;
  MyReadMoreText({super.key, required this.text, required this.trimLines, required this.trimLength});
  final TextStyle moreLessTextStyle = GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        // fontSize: 1.sw > dWidthSize ? detailFontSize.sp - 10: detailFontSize.sp,
         fontSize: detailFontSize,
        color: primaryColor,
      );
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      trimLength: trimLength,
      trimExpandedText: 'Show Less',
      trimCollapsedText: 'Show More',
      moreStyle: moreLessTextStyle,
      lessStyle: moreLessTextStyle,
      textAlign: TextAlign.start,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: detailFontSize,
        color: grayColor,
        height: 1.8,
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isAreaSection;
  MyRichText({super.key, required this.text1, required this.text2, this.isAreaSection= true});
  final TextStyle textStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    // fontSize: 1.sw > dWidthSize ? detailFontSize.sp-10:detailFontSize.sp,
    // fontSize: 1.sw > dWidthSize ? detailFontSize + (detailFontSize.sp / sizeDivideIn): detailFontSize.sp,
    fontSize: detailFontSize,
    color: blackColor,
  );
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: textStyle
          ),
          TextSpan(
            text: text2,
            style: textStyle,
          ),
          if(isAreaSection)
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0.0, -10.0),
              child: const Text('2'),
            ),
          ),
        ],
      ),
    );
  }
}
