import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/create_property/data_success_create_property.dart';
import '/logic/bloc/login/login_bloc.dart';
import '/presentation/error/failure.dart';
import '../../../../data/model/auth/auth_error_model.dart';
import '../../../../data/model/create_property/additional_info_dto.dart';
import '../../../../data/model/create_property/edit_info/edit_info_model.dart';
import '../../../../data/model/create_property/nearest_location_dto.dart';
import '../../../../data/model/create_property/property_images_dto.dart';
import '../../../../data/model/create_property/property_location.dart';
import '../../../../data/model/create_property/property_plan_dto.dart';
import '../../../repository/property_repository.dart';

part 'property_create_event.dart';
part 'property_create_state.dart';

class PropertyCreateBloc
    extends Bloc<PropertyCreateEvent, PropertyCreateModel> {
  final PropertyRepository _repository;
  final LoginBloc _loginBloc;
  PropertyImageDto? propertyImageDto;
  // PropertyVideoDto? propertyVideoDto;
  PropertyLocationDto? propertyLocationDto;
  List<PropertyPlanDto> propertyPlanList = [];
  List<NearestLocationDto> nearestLocationList = [];
  List<AdditionalInfoDto> additionalItemList = [];
  final createForm = GlobalKey<FormState>();

  PropertyCreateBloc(PropertyRepository repository, LoginBloc loginBloc)
      : _repository = repository,
        _loginBloc = loginBloc,
        super(const PropertyCreateModel()) {
    on<PropertyPurposeEvent>((event, emit) {
      emit(state.copyWith(purpose: event.purpose));
    });
    on<PropertyTitleEvent>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    //  on<PropertySlugEvent>((event, emit) {
    //    emit(state.copyWith(slug: event.slug));
    //  });

    on<PropertyTypeEvent>((event, emit) {
      emit(state.copyWith(typeId: event.type));
    });

    on<PropertyRentPeriodEvent>((event, emit) {
      emit(state.copyWith(rentPeriod: event.rentPeriod));
    });
    on<PropertyPriceEvent>((event, emit) {
      emit(state.copyWith(price: event.price));
    });
    on<PropertyTotalAreaEvent>((event, emit) {
      emit(state.copyWith(totalArea: event.totalArea));
    });
    on<PropertyTotalUnitEvent>((event, emit) {
      emit(state.copyWith(totalUnit: event.totalUnit));
    });
    on<PropertyTotalBedroomEvent>((event, emit) {
      emit(state.copyWith(totalBedroom: event.totalBedroom));
    });
    on<PropertyTotalBathroomEvent>((event, emit) {
      emit(state.copyWith(totalBathroom: event.totalBathroom));
    });
    on<PropertyTotalGarageEvent>((event, emit) {
      emit(state.copyWith(totalGarage: event.totalGarage));
    });
    on<PropertyTotalKitchenEvent>((event, emit) {
      emit(state.copyWith(totalKitchen: event.totalKitchen));
    });
    on<PropertyDescriptionEvent>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
    on<PropertyPropertyImageEvent>((event, emit) {
      emit(state.copyWith(propertyImageDto: event.propertyImage));
    });
    // on<PropertyPropertyVideoEvent>((event, emit) {
    //   emit(state.copyWith(propertyVideoDto: event.propertyVideo));
    // });
    on<PropertyPropertyLocationEvent>((event, emit) {
      emit(state.copyWith(propertyLocationDto: event.propertyLocation));
    });

    on<PropertyPropertyAminitiesEvent>((event, emit) {
      emit(state.copyWith(aminities: event.propertyAminities));
    });

    on<PropertyNearestLocationEvent>((event, emit) {
      emit(state.copyWith(nearestLocationList: event.nearestLocation));
    });

    on<PropertyAdditionalInfoEvent>((event, emit) {
      emit(state.copyWith(addtionalInfoList: event.additionalInfo));
    });

    on<PropertyPropertyPlanEvent>((event, emit) {
      emit(state.copyWith(propertyPlanDto: event.propertyPlan));
    });

    // on<PropertySeoTitleEvent>((event, emit) {
    //   emit(state.copyWith(seoTitle: event.seoTitle));
    // });
    // on<PropertySeoMetaDescriptionEvent>((event, emit) {
    //   emit(state.copyWith(seoMetaDescription: event.seoMetaDescription));
    // });
    on<SubmitCreateProperty>(_submitRequestToCreateProperty);
    on<SubmitUpdateProperty>(_submitRequestToUpdateProperty);
    on<PropertyEditInfoEvent>(_getPropertyEditInfo);
    on<PropertyStateReset>(_resetState);
  }

  FutureOr<void> _submitRequestToCreateProperty(
      SubmitCreateProperty event, Emitter<PropertyCreateModel> emit) async {
    debugPrint("Create =====================1");

    log("Bloc", name: "${state.toMap()}");

    emit(state.copyWith(state: const PropertyCreateLoading()));
    debugPrint("Create =====================2");

    try {
      final result = await _repository.createProperty(
          state, _loginBloc.userInfo!.tokenModel.accessToken);
      debugPrint("Create ===================== result : $result");

      // print(result);
      result.fold(
        (failure) {
          debugPrint("Create ===================== failure : $failure");

          if (failure is InvalidAuthData) {
            final errorState = PropertyCreateInvalidError(failure.errors);
            emit(state.copyWith(state: errorState));
          } else {
            emit(state.copyWith(state: PropertyCreateError(failure.message)));
          }
        },
        (successData) {
          debugPrint('-------------- get property success : ${successData.id}');
          emit(state.copyWith(state: PropertyCreateSuccess(successData)));
          print('clearAll');
          //emit(state.copyWith(image: ''));
        },
      );
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _getPropertyEditInfo(
      PropertyEditInfoEvent event, Emitter<PropertyCreateModel> emit) async {
    emit(state.copyWith(state: const PropertyGetDataUpdateLoading()));
    final result = await _repository.getPropertyEditInfo(
        event.propertyId, _loginBloc.userInfo!.tokenModel.accessToken);
    result.fold(
      (failure) {
        emit(state.copyWith(state: PropertyCreateError(failure.message)));
      },
      (data) {
        final amenities = <int>[];
        for (var i = 0; i < data.existingAminities.length; i++) {
          data.aminities.map((e) {
            if (e.id == data.existingAminities[i].aminityId) {
              amenities.add(e.id);
            }
          }).toList();
        }

        nearestLocationList.clear();
        for (var i = 0; i < data.existingNearest.length; i++) {
          nearestLocationList.add(NearestLocationDto(
              id: data.existingNearest[i].id,
              locationId: data.existingNearest[i].nearestLocationId,
              distances: data.existingNearest[i].distance));
        }

        additionalItemList.clear();
        for (var i = 0; i < data.existingAddInfo.length; i++) {
          additionalItemList.add(AdditionalInfoDto(
              id: data.existingAddInfo[i].id,
              addKeys: data.existingAddInfo[i].addKey,
              addValues: data.existingAddInfo[i].addValue));
        }

        propertyPlanList.clear();
        for (var i = 0; i < data.existingPlan.length; i++) {
          print("image plan ==================");
          print(data.existingPlan[i].image);
          propertyPlanList.add(PropertyPlanDto(
              id: data.existingPlan[i].id,
              planImages: data.existingPlan[i].image,
              planTitles: data.existingPlan[i].title,
              planDescriptions: data.existingPlan[i].description));
        }
        print("image plan ==================");
        print(propertyPlanList);

        emit(state.copyWith(
            title: data.property.title,
            //  slug: data.property.slug,
            purpose: data.property.purpose,
            typeId: data.property.propertyTypeId.toString(),
            rentPeriod: data.property.rentPeriod,
            price: data.property.price.toString(),
            totalArea: data.property.totalArea.toString(),
            totalUnit: data.property.totalUnit.toString(),
            totalBedroom: data.property.totalBedroom.toString(),
            totalBathroom: data.property.totalBathroom.toString(),
            totalGarage: data.property.totalGarage.toString(),
            totalKitchen: data.property.totalKitchen.toString(),
            description: data.property.description,
            status: data.property.status,
            propertyImageDto: PropertyImageDto(
                thumbnailImage: data.property.thumbnailImage,
                isExistingThumb: true,
                sliderImages: data.existingSliders),
            // propertyVideoDto: PropertyVideoDto(
            //   videoThumbnail: data.property.videoThumbnail,
            //   videoId: data.property.videoId,
            //   videoDescription: data.property.videoDescription),
            propertyLocationDto: PropertyLocationDto(
              cityId: data.property.cityId,
              address: data.property.address,
              addressDescription: data.property.addressDescription,
              // googleMap: data.property.googleMap,
              latitude: data.property.latitude,
              longitude: data.property.longitude,
            ),
            aminities: amenities,
            nearestLocationList: nearestLocationList,
            addtionalInfoList: additionalItemList,
            propertyPlanDto: propertyPlanList,
            state: PropertyEditInfoData(data)));

        // emit(state.copyWith(slug: data.property.slug));
        // emit(state.copyWith(purpose: data.property.purpose));
        // emit(state.copyWith(typeId: data.property.propertyTypeId.toString()));
        // emit(state.copyWith(rentPeriod: data.property.rentPeriod));
        // emit(state.copyWith(price: data.property.price.toString()));
        // emit(state.copyWith(totalArea: data.property.totalArea.toString()));
        // emit(state.copyWith(totalUnit: data.property.totalUnit.toString()));
        // emit(state.copyWith(
        //     totalBedroom: data.property.totalBedroom.toString()));
        // emit(state.copyWith(
        //     totalBathroom: data.property.totalBathroom.toString()));
        // emit(state.copyWith(totalGarage: data.property.totalGarage.toString()));
        // emit(state.copyWith(
        //     totalKitchen: data.property.totalKitchen.toString()));
        // emit(state.copyWith(description: data.property.description));
        // emit(state.copyWith(status: data.property.status));
        // //placing thumbnail & sliders image in the state
        // emit(state.copyWith(
        //     propertyImageDto: PropertyImageDto(
        //         thumbnailImage: data.property.thumbnailImage,
        //         isExistingThumb: true,
        //         sliderImages: data.existingSliders)));

        // //placing video property in the state
        // emit(state.copyWith(
        //     propertyVideoDto: PropertyVideoDto(
        //         videoThumbnail: data.property.videoThumbnail,
        //         videoId: data.property.videoId,
        //         videoDescription: data.property.videoDescription)));

        // //placing location in the state
        // emit(state.copyWith(
        //   propertyLocationDto: PropertyLocationDto(
        //       cityId: data.property.cityId,
        //       address: data.property.address,
        //       addressDescription: data.property.addressDescription,
        //       googleMap: data.property.googleMap,
        //       latitude: data.property.latitude,
        //       longitude: data.property.longitude
        //     ),
        // ));

        ////placing amenities in the state
        // final amenities = <int>[];
        // for (var i = 0; i < data.existingAminities.length; i++) {
        //   data.aminities.map((e) {
        //     if (e.id == data.existingAminities[i].aminityId) {
        //       amenities.add(e.id);
        //     }
        //   }).toList();
        // }
        // emit(state.copyWith(aminities: amenities));

        ////placing nearest locations image in the state
        // nearestLocationList.clear();
        // for (var i = 0; i < data.existingNearest.length; i++) {
        //   nearestLocationList.add(NearestLocationDto(
        //       id: data.existingNearest[i].id,
        //       locationId: data.existingNearest[i].nearestLocationId,
        //       distances: data.existingNearest[i].distance));
        // }
        // emit(state.copyWith(nearestLocationList: nearestLocationList));

        // //placing additional information in the state
        // additionalItemList.clear();
        // for (var i = 0; i < data.existingAddInfo.length; i++) {
        //   additionalItemList.add(AdditionalInfoDto(
        //       id: data.existingAddInfo[i].id,
        //       addKeys: data.existingAddInfo[i].addKey,
        //       addValues: data.existingAddInfo[i].addValue));
        // }
        // emit(state.copyWith(addtionalInfoList: additionalItemList));

        //placing property plan in the state
        // propertyPlanList.clear();
        // for (var i = 0; i < data.existingPlan.length; i++) {
        //   propertyPlanList.add(PropertyPlanDto(
        //       id: data.existingPlan[i].id,
        //       planImages: data.existingPlan[i].image,
        //       planTitles: data.existingPlan[i].title,
        //       planDescriptions: data.existingPlan[i].description));
        // }
        // emit(state.copyWith(propertyPlanDto: propertyPlanList));
        // emit(state.copyWith(seoTitle: data.property.seoTitle));
        // emit(state.copyWith(seoMetaDescription: data.property.seoMetaDescription));
        // emit(state.copyWith(state: PropertyEditInfoData(data)));
      },
    );
  }

  FutureOr<void> _submitRequestToUpdateProperty(
      SubmitUpdateProperty event, Emitter<PropertyCreateModel> emit) async {
    emit(state.copyWith(state: const PropertyUpdateLoading()));

    final result = await _repository.updateProperty(
        event.propertyId, state, _loginBloc.userInfo!.tokenModel.accessToken);
    print("PropertyUpdateSuccess==================");
    print(state.propertyPlanDto);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errorState = PropertyUpdateInvalidError(failure.errors);
          emit(state.copyWith(state: errorState));
        } else {
          emit(state.copyWith(state: PropertyUpdateError(failure.message)));
        }
      },
      (successData) {
        print("PropertyUpdateSuccess==================");
        emit(
            state.copyWith(state: PropertyUpdateSuccess(message: successData)));
        print('Status $successData');
        //emit(state.copyWith(image: ''));
      },
    );
  }

  FutureOr<void> _resetState(
      PropertyStateReset event, Emitter<PropertyCreateModel?> emit) {
    PropertyCreateModel? empty = const PropertyCreateModel(
      state: PropertyCreateInitial(),
    );

    emit(empty);

    // emit(state.copyWith(slug: ''));
    // emit(state.copyWith(typeId: ''));
    // emit(state.copyWith(rentPeriod: ''));
    // emit(state.copyWith(price: ''));
    // emit(state.copyWith(totalArea: ''));
    // emit(state.copyWith(totalUnit: ''));
    // emit(state.copyWith(totalBedroom: ''));
    // emit(state.copyWith(totalBathroom: ''));
    // emit(state.copyWith(totalGarage: ''));
    // emit(state.copyWith(totalKitchen: ''));
    // emit(state.copyWith(description: ''));

    // emit(state.copyWith(
    //     propertyImageDto:
    //         const PropertyImageDto(thumbnailImage: '', sliderImages: [])));

    // //placing video property in the state
    // emit(state.copyWith(
    //     propertyVideoDto: const PropertyVideoDto(
    //         videoThumbnail: '', videoId: '', videoDescription: '')));

    // //placing location in the state
    // emit(state.copyWith(
    //     propertyLocationDto: const PropertyLocationDto(
    //         cityId: 0, address: '', addressDescription: '', googleMap: '', latitude: '', longitude: '',)));

    // emit(state.copyWith(aminities: []));
    // emit(state.copyWith(nearestLocationList: []));
    // emit(state.copyWith(addtionalInfoList: []));
    // emit(state.copyWith(propertyPlanDto: []));
    // emit(state.copyWith(seoTitle: ''));
    // emit(state.copyWith(seoMetaDescription: ''));
    // emit(state.copyWith(state: const PropertyCreateInitial()));
  }
}
