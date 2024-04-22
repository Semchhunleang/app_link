import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/widget/loading_widget.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_rounded_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
        SizedBox(height: 4.h),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: GoogleFonts.dmSans(
              height: 1.6,
              fontWeight: FontWeight.w400,
              color: grayColor,
              fontSize: detailFontSize),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final privacyCubit = context.read<PrivacyPolicyCubit>();
    privacyCubit.getPrivacyPolicy();
    return Scaffold(
      appBar: const CustomRoundedAppBar(
        text: 'Privacy Policy',
      ),
      body: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
        builder: (context, state) {
          if (state is PrivacyPolicyLoading) {
            return const LoadingWidget();
          } else if (state is PrivacyPolicyError) {
            if (state.statusCode == 503) {
              return LoadedPrivacyPolicy(policyText: privacyCubit.privacyText!);
            } else {
              return Center(
                child: CustomTextStyle(
                  text: state.message,
                  color: redColor,
                  fontSize: titleFontSize,
                ),
              );
            }
          } else if (state is PrivacyPolicyLoaded) {
            return LoadedPrivacyPolicy(policyText: state.privacyPolicy);
          }
          return const Center(
              child: CustomTextStyle(text: 'Something went wrong'));
        },
      ),
    );
  }
}

class LoadedPrivacyPolicy extends StatelessWidget {
  const LoadedPrivacyPolicy({Key? key, required this.policyText})
      : super(key: key);
  final String policyText;

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
          // conditionText('1.Eligibility', eligibility),
          // conditionText('2.Cancellation and Refund', refundCondition),
          // conditionText('3.Terms of Service', termsService),
          // conditionText('4.Payment & Refunds', termsService),
          // conditionText('5.Cancel Order', cancelOrder),
          Html(
            data: policyText,
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
