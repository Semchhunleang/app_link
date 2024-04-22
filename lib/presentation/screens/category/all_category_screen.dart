import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../router/route_names.dart';
import '../home/component/single_category_circle.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>().homeModel.category.propertyTypes;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: const CustomAppBar(title: 'All Category'),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 10.h).copyWith(top: 15.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isIpad ? 5 : 3, crossAxisSpacing: 0.0, mainAxisExtent: 120,
            mainAxisSpacing: 20
        ),
        itemCount: homeCubit.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              final type =homeCubit[index].name.replaceAll(' ', '-').toLowerCase();
              Navigator.pushNamed(context, RouteNames.filterPropertyScreen,arguments: type);
            },
            child: SingleCategoryCircle(category: homeCubit[index])),
      ),
    );
  }
}
