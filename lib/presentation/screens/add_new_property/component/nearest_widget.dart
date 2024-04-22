import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/create_property/nearest_location_dto.dart';
import '../../../../data/model/product/nearest_location_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/form_header_title.dart';
import '../../../widget/item_add_delete_btn.dart';

class NearestWidget extends StatefulWidget {
  const NearestWidget({super.key});

  @override
  State<NearestWidget> createState() => _NearestWidgetState();
}

class _NearestWidgetState extends State<NearestWidget> {
  int nearestItem = 1;
  final nearestLocations = <NearestLocationDto>[];
  final locationList = <int>[];
  final distanceField = <TextEditingController>[TextEditingController()];
  String location = '';
  String distance = '';
  List<NearestLocationModel> nearestLocationModel = <NearestLocationModel>[];
  List<NearestLocationDto> nearestList = <NearestLocationDto>[];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    final cubit = context.read<CreateInfoCubit>();
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        final updateCubit = context.read<UpdateCubit>();
        nearestLocationModel.insert(
            0, cubit.createPropertyInfo.nearestLocations.first);

        if (state.nearestLocationList.isNotEmpty) {
          nearestList = state.nearestLocationList;
          nearestItem = state.nearestLocationList.length;

          for (var i = 0; i < nearestList.length; i++) {
            distanceField.insert(i, TextEditingController());
            // print()

            // if (nearestList[i].id > 0) {
            if (nearestList[i].locationId > 0) {
              final item = cubit.createPropertyInfo.nearestLocations
                  .where((e) => e.id == nearestList[i].locationId)
                  .first;
              nearestLocationModel.insert(i, item);
            } else {
              nearestLocationModel.insert(
                  i, cubit.createPropertyInfo.nearestLocations.first);
            }

            // }
            locationList.add(nearestList[i].locationId);
            distanceField[i].text = nearestList[i].distances;

            // print ("ch== ${state.nearestLocationList[i].nearestLocations}");
            //  nearestLocationModel[i] = cubit.createPropertyInfo!.nearestLocations.where((e) => e.id.toString() == state.nearestLocationList[i].nearestLocations).first;
          }
        }

        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                width: 0.5,
                color: Colors.black,
              )),
          child: Column(
            children: [
              const FormHeaderTitle(title: "Nearest Location"),
              Utils.verticalSpace(8.h),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: BlocBuilder<CreateInfoCubit, CreateInfoState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ...List.generate(
                          nearestItem,
                          (index) => Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (index != 0) ...[
                                GestureDetector(
                                  onTap: () async {
                                    if (nearestList[index].id != 0) {
                                      final result = await updateCubit
                                          .deleteSingleNearestLocation(
                                              nearestList[index].id.toString());

                                      result.fold(
                                        (failure) {
                                          Utils.errorSnackBar(
                                              context, failure.errorMessage);
                                        },
                                        (data) {
                                          Utils.showSnackBar(context, "$data");
                                          nearestList.removeAt(index);
                                          bloc.add(PropertyNearestLocationEvent(
                                              nearestLocation: nearestList));
                                        },
                                      );
                                    } else {
                                      nearestList.removeAt(index);
                                      bloc.add(PropertyNearestLocationEvent(
                                          nearestLocation: nearestList));
                                    }

                                    setState(() {});
                                  },
                                  child: const DeleteIconBtn(),
                                ),
                              ],
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<NearestLocationModel>(
                                      // itemHeight: isIpad ? selectBoxHeight :null,
                                      // isDense: !isIpad,
                                      isDense: true,
                                      isExpanded: true,
                                      value: nearestLocationModel[index],
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: borderColor,
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: borderColor),
                                        ),
                                      ),
                                      hint: const CustomTextStyle(
                                        text: 'City',
                                        fontWeight: FontWeight.w400,
                                        fontSize: textFieldSize,
                                      ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: blackColor,
                                        size: iconSize,
                                      ),
                                      items: cubit
                                          .createPropertyInfo.nearestLocations
                                          .map<DropdownMenuItem<
                                            NearestLocationModel>>(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: CustomTextStyle(
                                                text: e.location,
                                                fontSize: textFieldSize,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (val) {
                                        locationList.insert(index, val!.id);
                                        // nearestList.add(
                                        //   NearestLocationDto(
                                        //     locationId: locationList[index],
                                        //     distances:
                                        //         distanceField[index].text,
                                        //   ),
                                        // );
                                        // bloc.add(PropertyNearestLocationEvent(
                                        //     nearestLocation: nearestList));
                                      },
                                    ),
                                  ),
                                  Utils.horizontalSpace(8.w),
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'Value *',
                                      labelText: 'Value *',
                                      onChanged: (value){
                                      },
                                      controller: distanceField[index],
                                      keyboardType: TextInputType.text,
                                    ),
                                    // child: TextFormField(
                                    //   controller: distanceField[index],
                                    //   // textInputAction: TextInputAction.done,
                                    //   onChanged: (v) {
                                    //     // nearestList.add(
                                    //     //   NearestLocationDto(
                                    //     //     locationId: locationList[index],
                                    //     //     distances:
                                    //     //         distanceField[index].text,
                                    //     //   ),
                                    //     // );
                                    //     // bloc.add(PropertyNearestLocationEvent(
                                    //     //     nearestLocation: nearestList));
                                    //   },
                                    //   decoration: const InputDecoration(
                                    //       hintText: 'Value *',
                                    //       labelText: 'Value *',
                                    //       hintStyle:
                                    //           TextStyle(color: Colors.black38),
                                    //       labelStyle: TextStyle(
                                    //         color: Colors.black38,
                                    //       )),
                                    //   keyboardType: TextInputType.text,
                                    // ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Utils.verticalSpace(14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                final temp = <NearestLocationDto>[];
                                for (var i = 0; i < nearestItem; i++) {
                                  temp.add(
                                    NearestLocationDto(
                                      locationId: locationList[i],
                                      distances: distanceField[i].text,
                                    ),
                                  );
                                }
                                nearestList = temp;
                                bloc.add(PropertyNearestLocationEvent(
                                    nearestLocation: nearestList));
                                Utils.showSnackBar(context, 'Item Saved');
                                setState(() {});
                              },
                              child: const ItemSaveBtn(),
                            ),
                            GestureDetector(
                              onTap: () {
                                nearestList.add(
                                  const NearestLocationDto(
                                    id: 0,
                                    locationId: 0,
                                    distances: '',
                                  ),
                                );
                                bloc.add(PropertyNearestLocationEvent(
                                    nearestLocation: nearestList));
                                setState(() {});
                              },
                              child: const ItemAddBtn(),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
