import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/review/review_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class SingleReviewCard extends StatelessWidget {
  const SingleReviewCard({Key? key, required this.review}) : super(key: key);
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = context.read<LoginBloc>().userInfo!.userDataModel;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              review.rating,
              (index) => Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: const CustomImage(path: KImages.starIcon),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          MyReadMoreText(text: review.review, trimLines: 1, trimLength: 100),
          SizedBox(height: 10.h),
          Row(
            children: [
              ClipOval(
                child: CustomImage(
                  //path: KImages.profilePicture,
                  path: review.property!.thumbnailImage,
                  height: size.height * 0.06,
                  width: size.height * 0.06,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextStyle(
                    text: user.nickname,
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
  }
}
