import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_rounded_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  Widget conditionText(String heading, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextStyle(
          text: heading,
          fontSize: titleFontSize,
          fontWeight: FontWeight.w700,
          color: blackColor,
        ),
        const SizedBox(height: 4.0),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: GoogleFonts.dmSans(
              height: 1.6,
              fontWeight: FontWeight.w400,
              color: grayColor,
              fontSize: detailFontSize),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final privacyCubit = context.read<PrivacyPolicyCubit>();
    privacyCubit.getTermsAndCondition();
    return Scaffold(
      appBar: const CustomRoundedAppBar(
        text: 'Terms & Conditions',
      ),
      body: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
        builder: (context, state) {
          if (state is PrivacyPolicyLoading) {
            return const LoadingWidget();
          } else if (state is PrivacyPolicyError) {
            if (state.statusCode == 503) {
              return LoadedTermsCondition(
                  termsConditionText: privacyCubit.termsConditionText!);
            } else {
              return Center(
                child: CustomTextStyle(
                  text: state.message,
                  color: redColor,
                  fontSize: titleFontSize,
                ),
              );
            }
          } else if (state is TermsAndConditionLoaded) {
            return LoadedTermsCondition(
                termsConditionText: state.termsConditions);
          }
          return const Center(
              child: CustomTextStyle(text: 'Something went wrong'));
        },
      ),
    );
  }
}

class LoadedTermsCondition extends StatelessWidget {
  const LoadedTermsCondition({Key? key, required this.termsConditionText})
      : super(key: key);
  final String termsConditionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius,
      ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Html(
            data: termsConditionText,
            style: {
              'p': Style(
                fontSize: FontSize(detailFontSize),
                textAlign: TextAlign.justify,
              ),
            },
          ),
        ],
      ),
    );
  }
}
