import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/k_images.dart';
import '/presentation/widget/empty_widget.dart';
import '../../../data/model/filter/filter_property_list_model.dart';
import '../../../logic/cubit/filter_property/filter_property_state_model.dart';
import '../../router/route_names.dart';
import '../../utils/constraints.dart';
import '../../widget/custom_images.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import 'component/drawer_menu.dart';
import 'component/single_filter_properties.dart';

class FilterPropertyScreen extends StatelessWidget {
  FilterPropertyScreen({Key? key, required this.type}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final String type;

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterPropertyCubit>();
 
    filterCubit.clearVariables();
    if (type.isEmpty) {
      // filterCubit.numPage = 1;
      filterCubit.getAllProperty();
    } else {
      filterCubit.getFilterPropertyByType(type);
      // print('not empty');
    }
    //print('lenght: ${filterCubit.property!.propertyType!.length}');

    return Scaffold(
      key: _key,
      endDrawerEnableOpenDragGesture: false,
      appBar: const FilterAppBar(),
      //appBar: const CustomAppBar(title: 'Filter Property'),
      body: BlocBuilder<FilterPropertyCubit, FilterPropertyStateModel>(
        builder: (context, state) {
          final filter = state.filterState;
          if (filter is FilterPropertyLoading) {
            return const LoadingWidget();
          } 
          else if (filter is FilterPropertyError) {
            if (filter.statusCode == 503) {
              return LoadedFilterWidget(filterProperty: filterCubit.property!);
            } else {
              return Center(
                child: CustomTextStyle(text: filter.message, color: redColor));
            }
          } else if (filter is FilterPropertyLoaded) {
            return LoadedFilterWidget(filterProperty: filter.property);
          }
          return LoadedFilterWidget(filterProperty: filterCubit.property!);
        },
      ),
      endDrawer: DrawerFilter(propertyList: filterCubit.property!)
      // BlocBuilder<FilterPropertyCubit, FilterPropertyStateModel>(
      //   builder: (context, state){
      //     if(state.filterState is FilterPropertyLoaded){
      //       return DrawerFilter(propertyList: filterCubit.property!);
      //     }else{
      //       return SizedBox();
      //     }
      //   },
      // ),
    );
  }
}

class LoadedFilterWidget extends StatelessWidget {
  const LoadedFilterWidget({Key? key, required this.filterProperty})
      : super(key: key);
  final FilterPropertyListModel filterProperty;

  @override
  Widget build(BuildContext context) {
    final property = filterProperty.properties!.data!;
     final filterCubit = context.read<FilterPropertyCubit>();
    if (property.isNotEmpty) {
      return ListView.builder(
        controller: filterCubit.scrollController,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 18.h)
            .copyWith(bottom: 20.0),
        itemCount: property.length >= 6? (property.length +1): property.length,
        itemBuilder: (context, index){
          if(index < property.length){
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, RouteNames.propertyDetailsScreen,
                  arguments: property[index].slug),
              child: SingleFilterProperties(
                property: property[index],
              ),
            );
          }else{
            return SizedBox(
              width: double.infinity,
              height: 30,
              child: Center(
                child: filterCubit.hasMore ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(color: primaryColor)):const CustomTextStyle(text: "No more Property to load", color: grayColor,))
            );
          }
        }
      );
    } else {
      return const Center(
        child: EmptyWidget(icon: KImages.emptyFilter, title: 'No Property Found!'),
      );
    }
  }
}

class FilterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50.h,
      backgroundColor: scaffoldBackground,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actionsIconTheme: const IconThemeData(color: primaryColor, size: 30, fill: 0.6),
      actions: const [SizedBox()],
      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                BtnCycleBack(),
                SizedBox(width: 16.0),
                CustomTextStyle(
                  text: 'Filter Property',
                  fontWeight: FontWeight.w500,
                  fontSize: titleFontSize,
                ),
              ],
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 15.w)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFEFC64F)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r))),
                shadowColor: MaterialStateProperty.all(transparent),
                elevation: MaterialStateProperty.all(0.0),
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.all(transparent),
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              label: const CustomTextStyle(
                text: 'Filter',
                color: blackColor,
                fontWeight: FontWeight.w700,
                fontSize: titleFontSize,
              ),
              icon: const CustomImage(
                path: KImages.filterIcon,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
