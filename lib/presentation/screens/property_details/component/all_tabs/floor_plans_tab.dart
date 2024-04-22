import 'package:real_estate/state_inject_package_names.dart';
import '../single_floor_structure.dart';

class FloorPlansTab extends StatelessWidget {
  const FloorPlansTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final floors = state.singlePropertyModel.propertyPlans;
          return ListView.builder(
            itemCount: floors!.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 20.h),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => SingleFloorStructure(
              plan: floors[index],
              isExpand: index == 1 ? true : false,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
