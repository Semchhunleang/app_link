import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/category/property_category_model.dart';
import '../../../core/dummy_text.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/error_text.dart';

class PropertyTypeWidget extends StatelessWidget {
  const PropertyTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateInfoCubit>();
    final bloc = context.read<PropertyCreateBloc>();
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        PropertyCategory categoryModel =
            cubit.createPropertyInfo.types.first;
            print("object================================");
            print(state.typeId);
        if (state.typeId.isNotEmpty) {
          categoryModel = cubit.createPropertyInfo
              .types
              .where((element) => element.id.toString() == state.typeId)
              .first;
          // categoryModel = cubit.createPropertyInfo.types.where((element) => element.id.toString() == state.typeId).first;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // heading('Select Category'),
            BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
              builder: (context, state) {
                final stateStatus = state.state;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<PropertyCategory>(
                      // itemHeight: isIpad ? selectBoxHeight :null,
                      // isDense: !isIpad,
                      isExpanded: true,
                      isDense: true,
                      value: state.typeId != "" ?categoryModel : null,
                      decoration: const InputDecoration(
                        filled: true,
                        // fillColor: redColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                      hint: const CustomTextStyle(
                        text: 'Select Category',
                        fontWeight: FontWeight.w400,
                        fontSize: textFieldSize,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down_sharp,
                          color: blackColor),
                      items: cubit.createPropertyInfo.types
                          .map<DropdownMenuItem<PropertyCategory>>(
                            (e) => DropdownMenuItem(
                          value: e,
                          child: CustomTextStyle(
                            text: e.name,
                            fontSize: textFieldSize,
                          ),
                        ),
                      ).toList(),
                      onChanged: (val) {
                        bloc.add(PropertyTypeEvent(type: val!.id.toString()));
                      },
                    ),
                    if (stateStatus is PropertyCreateInvalidError) ...[
                      if (stateStatus.errors.propertytypeId.isNotEmpty)
                        ErrorText(text: stateStatus.errors.propertytypeId.first)
                    ]
                  ],
                );
              },
            ),

            // InkWell(
            //   onTap: (){
            //     bloc.getCurrentLocation();
            //   },
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     color: primaryColor,
            //   ),
            // ),
            // BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
            //   builder: (context, state) {
            //     var status = state.state;
            //     return Column(
            //       children: [
            //         Container(
            //           width: 50,
            //           height: 70,
            //           color: blackColor,
            //         ),
            //         if(status is PropertyLatLng)
            //         Text("${status.latitude}")
            //       ],
            //     );
            //   },
            // ),
          ],
        );
      },
    );
  }
}

class RentPeriodWidget extends StatelessWidget {
  const RentPeriodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {
        String value = rendPeriodList.first;
        if (state.rentPeriod.isNotEmpty) {
          value = rendPeriodList.where((element) => element.toLowerCase() == state.rentPeriod).first;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // heading('Select Category'),
            DropdownButtonFormField<String>(
              // itemHeight: isIpad ? selectBoxHeight :null,
              // isDense: !isIpad,
              isDense: true,
              isExpanded: true,
              decoration: const InputDecoration(
                filled: true,
                // fillColor: borderColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
              ),
              value: value,
              hint: const CustomTextStyle(
                text: 'Rent',
                fontWeight: FontWeight.w400,
                fontSize: textFieldSize,
              ),
              icon: const Icon(Icons.keyboard_arrow_down_sharp,
                  color: blackColor),
              items: rendPeriodList
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: CustomTextStyle(
                        text: e,
                        fontSize: textFieldSize,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                bloc.add(PropertyRentPeriodEvent(rentPeriod: val!.toLowerCase()));
              },
            ),
          ],
        );
      },
    );
  }
}
