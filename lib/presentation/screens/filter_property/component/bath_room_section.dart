import 'package:real_estate/state_inject_package_names.dart';
import '../../../../logic/cubit/filter_property/filter_property_state_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';

class BathRoomSection extends StatefulWidget {
  const BathRoomSection({Key? key, required this.totalBathRoom})
      : super(key: key);
  final int totalBathRoom;

  @override
  State<BathRoomSection> createState() => _BathRoomSectionState();
}

class _BathRoomSectionState extends State<BathRoomSection> {
  List<int> rooms = [];

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterPropertyCubit>();
    return BlocBuilder<FilterPropertyCubit, FilterPropertyStateModel>(
      buildWhen: (previous, current) => current.bathRooms.isEmpty,
      builder: (context, state) {
        return Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 20.0,
          children: List.generate(
            widget.totalBathRoom,
            (index) {
              int i = index + 1;
              return Padding(
                padding: EdgeInsets.only(right: isIpad? 22.w:5.w , bottom: isIpad? 7.h:0.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      // scale: isIpad ? checkBoxSize : 1,
                      scale: 1,
                      child: Checkbox(
                        value: rooms.contains(i),
                        onChanged: (bool? val) {
                          setState(() {
                            if (val == true) {
                              rooms.add(i);
                            } else {
                              rooms.remove(i);
                            }
                          });
                          filterCubit.bathRoomChange(rooms);
                        },
                        activeColor: primaryColor,
                      ),
                    ),
                    CustomTextStyle(
                      text: 'Room $i',
                      fontSize: titleFontSize,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
