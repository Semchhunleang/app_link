import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../data/model/about_us/about_us_model.dart';
import '../../utils/constraints.dart';
// import '../../utils/k_images.dart';
import '../../widget/custom_rounded_app_bar.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import '../home/component/fun_fact_section.dart';
import 'component/customer_feedback.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);
  final space = SizedBox(height: 18.h);

  @override
  Widget build(BuildContext context) {
    final aboutUsCubit = context.read<AboutUsCubit>();
    //aboutUsCubit.getAboutUs();
    // final list = [
    //   KImages.aboutUsImage01,
    //   KImages.aboutUsImage02,
    // ];
    return Scaffold(
      appBar:
          CustomRoundedAppBar(text: aboutUsCubit.aboutUs!.seoSetting!.pageName),
      body: BlocBuilder<AboutUsCubit, AboutUsState>(
        builder: (context, state) {
          if (state is AboutUsLoading) {
            return const LoadingWidget();
          } else if (state is AboutUsError) {
            if (state.statusCode == 503) {
              return AboutUsLoadedWidget(aboutUs: aboutUsCubit.aboutUs!);
            } else {
              return Center(
                child: CustomTextStyle(
                    text: state.message,
                    color: redColor,
                    fontSize: titleFontSize),
              );
            }
          } else if (state is AboutUsLoaded) {
            return AboutUsLoadedWidget(aboutUs: state.aboutUs);
          }
          return const Center(
              child: CustomTextStyle(text: 'Something went wrong'));
        },
      ),
    );
  }
}

class AboutUsLoadedWidget extends StatelessWidget {
  AboutUsLoadedWidget({Key? key, required this.aboutUs}) : super(key: key);
  final AboutUsModel aboutUs;
  final aboutUsTextStyle = GoogleFonts.dmSans(
    fontSize: detailFontSize,
    color: blackColor,
    height: 1.8,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    final reviewCubit = context.read<ReviewCubit>();
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius,
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultVerticalSpace,
                CustomTextStyle(
                  text: aboutUs.aboutUs!.shortTitle,
                  fontSize: titleFontSize,
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                ),
                Text(
                  aboutUs.aboutUs!.description1,
                  textAlign: TextAlign.justify,
                  style: aboutUsTextStyle,
                ),
                Text(
                  aboutUs.aboutUs!.description2,
                  textAlign: TextAlign.justify,
                  style: aboutUsTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          if (aboutUs.counter!.visibility)
            FunFactSection(counter: aboutUs.counter!),
          defaultVerticalSpace,
          Visibility(
              visible: reviewCubit.reviews.isNotEmpty,
              child: const CustomerFeedback()),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
