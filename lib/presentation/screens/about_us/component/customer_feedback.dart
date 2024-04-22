import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/logic/bloc/login/login_bloc.dart';
import 'package:real_estate/logic/cubit/review/review_cubit.dart';

import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../home/component/headline_text.dart';

class CustomerFeedback extends StatelessWidget {
  const CustomerFeedback({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final reviewCubit = context.read<ReviewCubit>();
    reviewCubit.getReviewList();
    final user = context.read<LoginBloc>().userInfo!.userDataModel;
    return Column(
      children: [
        HeadlineText(
          text: 'Customer Feedback',
          onTap: () => Navigator.pushNamed(context, RouteNames.reviewScreen),
        ),
        BlocBuilder<ReviewCubit, ReviewState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  reviewCubit.reviews.length >= 4
                      ? 4
                      : reviewCubit.reviews.length,
                  (index) {
                    final review = reviewCubit.reviews[index];
                    return Container(
                      width: size.width * 0.8,
                      // height: 200.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 20.0),
                      margin: EdgeInsets.only(
                          left: index == 0 ? 16.0 : 12.0,
                          right: index == 4 ? 16.0 : 0.0),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: borderRadius,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: List.generate(
                              review.rating,
                              (index) => const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: CustomImage(path: KImages.starIcon),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ReadMoreText(
                            review.review,
                            trimLines: 1,
                            trimLength: 60,
                            trimExpandedText: 'Show Less',
                            trimCollapsedText: 'Show More',
                            moreStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: detailFontSize,
                              color: primaryColor,
                            ),
                            lessStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: detailFontSize,
                              color: primaryColor,
                            ),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: detailFontSize,
                              color: grayColor,
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              // ClipOval(
                              //   child: CustomImage(
                              //     path: RemoteUrls.imageUrl(user.image),
                              //     height: size.height * 0.06,
                              //     width: size.height * 0.06,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              const SizedBox(width: 12.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextStyle(
                                    text: user.firstName + user.lastName,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.w700,
                                    color: blackColor,
                                  ),
                                  // CustomTextStyle(
                                  //   text: user.designation,
                                  //   fontSize: detailFontSize,
                                  //   fontWeight: FontWeight.w400,
                                  //   color: grayColor,
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
