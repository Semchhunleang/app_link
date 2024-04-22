import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/logic/cubit/maps/google_maps_cubit.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../utils/utils.dart';
import '../../widget/create_update_button.dart';
import '../../widget/error_text.dart';
import 'component/additional_widget.dart';
import 'component/aminities_widget.dart';
import 'component/category_and_period.dart';
import 'component/location_widget.dart';
import 'component/nearest_widget.dart';
import 'component/plan_widget.dart';
import 'component/property_image_section.dart';


class UpdateScreen extends StatefulWidget {
  final int id;
  const UpdateScreen({super.key, required this.id});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    final googleMapsCubit = context.read<GoogleMapsCubit>();
    googleMapsCubit.permissionGoogleMaps();
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(
        title: 'Update Property',
        bgColor: whiteColor,
      ),
      body: BlocConsumer<PropertyCreateBloc, PropertyCreateModel>(
        listener: (context, listenState) {
          final listenStatus = listenState.state;
          if (listenStatus is PropertyUpdateLoading) {
            Utils.loadingDialog(context);
          }
          else {
            Utils.closeDialog(context);
            if (listenStatus is PropertyUpdateSuccess) {
              Utils.showSnackBar(context, listenStatus.message);
              Navigator.pop(context);
            }
            if (listenStatus is PropertyUpdateError) {
              Utils.errorSnackBar(context, listenStatus.errorMsg);
            }
          }
        },
        builder: (context, state) {
          return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
            builder: (context, state) {
              final stateStatus = state.state;
                if(stateStatus is PropertyGetDataUpdateLoading){
                  return const Center(child: CircularProgressIndicator(color: primaryColor,));
                }
              // if (stateStatus is PropertyEditInfoData) {
                return const LoadedWidget();
              // }
              // else if(stateStatus is PropertyGetDataUpdateLoading){
              //   print("update --------------");
              //   return const Center(child: CircularProgressIndicator(color: primaryColor,));
              // }
              // return const Center(
              //   child: Text("Something went wrong!")
              //   );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
        builder: (context, state) {
          return CreateUpdateSubmitButton(
            title: 'Update Now',
            press: () {
              bloc.add(SubmitUpdateProperty(propertyId: widget.id.toString()));
            });
        },
      ),
    );
  }
}

class LoadedWidget extends StatefulWidget {
  const LoadedWidget({Key? key}) : super(key: key);

  @override
  State<LoadedWidget> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<LoadedWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    final defaultVerticalSpace = Utils.verticalSpace(16);

    return Form(
      key: bloc.createForm,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        shrinkWrap: true,
        children: [
          defaultVerticalSpace,
          const CustomTextStyle(
            text: 'Property Information',
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: titleFontSize,
          ),
          defaultVerticalSpace,
          const PropertyTypeWidget(),
          defaultVerticalSpace,
          const RentPeriodWidget(),
          defaultVerticalSpace,
          // const UpdatePurposeSection(),
          //defaultVerticalSpace,
          BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
            // buildWhen: (previous, current) =>
            //     previous.title != current.title,
            builder: (context, state) {
              final stateStatus = state.state;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    onChanged: (value)=> bloc.add(PropertyTitleEvent(title: value)),
                    hintText: 'Title *',
                    labelText: 'Title *',
                    initialValue: state.title,
                    keyboardType: TextInputType.text,
                  ),
                  if (stateStatus is PropertyUpdateInvalidError) ...[
                    if (stateStatus.errors.title.isNotEmpty)
                      ErrorText(text: stateStatus.errors.title.first)
                  ]
                ],
              );
            },
          ),
          // defaultVerticalSpace,
          // BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
          //   // buildWhen: (previous, current) => previous.slug != current.slug,
          //   builder: (context, state) {
          //     final stateStatus = state.state;
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         CustomTextField(
          //           onChanged: (value) =>bloc.add(PropertySlugEvent(slug: value)),
          //           hintText: 'Slug *',
          //           labelText: 'Slug *',
          //           initialValue: state.slug,
          //           keyboardType: TextInputType.text,
          //         ),
          //         if (stateStatus is PropertyUpdateInvalidError) ...[
          //           if (stateStatus.errors.slug.isNotEmpty)
          //             ErrorText(text: stateStatus.errors.slug.first)
          //         ]
          //       ],
          //     );
          //   },
          // ),
          defaultVerticalSpace,
          Row(
            children: [
              Expanded(
                child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                  // buildWhen: (previous, current) =>
                  //     previous.price != current.price,
                  builder: (context, state) {
                    return CustomTextField(
                      onChanged: (value) =>bloc.add(PropertyPriceEvent(price: value)),
                      hintText: 'Total Price *',
                      labelText: 'Total Price *',
                      initialValue: state.price.toString(),
                      keyboardType: TextInputType.number,
                    );
                  },
                ),
              ),
              Utils.horizontalSpace(8),
              Expanded(
                child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                  builder: (context, state) {
                    return CustomTextField(
                      onChanged: (value) =>bloc.add(PropertyTotalAreaEvent(totalArea: value)),
                      hintText: 'Total Area *',
                      labelText: 'Total Area *',
                      initialValue: state.totalArea,
                      keyboardType: TextInputType.text,
                    );
                  },
                ),
              ),
            ],
          ),
          defaultVerticalSpace,
          Row(
            children: [
              Expanded(
                child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                  builder: (context, state) {
                    return CustomTextField(
                      onChanged: (value) =>bloc.add(PropertyTotalUnitEvent(totalUnit: value)),
                      hintText: 'Total Unit *',
                      labelText: 'Total Unit *',
                      initialValue: state.totalUnit,
                      keyboardType: TextInputType.text,
                    );
                    // TextFormField(
                    //   initialValue: state.totalUnit,
                    //   onChanged: (value) =>
                    //       bloc.add(PropertyTotalUnitEvent(totalUnit: value)),
                    //   decoration: const InputDecoration(
                    //       hintText: 'Total Unit *',
                    //       labelText: 'Total Unit *',
                    //       hintStyle: TextStyle(color: Colors.black38),
                    //       labelStyle: TextStyle(
                    //         color: Colors.black38,
                    //       )),
                    //   keyboardType: TextInputType.text,
                    // );
                  },
                ),
              ),
              Utils.horizontalSpace(8),
              Expanded(
                child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                  builder: (context, state) {
                    return CustomTextField(
                      onChanged: (value) =>bloc.add(PropertyTotalBedroomEvent(totalBedroom: value)),
                      hintText: 'Total Bedroom *',
                      labelText: 'Total Bedroom *',
                      initialValue: state.totalBedroom,
                      keyboardType: TextInputType.text,
                    );
                  },
                ),
              ),
            ],
          ),
          defaultVerticalSpace,
          Row(
            children: [
              Expanded(
                child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                  builder: (context, state) {
                    return CustomTextField(
                      onChanged: (value) =>bloc.add(PropertyTotalGarageEvent(totalGarage: value)),
                      hintText: 'Total Garage *',
                      labelText: 'Total Garage *',
                      initialValue: state.totalGarage,
                      keyboardType: TextInputType.text,
                    );
                  },
                ),
              ),
              Utils.horizontalSpace(8),
              Expanded(
                child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                  builder: (context, state) {
                    return CustomTextField(
                      onChanged: (value) =>bloc.add(PropertyTotalBathroomEvent(totalBathroom: value)),
                      hintText: 'Total Bathroom *',
                      labelText: 'Total Bathroom *',
                      initialValue: state.totalBathroom,
                      keyboardType: TextInputType.text,
                    );
                  },
                ),
              ),
            ],
          ),
          defaultVerticalSpace,
          BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
            builder: (context, state) {
              return CustomTextField(
                onChanged: (value) => bloc.add(PropertyTotalKitchenEvent(totalKitchen: value)),
                hintText: 'Total Kitchen *',
                labelText: 'Total Kitchen *',
                initialValue: state.totalKitchen,
                keyboardType: TextInputType.text,
              );
            },
          ),
          defaultVerticalSpace,
          BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
            builder: (context, state) {
              return CustomTextField(
                onChanged: (value) => bloc.add(PropertyDescriptionEvent(description: value)),
                hintText: 'Description',
                labelText: "Description",
                initialValue: state.description,
                keyboardType: TextInputType.text,
                maxLines: 5,
              );
              
              // TextFormField(
              //   initialValue: state.description,
              //   onChanged: (value) =>
              //       bloc.add(PropertyDescriptionEvent(description: value)),
              //   decoration: const InputDecoration(
              //     hintText: 'Description',
              //   ),
              //   keyboardType: TextInputType.text,
              //   maxLines: 5,
              // );
            },
          ),
          defaultVerticalSpace,
          const PropertyImageSection(),
          // defaultVerticalSpace,
          // const PropertyVideoWidget(),
          defaultVerticalSpace,
          const LocationWidget(),
          defaultVerticalSpace,
          const AminitiesWidget(),
          defaultVerticalSpace,
          const NearestWidget(),
          defaultVerticalSpace,
          const AdditionalWidget(),
          defaultVerticalSpace,
          const PlanWidget(),
          // defaultVerticalSpace,
          // const SeoWidget(),
          Utils.verticalSpace(50),
        ],
      ),
    );
  }
}


// class UpdateScreen extends StatefulWidget {
//   const UpdateScreen({Key? key, required this.id}) : super(key: key);
//   final int id;

//   @override
//   State<UpdateScreen> createState() => _AddNewPropertyScreenState();
// }

// class _AddNewPropertyScreenState extends State<UpdateScreen> {


//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   context.read<PropertyCreateBloc>().add(PropertyStateReset());
//   // }
//   //
//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   context.read<PropertyCreateBloc>().add(PropertyStateReset());
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<PropertyCreateBloc>();
//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: const CustomAppBar(
//         title: 'Update Property',
//         bgColor: whiteColor,
//       ),
//       body: BlocConsumer<PropertyCreateBloc, PropertyCreateModel>(
//         listener: (context, listenState) {
//           final listenStatus = listenState.state;
//           if (listenStatus is PropertyUpdateLoading) {
//             Utils.loadingDialog(context);
//           }
//           else {
//             Utils.closeDialog(context);
//             if (listenStatus is PropertyUpdateSuccess) {
//               Utils.showSnackBar(context, listenStatus.message);
//               Navigator.pop(context);
//             }
//             if (listenStatus is PropertyUpdateError) {
//               Utils.errorSnackBar(context, listenStatus.errorMsg);
//             }
//           }
//         },
//         builder: (context, state) {
//           return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//             builder: (context, state) {
//               final stateStatus = state.state;
//                 if(stateStatus is PropertyGetDataUpdateLoading){
//                   return const Center(child: CircularProgressIndicator(color: primaryColor,));
//                 }
//               // if (stateStatus is PropertyEditInfoData) {
//                 return const LoadedWidget();
//               // }
//               // else if(stateStatus is PropertyGetDataUpdateLoading){
//               //   print("update --------------");
//               //   return const Center(child: CircularProgressIndicator(color: primaryColor,));
//               // }
//               // return const Center(
//               //   child: Text("Something went wrong!")
//               //   );
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//         builder: (context, state) {
//           return CreateUpdateSubmitButton(
//             title: 'Update Now',
//             press: () {
//               bloc.add(SubmitUpdateProperty(propertyId: widget.id.toString()));
//             });
//         },
//       ),
//     );
//   }
// }

// class LoadedWidget extends StatefulWidget {
//   const LoadedWidget({Key? key}) : super(key: key);

//   @override
//   State<LoadedWidget> createState() => _LoadedWidgetState();
// }

// class _LoadedWidgetState extends State<LoadedWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<PropertyCreateBloc>();
//     final defaultVerticalSpace = Utils.verticalSpace(16);

//     return Form(
//       key: bloc.createForm,
//       child: ListView(
//         physics: const BouncingScrollPhysics(),
//         padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
//         shrinkWrap: true,
//         children: [
//           defaultVerticalSpace,
//           const CustomTextStyle(
//             text: 'Property Information',
//             color: primaryColor,
//             fontWeight: FontWeight.w500,
//             fontSize: titleFontSize,
//           ),
//           defaultVerticalSpace,
//           const PropertyTypeWidget(),
//           defaultVerticalSpace,
//           const RentPeriodWidget(),
//           defaultVerticalSpace,
//           // const UpdatePurposeSection(),
//           //defaultVerticalSpace,
//           BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//             // buildWhen: (previous, current) =>
//             //     previous.title != current.title,
//             builder: (context, state) {
//               final stateStatus = state.state;
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomTextField(
//                     onChanged: (value)=> bloc.add(PropertyTitleEvent(title: value)),
//                     hintText: 'Title *',
//                     labelText: 'Title *',
//                     initialValue: state.title,
//                     keyboardType: TextInputType.text,
//                   ),
//                   if (stateStatus is PropertyUpdateInvalidError) ...[
//                     if (stateStatus.errors.title.isNotEmpty)
//                       ErrorText(text: stateStatus.errors.title.first)
//                   ]
//                 ],
//               );
//             },
//           ),
//           // defaultVerticalSpace,
//           // BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//           //   // buildWhen: (previous, current) => previous.slug != current.slug,
//           //   builder: (context, state) {
//           //     final stateStatus = state.state;
//           //     return Column(
//           //       mainAxisSize: MainAxisSize.min,
//           //       crossAxisAlignment: CrossAxisAlignment.start,
//           //       children: [
//           //         CustomTextField(
//           //           onChanged: (value) =>bloc.add(PropertySlugEvent(slug: value)),
//           //           hintText: 'Slug *',
//           //           labelText: 'Slug *',
//           //           initialValue: state.slug,
//           //           keyboardType: TextInputType.text,
//           //         ),
//           //         if (stateStatus is PropertyUpdateInvalidError) ...[
//           //           if (stateStatus.errors.slug.isNotEmpty)
//           //             ErrorText(text: stateStatus.errors.slug.first)
//           //         ]
//           //       ],
//           //     );
//           //   },
//           // ),
//           defaultVerticalSpace,
//           Row(
//             children: [
//               Expanded(
//                 child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                   // buildWhen: (previous, current) =>
//                   //     previous.price != current.price,
//                   builder: (context, state) {
//                     return CustomTextField(
//                       onChanged: (value) =>bloc.add(PropertyPriceEvent(price: value)),
//                       hintText: 'Total Price *',
//                       labelText: 'Total Price *',
//                       initialValue: state.price.toString(),
//                       keyboardType: TextInputType.number,
//                     );
//                   },
//                 ),
//               ),
//               Utils.horizontalSpace(8),
//               Expanded(
//                 child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                   builder: (context, state) {
//                     return CustomTextField(
//                       onChanged: (value) =>bloc.add(PropertyTotalAreaEvent(totalArea: value)),
//                       hintText: 'Total Area *',
//                       labelText: 'Total Area *',
//                       initialValue: state.totalArea,
//                       keyboardType: TextInputType.text,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           defaultVerticalSpace,
//           Row(
//             children: [
//               Expanded(
//                 child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                   builder: (context, state) {
//                     return CustomTextField(
//                       onChanged: (value) =>bloc.add(PropertyTotalUnitEvent(totalUnit: value)),
//                       hintText: 'Total Unit *',
//                       labelText: 'Total Unit *',
//                       initialValue: state.totalUnit,
//                       keyboardType: TextInputType.text,
//                     );
//                     // TextFormField(
//                     //   initialValue: state.totalUnit,
//                     //   onChanged: (value) =>
//                     //       bloc.add(PropertyTotalUnitEvent(totalUnit: value)),
//                     //   decoration: const InputDecoration(
//                     //       hintText: 'Total Unit *',
//                     //       labelText: 'Total Unit *',
//                     //       hintStyle: TextStyle(color: Colors.black38),
//                     //       labelStyle: TextStyle(
//                     //         color: Colors.black38,
//                     //       )),
//                     //   keyboardType: TextInputType.text,
//                     // );
//                   },
//                 ),
//               ),
//               Utils.horizontalSpace(8),
//               Expanded(
//                 child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                   builder: (context, state) {
//                     return CustomTextField(
//                       onChanged: (value) =>bloc.add(PropertyTotalBedroomEvent(totalBedroom: value)),
//                       hintText: 'Total Bedroom *',
//                       labelText: 'Total Bedroom *',
//                       initialValue: state.totalBedroom,
//                       keyboardType: TextInputType.text,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           defaultVerticalSpace,
//           Row(
//             children: [
//               Expanded(
//                 child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                   builder: (context, state) {
//                     return CustomTextField(
//                       onChanged: (value) =>bloc.add(PropertyTotalGarageEvent(totalGarage: value)),
//                       hintText: 'Total Garage *',
//                       labelText: 'Total Garage *',
//                       initialValue: state.totalGarage,
//                       keyboardType: TextInputType.text,
//                     );
//                   },
//                 ),
//               ),
//               Utils.horizontalSpace(8),
//               Expanded(
//                 child: BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//                   builder: (context, state) {
//                     return CustomTextField(
//                       onChanged: (value) =>bloc.add(PropertyTotalBathroomEvent(totalBathroom: value)),
//                       hintText: 'Total Bathroom *',
//                       labelText: 'Total Bathroom *',
//                       initialValue: state.totalBathroom,
//                       keyboardType: TextInputType.text,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           defaultVerticalSpace,
//           BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//             builder: (context, state) {
//               return CustomTextField(
//                 onChanged: (value) => bloc.add(PropertyTotalKitchenEvent(totalKitchen: value)),
//                 hintText: 'Total Kitchen *',
//                 labelText: 'Total Kitchen *',
//                 initialValue: state.totalKitchen,
//                 keyboardType: TextInputType.text,
//               );
//             },
//           ),
//           defaultVerticalSpace,
//           BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
//             builder: (context, state) {
//               return CustomTextField(
//                 onChanged: (value) => bloc.add(PropertyDescriptionEvent(description: value)),
//                 hintText: 'Description',
//                 initialValue: state.description,
//                 keyboardType: TextInputType.text,
//                 maxLines: 5,
//               );
              
//               // TextFormField(
//               //   initialValue: state.description,
//               //   onChanged: (value) =>
//               //       bloc.add(PropertyDescriptionEvent(description: value)),
//               //   decoration: const InputDecoration(
//               //     hintText: 'Description',
//               //   ),
//               //   keyboardType: TextInputType.text,
//               //   maxLines: 5,
//               // );
//             },
//           ),
//           defaultVerticalSpace,
//           const PropertyImageSection(),
//           // defaultVerticalSpace,
//           // const PropertyVideoWidget(),
//           defaultVerticalSpace,
//           const LocationWidget(),
//           defaultVerticalSpace,
//           const AminitiesWidget(),
//           defaultVerticalSpace,
//           const NearestWidget(),
//           defaultVerticalSpace,
//           const AdditionalWidget(),
//           defaultVerticalSpace,
//           const PlanWidget(),
//           // defaultVerticalSpace,
//           // const SeoWidget(),
//           Utils.verticalSpace(50),
//         ],
//       ),
//     );
//   }
// }
