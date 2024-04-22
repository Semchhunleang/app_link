import 'package:real_estate/state_inject_package_names.dart';
import '/presentation/utils/constraints.dart';
import '/presentation/widget/custom_test_style.dart';
import '/presentation/widget/primary_button.dart';
import '../../../../data/model/filter/filter_property_list_model.dart';
import '../../../utils/utils.dart';
import 'area_section.dart';
import 'bath_room_section.dart';
import 'bed_room_section.dart';
import 'location_section.dart';
import 'price_section.dart';
import 'property_type_section.dart';
import 'purpose_section.dart';

class DrawerFilter extends StatefulWidget {
  const DrawerFilter({Key? key, required this.propertyList}) : super(key: key);
  final FilterPropertyListModel propertyList;

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}

class _DrawerFilterState extends State<DrawerFilter> {
  Widget headingText(String text) {
    return CustomTextStyle(
      text: text,
      fontSize: titleFontSize,
    );
  }
  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterPropertyCubit>();
    //print(icon);
    return SafeArea(
      child: Drawer(
        width: 0.75.sw,
        backgroundColor: whiteColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    IconButton(
                        onPressed: () => Scaffold.of(context).closeEndDrawer(),
                        icon: const Icon(Icons.clear,size: iconSize +10, color: redColor)),
                  ],
                ),
                Utils.verticalSpace(9.h),
                const PurposeSection(),
                Utils.verticalSpace(18.h),
                LocationSection(location: widget.propertyList.location!),
                Utils.verticalSpace(18.h),
                PropertyTypeSection(
                    propertyType: widget.propertyList.propertyType!),
                Utils.verticalSpace(18.h),
                headingText('Bed Rooms'),
                SizedBox(height: 10.h),
                BedRoomSection(totalBedRoom: widget.propertyList.maxBedRooms),
                Utils.verticalSpace(18.h),
                headingText('Bath Rooms'),
                SizedBox(height: 10.h),
                BathRoomSection( totalBathRoom: widget.propertyList.maxBathRooms),
                 Utils.verticalSpace(18.h),
                headingText('Area'),
                AreaSection(totalArea: widget.propertyList.maxArea),
                SizedBox(height: 10.h),
                headingText('Price'),
                PriceSection(totalPrice: widget.propertyList.maxPrice),
                Utils.verticalSpace(18.h),
                PrimaryButton(
                    text: 'Search',
                    onPressed: () {
                      Scaffold.of(context).closeEndDrawer();
                      filterCubit.getFilterProperty();
                      filterCubit.clear();
                      // filterCubit.roomChange([]);
                      // filterCubit.bathRoomChange([]);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
