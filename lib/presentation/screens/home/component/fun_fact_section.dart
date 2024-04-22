import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/home/counter_model.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';

class FunFactSection extends StatelessWidget {
  const FunFactSection({Key? key, required this.counter}) : super(key: key);
  final CounterModel counter;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String bgImage = counter.content.bgImage.isNotEmpty
        ? counter.content.bgImage
        : KImages.funFactImageImage;
    return SizedBox(
      height: size.height * 0.35,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImage(
            path: bgImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 20.h,
            left: 15.w,
            child: CustomTextStyle(
              text: counter.content.title,
              color: whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
          ),
          Positioned.fill(
            top: size.height * 0.1,
            left: size.width / 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                counter.items.length >= 3 ? 3 : counter.items.length,
                (index) {
                  final items = counter.items[index];
                  return Flexible(
                    child: buildContainer(
                      size,
                      items.icon,
                      items.number.toString(),
                      items.title,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(Size size, String icon, String title, String subTitle) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 111.h,
          height: 125.h,
          margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: primaryColor, width: 1.2),
            borderRadius: borderRadius,
          ),
        ),
        Positioned(
          top: -20.h,
          left: -7.w,
          right: 0.0,
          child: Container(
            width: 45.h,
            height: 45.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: CustomImage(
              path: icon,
              height: 22.h
              // fit: BoxFit.cover,
              //  color: redColor,
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.018,
          left: -7.w,
          right: 0.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextStyle(
                  text: title,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                  maxLine: 1,
                ),
                SizedBox(height: 4.h),
                CustomTextStyle(
                  text: subTitle,
                  fontWeight: FontWeight.w400,
                  color: grayColor,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                  fontSize: 16.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
