import 'package:real_estate/presentation/utils/k_images.dart';
import 'package:real_estate/presentation/widget/empty_widget.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/widget/custom_rounded_app_bar.dart';
import '../../../data/model/review/review_model.dart';
import '../../utils/constraints.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import 'component/single_review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewCubit = context.read<ReviewCubit>();
    reviewCubit.getReviewList();
    return Scaffold(
      appBar: const CustomRoundedAppBar(text: 'All Review'),
      body: BlocBuilder<ReviewCubit, ReviewState>(
        builder: (context, state) {
          if (state is ReviewLoading) {
            return const LoadingWidget();
          } else if (state is ReviewError) {
            if (state.statusCode == 503) {
              return ReviewLoadedWidget(reviews: reviewCubit.reviews);
            } else {
              return Center(
                child: CustomTextStyle(
                  text: state.message,
                  color: redColor,
                  fontSize: titleFontSize,
                ),
              );
            }
          } else if (state is ReviewLoaded) {
            return ReviewLoadedWidget(reviews: state.reviews);
          }
          return const Center(
              child: CustomTextStyle(text: 'Something went wrong'));
        },
      ),
    );
  }
}

class ReviewLoadedWidget extends StatelessWidget {
  const ReviewLoadedWidget({Key? key, required this.reviews}) : super(key: key);
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    if (reviews.isNotEmpty) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 10.h),
        itemCount: reviews.length,
        itemBuilder: (context, index) =>
            SingleReviewCard(review: reviews[index]),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: const EmptyWidget(
            icon: KImages.emptyReview, title: 'No Review Found!'),
      );
    }
  }
}
