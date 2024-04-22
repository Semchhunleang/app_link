import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/category/home_category_model.dart';
import '../../../router/route_names.dart';
import 'headline_text.dart';
import 'single_category_circle.dart';

class HorizontalCategoryView extends StatelessWidget {
  const HorizontalCategoryView({Key? key, required this.category})
      : super(key: key);
  final HomeCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineText(
          text: 'All Category',
          onTap: () =>
              Navigator.pushNamed(context, RouteNames.allCategoryScreen),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(),
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              category.propertyTypes.length > 5
                  ? 5 : category.propertyTypes.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? paddingHorizontal : 0.0,
                    right: index == category.propertyTypes.length - 1 ? paddingHorizontal: 0.0),
                child: GestureDetector(
                  onTap: () {
                    final type = category.propertyTypes[index].name
                        .replaceAll(' ', '-')
                        .toLowerCase();
                    Navigator.pushNamed(
                        context, RouteNames.filterPropertyScreen,
                        arguments: type);
                  },
                  child: SingleCategoryCircle(
                      category: category.propertyTypes[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
