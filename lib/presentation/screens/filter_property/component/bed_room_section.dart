import 'package:real_estate/state_inject_package_names.dart';
import '../../../../logic/cubit/filter_property/filter_property_state_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';

class BedRoomSection extends StatefulWidget {
  const BedRoomSection({Key? key, required this.totalBedRoom})
      : super(key: key);
  final int totalBedRoom;

  @override
  State<BedRoomSection> createState() => _BedRoomSectionState();
}

class _BedRoomSectionState extends State<BedRoomSection> {
  List<int> rooms = [];

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterPropertyCubit>();
    return BlocBuilder<FilterPropertyCubit, FilterPropertyStateModel>(
      buildWhen: (previous, current) => current.rooms.isEmpty,
      builder: (context, state) {
        return Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 20.0,
          children: List.generate(
            widget.totalBedRoom,
            (index) {
              int i = index + 1;
              return Padding(
                padding: EdgeInsets.only(right: isIpad? 22.w:5.w , bottom: isIpad? 7.h:2.h),
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
                          filterCubit.roomChange(rooms);
                        },
                        activeColor: primaryColor,
                      ),
                    ),
                    SizedBox(width: 3.w,),
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
