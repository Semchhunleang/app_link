import 'package:real_estate/presentation/utils/utils.dart';
import 'package:real_estate/presentation/widget/empty_widget.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../widget/custom_images.dart';
import '../../../../widget/custom_test_style.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final review = state.singlePropertyModel.reviews;
          if (review!.isNotEmpty) {
            return ListView.builder(
                itemCount: review.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20.h),
                itemBuilder: (context, index) {
                  final item = review[index];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: borderRadius,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                item.rating,
                                (index) => const Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: CustomImage(path: KImages.starIcon),
                                ),
                              ),
                            ),
                            CustomTextStyle(
                              text: Utils.convertToAgo(item.createdAt),
                              //text: Utils.timeAgo(item.createdAt),
                              color: primaryColor,
                              fontSize: titleFontSize,
                            )
                          ],
                        ),
                        SizedBox(height: 10.h),
                        MyReadMoreText(text: item.review, trimLines: 1, trimLength: 60),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            ClipOval(
                              child: CustomImage(
                                //path: KImages.profilePicture,
                                path: item.user!.image,
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
                                  text: item.user!.name,
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: blackColor,
                                ),
                                CustomTextStyle(
                                  text: item.user!.designation,
                                  fontSize: detailFontSize,
                                  fontWeight: FontWeight.w400,
                                  color: grayColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: const Center(
                child: EmptyWidget(
                    icon: KImages.emptyReview, title: 'No Review Found!'),
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}

