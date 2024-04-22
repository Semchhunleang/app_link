import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import 'single_property_card_view.dart';

class AllPropertyListScreen extends StatelessWidget {
  const AllPropertyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>().homeModel.featuredProperty;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: CustomAppBar(
        title: homeCubit!.description,
      ),
      body: ListView.builder(
        itemCount: homeCubit.properties.length,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h).copyWith(bottom: 35.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = homeCubit.properties[index];
          return GestureDetector(
              onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.propertyDetailsScreen,
                    arguments: item.slug,
                  ),
              child: SinglePropertyCardView(property: item));
        },
      ),
    );
  }
}
