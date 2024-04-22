// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'property_create_bloc.dart';

class PropertyCreateModel extends Equatable {
  final String title;
  // final String slug;
  final String typeId;
  final String purpose;
  final String rentPeriod;
  final String price;
  final String totalArea;
  final String totalUnit;
  final String totalBedroom;
  final String totalBathroom;
  final String totalGarage;
  final String totalKitchen;
  final String description;
  final String status;
  final PropertyImageDto propertyImageDto;
  // final PropertyVideoDto propertyVideoDto;
  final PropertyLocationDto propertyLocationDto;
  final List<int> aminities;
  final List<NearestLocationDto> nearestLocationList;
  final List<AdditionalInfoDto> addtionalInfoList;
  final List<PropertyPlanDto> propertyPlanDto;
  // final String seoTitle;
  // final String seoMetaDescription;
  final PropertyCreateState state;

  const PropertyCreateModel({
    this.title = '',
    // this.slug = '',
    this.typeId = '',
    this.purpose = '',
    this.rentPeriod = '',
    this.price = '',
    this.totalArea = '',
    this.totalUnit = '',
    this.totalBedroom = '',
    this.totalBathroom = '',
    this.totalGarage = '',
    this.totalKitchen = '',
    this.description = '',
    this.status = '',
    this.propertyImageDto =
        const PropertyImageDto(sliderImages: [], thumbnailImage: ''),
    // this.propertyVideoDto = const PropertyVideoDto(videoDescription: '', videoId: '', videoThumbnail: ''),
    this.propertyLocationDto = const PropertyLocationDto(
        cityId: 0,
        address: '',
        addressDescription: '',
        // googleMap: '',
        latitude: '',
        longitude: ''),
    this.aminities = const [],
    this.nearestLocationList = const [],
    this.addtionalInfoList = const [],
    this.propertyPlanDto = const [],
    // this.seoTitle = '',
    // this.seoMetaDescription = '',
    this.state = const PropertyCreateInitial(),
  });

  PropertyCreateModel copyWith({
    String? title,
    // String? slug,
    String? typeId,
    String? purpose,
    String? rentPeriod,
    String? price,
    String? totalArea,
    String? totalUnit,
    String? totalBedroom,
    String? totalBathroom,
    String? totalGarage,
    String? totalKitchen,
    String? description,
    String? status,
    PropertyImageDto? propertyImageDto,
    // PropertyVideoDto? propertyVideoDto,
    PropertyLocationDto? propertyLocationDto,
    List<int>? aminities,
    List<NearestLocationDto>? nearestLocationList,
    List<AdditionalInfoDto>? addtionalInfoList,
    List<PropertyPlanDto>? propertyPlanDto,
    // String? seoTitle,
    // String? seoMetaDescription,
    PropertyCreateState? state,
  }) {
    return PropertyCreateModel(
      title: title ?? this.title,
      // slug: slug ?? this.slug,
      typeId: typeId ?? this.typeId,
      purpose: purpose ?? this.purpose,
      rentPeriod: rentPeriod ?? this.rentPeriod,
      price: price ?? this.price,
      totalArea: totalArea ?? this.totalArea,
      totalUnit: totalUnit ?? this.totalUnit,
      totalBedroom: totalBedroom ?? this.totalBedroom,
      totalBathroom: totalBathroom ?? this.totalBathroom,
      totalGarage: totalGarage ?? this.totalGarage,
      totalKitchen: totalKitchen ?? this.totalKitchen,
      description: description ?? this.description,
      status: status ?? this.status,
      propertyImageDto: propertyImageDto ?? this.propertyImageDto,
      // propertyVideoDto: propertyVideoDto ?? this.propertyVideoDto,
      propertyLocationDto: propertyLocationDto ?? this.propertyLocationDto,
      aminities: aminities ?? this.aminities,
      nearestLocationList: nearestLocationList ?? this.nearestLocationList,
      addtionalInfoList: addtionalInfoList ?? this.addtionalInfoList,
      propertyPlanDto: propertyPlanDto ?? this.propertyPlanDto,
      // seoTitle: seoTitle ?? this.seoTitle,
      // seoMetaDescription: seoMetaDescription ?? this.seoMetaDescription,
      state: state ?? this.state,
    );
  }

  Map<String, String> toMap() {
    final result = <String, String>{};
    // return <String, dynamic>{
    result.addAll({'title': title});
    // result.addAll({'slug': slug});
    result.addAll({'property_type_id': typeId});
    result.addAll({'purpose': purpose});
    result.addAll({'rent_period': rentPeriod});
    result.addAll({'price': price});
    result.addAll({'total_area': totalArea});
    result.addAll({'total_unit': totalUnit});
    result.addAll({'total_bedroom': totalBedroom});
    result.addAll({'total_bathroom': totalBathroom});
    result.addAll({'total_garage': totalGarage});
    result.addAll({'total_kitchen': totalKitchen});
    result.addAll({'description': description});
    result.addAll({'status': description});

    // result.addAll({'thumbnail_image': propertyImageDto!.toMap()});

    // result.addAll({'video_id': propertyVideoDto.videoId});
    // result.addAll({'video_description': propertyVideoDto.videoDescription});

    result.addAll({'city_id': propertyLocationDto.cityId.toString()});
    result.addAll({'address': propertyLocationDto.address});
    result.addAll(
        {'address_description': propertyLocationDto.addressDescription});
    // result.addAll({'google_map': propertyLocationDto.googleMap});
    result.addAll({'latitude': propertyLocationDto.latitude});
    result.addAll({'longitude': propertyLocationDto.longitude});

    if (aminities.isNotEmpty) {
      for (var i = 0; i < aminities.length; i++) {
        result.addAll({'aminities[$i]': aminities[i].toString()});
      }
    }

    if (nearestLocationList.isNotEmpty) {
      for (var i = 0; i < nearestLocationList.length; i++) {
        // We are checking if ID exists or not to filter existing nearest data.
        if (nearestLocationList[i].id > 0) {
          result.addAll({
            'existing_nearest_ids[$i]': nearestLocationList[i].id.toString()
          });
          result.addAll({
            'existing_nearest_locations[$i]':
                nearestLocationList[i].locationId.toString()
          });
          result.addAll(
              {'existing_distances[$i]': nearestLocationList[i].distances});
        } else {
          result.addAll({
            'nearest_locations[$i]':
                nearestLocationList[i].locationId.toString()
          });
          result.addAll({'distances[$i]': nearestLocationList[i].distances});
        }
      }
    }

    if (addtionalInfoList.isNotEmpty) {
      for (var i = 0; i < addtionalInfoList.length; i++) {
        // We are checking if ID exists or not to filter Additional Info data.
        if (addtionalInfoList[i].id > 0) {
          result.addAll(
              {'existing_add_ids[$i]': addtionalInfoList[i].id.toString()});
          result
              .addAll({'existing_add_keys[$i]': addtionalInfoList[i].addKeys});
          result.addAll(
              {'existing_add_values[$i]': addtionalInfoList[i].addValues});
        } else {
          result.addAll({'add_keys[$i]': addtionalInfoList[i].addKeys});
          result.addAll({'add_values[$i]': addtionalInfoList[i].addValues});
        }
      }
    }

    if (propertyPlanDto.isNotEmpty) {
      for (var i = 0; i < propertyPlanDto.length; i++) {
        // We are checking if ID exists or not to filter Plan data.
        if (propertyPlanDto[i].id > 0) {
          result.addAll(
              {'existing_plan_ids[$i]': propertyPlanDto[i].id.toString()});
          result.addAll(
              {'existing_plan_titles[$i]': propertyPlanDto[i].planTitles});
          result.addAll({
            'existing_plan_descriptions[$i]':
                propertyPlanDto[i].planDescriptions
          });
        } else {
          result.addAll({'plan_titles[$i]': propertyPlanDto[i].planTitles});
          result.addAll(
              {'plan_descriptions[$i]': propertyPlanDto[i].planDescriptions});
        }
      }
    }

    // result.addAll({'seo_title': seoTitle});
    // result.addAll({'seo_meta_description': seoMetaDescription});
    // };
    return result;
  }

  factory PropertyCreateModel.fromMap(Map<String, dynamic> map) {
    return PropertyCreateModel(
      title: map['title'] ?? "",
      // slug: map['slug'] ?? "",
      typeId: map['typeId'] as String,
      purpose: map['purpose'] ?? "",
      rentPeriod: map['rentPeriod'] ?? "",
      price: map['price'] ?? "",
      totalArea: map['totalArea'] as String,
      totalUnit: map['totalUnit'] as String,
      totalBedroom: map['totalBedroom'] as String,
      totalBathroom: map['totalBathroom'] as String,
      totalGarage: map['totalGarage'] as String,
      totalKitchen: map['totalKitchen'] as String,
      description: map['description'] ?? "",
      status: map['status'] ?? "",
      propertyImageDto: PropertyImageDto.fromMap(
          map['propertyImageDto'] as Map<String, dynamic>),
      // propertyVideoDto: PropertyVideoDto.fromMap(
      //     map['propertyVideoDto'] as Map<String, dynamic>),
      propertyLocationDto: PropertyLocationDto.fromMap(
          map['propertyLocationDto'] as Map<String, dynamic>),
      aminities: List<int>.from((map['aminities'] as List<int>)),
      nearestLocationList: List<NearestLocationDto>.from(
        (map['nearestLocationList'] as List<String>).map<NearestLocationDto>(
          (x) => NearestLocationDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      addtionalInfoList: List<AdditionalInfoDto>.from(
        (map['addtionalInfoList'] as List<String>).map<AdditionalInfoDto>(
          (x) => AdditionalInfoDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      propertyPlanDto: List<PropertyPlanDto>.from(
        (map['propertyPlanDto'] as List<String>).map<PropertyPlanDto>(
          (x) => PropertyPlanDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      // seoTitle: map['seoTitle'] ?? "",
      // seoMetaDescription: map['seoMetaDescription'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyCreateModel.fromJson(String source) =>
      PropertyCreateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      title,
      // slug,
      typeId,
      purpose,
      rentPeriod,
      price,
      totalArea,
      totalUnit,
      totalBedroom,
      totalBathroom,
      totalGarage,
      totalKitchen,
      description,
      status,
      propertyImageDto,
      // propertyVideoDto,
      propertyLocationDto,
      aminities,
      nearestLocationList,
      addtionalInfoList,
      propertyPlanDto,
      // seoTitle,
      // seoMetaDescription,
      state,
    ];
  }
}

abstract class PropertyCreateState extends Equatable {
  const PropertyCreateState();

  @override
  List<Object> get props => [];
}

class PropertyCreateInitial extends PropertyCreateState {
  const PropertyCreateInitial();
}

class PropertyCreateLoading extends PropertyCreateState {
  const PropertyCreateLoading();
}

class PropertyUpdateLoading extends PropertyCreateState {
  const PropertyUpdateLoading();
}

class PropertyGetDataUpdateLoading extends PropertyCreateState {
  const PropertyGetDataUpdateLoading();
}

class PropertyCreateInvalidError extends PropertyCreateState {
  final Errors errors;

  const PropertyCreateInvalidError(this.errors);

  @override
  List<Object> get props => [errors];
}

class PropertyUpdateInvalidError extends PropertyCreateState {
  final Errors errors;

  const PropertyUpdateInvalidError(this.errors);

  @override
  List<Object> get props => [errors];
}

class PropertyCreateError extends PropertyCreateState {
  final String errorMsg;

  const PropertyCreateError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class PropertyUpdateError extends PropertyCreateState {
  final String errorMsg;

  const PropertyUpdateError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class PropertyCreateSuccess extends PropertyCreateState {
  // final String message;
  final DataSuccessCreateProperty dataSuccessCreateProperty;

  const PropertyCreateSuccess(this.dataSuccessCreateProperty);

  @override
  List<Object> get props => [dataSuccessCreateProperty];
}

class PropertyUpdateSuccess extends PropertyCreateState {
  final String message;

  const PropertyUpdateSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyEditInfoData extends PropertyCreateState {
  final EditInfoModel data;

  const PropertyEditInfoData(this.data);

  @override
  List<Object> get props => [data];
}

// class PropertyLatLng extends PropertyCreateState {
//   final String latitude;
//   final String longitude;

//   const PropertyLatLng({required this.latitude, required this.longitude});

//   @override
//   List<Object> get props => [latitude,longitude ];
// }
