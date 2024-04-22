import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/data/model/create_property/property_location.dart';
import 'package:real_estate/logic/cubit/maps/google_maps_cubit.dart';
import 'package:real_estate/logic/cubit/maps/google_maps_state_model.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/create_property/cities_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/error_text.dart';
import '../../../widget/form_header_title.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PropertyCreateBloc>();
    final cubit = context.read<CreateInfoCubit>();
    final googleCubit = context.read<GoogleMapsCubit>();
    CitiesModel? citiesModel;
    int id = 0;
    String address = '';
    String details = '';
    String map = '';

    return BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
      builder: (context, state) {

        if(googleCubit.isLoadMap){
          googleCubit.currentPosition(state.propertyLocationDto.latitude, state.propertyLocationDto.longitude);
        }
         
        citiesModel = cubit.createPropertyInfo.cities.first;
        if (state.propertyLocationDto.cityId != 0) {
          id = state.propertyLocationDto.cityId;
          address = state.propertyLocationDto.address;
          details = state.propertyLocationDto.addressDescription;
          // map = state.propertyLocationDto.googleMap;
       
        
          citiesModel = cubit.createPropertyInfo.cities
              .where((element) => element.id == id).first;
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
              const FormHeaderTitle(title: "Property Location"),
              Utils.verticalSpace(8.0.h),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonFormField<CitiesModel>(
                              // itemHeight: isIpad ? selectBoxHeight :null,
                              // isDense: !isIpad,
                              isDense: true,
                              value: citiesModel,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: borderColor,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: borderColor),
                                ),
                              ),
                              hint: const CustomTextStyle(
                                text: 'City',
                                fontWeight: FontWeight.w400,
                                fontSize: textFieldSize,
                              ),
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,
                                  color: blackColor),
                              items: cubit.createPropertyInfo.cities
                                  .map<DropdownMenuItem<CitiesModel>>(
                                    (e) => DropdownMenuItem(
                                  value: e,
                                  child: CustomTextStyle(
                                    text: e.name,
                                    fontSize: textFieldSize,
                                  ),
                                ),
                              ).toList(),
                              onChanged: (val) {
                                id = val!.id;
                                bloc.add(PropertyPropertyLocationEvent(
                                  propertyLocation: PropertyLocationDto(
                                    cityId: id,
                                    address: address,
                                    addressDescription: details,
                                    // googleMap: map,
                                      latitude: "",
                                      longitude: "",
                                  )));
                              },
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.cityId.isNotEmpty)
                                ErrorText(text: stateStatus.errors.cityId.first)
                            ]
                          ],
                        );
                      },
                    ),

                    Utils.verticalSpace(14.h),
                    BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Address *',
                              labelText: 'Address *',
                              initialValue: state.propertyLocationDto.address,
                              onChanged: (value) {
                                address = value;
                                bloc.add(PropertyPropertyLocationEvent(
                                  propertyLocation: PropertyLocationDto(
                                    cityId: id,
                                    address: address,
                                    addressDescription: details,
                                    // googleMap: map,
                                      latitude: "",
                                      longitude: "",
                                  )));
                              },
                              keyboardType: TextInputType.text,
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.address.isNotEmpty)
                                ErrorText(text: stateStatus.errors.address.first)
                            ]
                          ],
                        );
                      },
                    ),

                    Utils.verticalSpace(14.h),
                    BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                      builder: (context, state) {
                        final stateStatus = state.state;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: 'Details *',
                              labelText: 'Details *',
                              initialValue: state.propertyLocationDto.addressDescription,
                              onChanged: (value) {
                                details = value;
                                bloc.add(PropertyPropertyLocationEvent(
                                  propertyLocation: PropertyLocationDto(
                                    cityId: id,
                                    address: address,
                                    addressDescription: details,
                                    // googleMap: map,
                                      latitude: "",
                                      longitude: "",
                                  ))
                                );
                              },
                              keyboardType: TextInputType.text,
                            ),
                            if (stateStatus is PropertyCreateInvalidError) ...[
                              if (stateStatus.errors.addressDescription.isNotEmpty)
                                ErrorText(text: stateStatus.errors.addressDescription.first)
                            ]
                          ],
                        );
                      },
                    ),

                    // Utils.verticalSpace(14.h),
                    // BlocBuilder<PropertyCreateBloc, PropertyCreateModel>(
                    //   builder: (context, state) {
                    //     final stateStatus = state.state;
                        
                    //     return Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         CustomTextField(
                    //           hintText: 'Google Map *',
                    //           labelText: 'Google Map *',
                    //           initialValue: state.propertyLocationDto.googleMap,
                    //           onChanged: (value) {
                    //             map = value;
                    //             bloc.add(PropertyPropertyLocationEvent(
                    //                 propertyLocation: PropertyLocationDto(
                    //                   cityId: id,
                    //                   address: address,
                    //                   addressDescription: details,
                    //                   googleMap: map,
                    //                   latitude: "",
                    //                   longitude: "",
                    //                 )));
                    //           },
                    //           keyboardType: TextInputType.text,
                    //         ),
                    //         if (stateStatus is PropertyCreateInvalidError) ...[
                    //           if (stateStatus.errors.googleMap.isNotEmpty)
                    //             ErrorText(text: stateStatus.errors.googleMap.first)
                    //         ]
                    //       ],
                    //     );
                    //   },
                    // ),

                    Utils.verticalSpace(14.h),
                    BlocBuilder<GoogleMapsCubit, LatLngModel>(
                      builder: (context, state) {
                        // final stateStatus = state.state;
                        if (state.googleMapsState is GoogleMapsInitial){
                          return Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 220.h,
                            color: blackColor.withOpacity(0.7),
                            child: const CircularProgressIndicator(color: primaryColor,)
                          );
                        }else{
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h)
                            ),
                              width: double.maxFinite,
                              height: 220.h,
                              child: Stack(
                              children: [
                                GoogleMap(
                                  initialCameraPosition: googleCubit.cameraPosition!,
                                    mapType: MapType.normal,
                                    zoomControlsEnabled: false,
                                    myLocationButtonEnabled: false,
                                    onCameraMove: (cameraPosition) {
                                     
                                      // if(googleCubit.currentLat != "" && googleCubit.currentLat != ""){
                                          LatLng position = cameraPosition.target;
                                          // googleCubit.currentLat = position.latitude.toString();
                                          // googleCubit.currentLat = position.longitude.toString();
                                          bloc.add(PropertyPropertyLocationEvent(
                                            propertyLocation: PropertyLocationDto(
                                              cityId: id,
                                              address: address,
                                              addressDescription: details,
                                              // googleMap: map,
                                              // latitude: "11.5877648",
                                              // longitude: "104.8968501"
                                              latitude: position.latitude.toString(),
                                              longitude: position.longitude.toString(),
                                            ))
                                          );
                                      // }
                                    },
                                    onMapCreated: (GoogleMapController controller) {
                                      googleCubit.googleMapController = controller;
                                    },
                                    gestureRecognizers: {
                                      Factory<OneSequenceGestureRecognizer>(
                                        () => EagerGestureRecognizer(),
                                      ),
                                    },
                                  ),
                                // if(state is GoogleMapsGetPositionLoaded)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                    width: 30,
                                    height: 30,
                                    child: const Icon(Icons.location_on_sharp, color: primaryColor, size: 40,)
                                  ),
                                ),
                                if(googleCubit.isDefault == false)
                                Positioned(
                                  bottom: 7.h,
                                  right: 7.w,
                                  child: CustomButton(
                                    onTap: (){
                                      //  print("object");
                                      googleCubit.goToCurrentPosition(googleCubit.currentLat, googleCubit.currentLng);
                                      if(state is GoogleMapsGetPositionLoaded){
                                        bloc.add(PropertyPropertyLocationEvent(
                                          propertyLocation: PropertyLocationDto(
                                            cityId: id,
                                            address: address,
                                            addressDescription: details,
                                            // googleMap: map,
                                            latitude: googleCubit.currentLat,
                                            longitude: googleCubit.currentLat,
                                            // latitude: "11.5877648",
                                            // longitude: "104.8968501"
                                          )
                                        ),
                                      );
                                    }
                                  },
                                    icon: Icons.location_searching_rounded,
                                    iconColor: secondaryColor,
                                  )
                                ),
                                if(state.googleMapsState is GoogleMapsLoading)
                                Positioned(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: 220.h,
                                    color: blackColor.withOpacity(0.7),
                                    child: const CircularProgressIndicator(color: primaryColor,)
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        // else{
                        //   return Container(
                        //       child: CustomTextStyle(
                        //         text: "User Did allow location",
                        //       ),
                        //   );
                        // }
                        
                        // return Column(
                        //   mainAxisSize: MainAxisSize.min,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                            
                        //     // if (stateStatus is PropertyCreateInvalidError) ...[
                        //     //   if (stateStatus.errors.latitude.isNotEmpty)
                        //     //     ErrorText(text: stateStatus.errors.latitude.first)
                        //     // ]
                        //   ],
                        // );
                      },
                    ),
                    if(googleCubit.smsUserDeniedPermission != "")
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: CustomTextStyle(text: googleCubit.smsUserDeniedPermission, color: redColor, fontSize: detailFontSize -1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}