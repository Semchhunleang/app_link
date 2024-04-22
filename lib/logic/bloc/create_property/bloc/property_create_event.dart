part of 'property_create_bloc.dart';

abstract class PropertyCreateEvent extends Equatable {
  const PropertyCreateEvent();

  @override
  List<Object> get props => [];
}

class PropertyTitleEvent extends PropertyCreateEvent {
  final String title;
  const PropertyTitleEvent({required this.title});

  @override
  List<Object> get props => [title];
}

class PropertySlugEvent extends PropertyCreateEvent {
  final String slug;
  const PropertySlugEvent({required this.slug});

  @override
  List<Object> get props => [slug];
}

class PropertyTypeEvent extends PropertyCreateEvent {
  final String type;
  const PropertyTypeEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class PropertyPurposeEvent extends PropertyCreateEvent {
  final String purpose;
  const PropertyPurposeEvent({required this.purpose});

  @override
  List<Object> get props => [purpose];
}

class PropertyRentPeriodEvent extends PropertyCreateEvent {
  final String rentPeriod;
  const PropertyRentPeriodEvent({required this.rentPeriod});

  @override
  List<Object> get props => [rentPeriod];
}

class PropertyPriceEvent extends PropertyCreateEvent {
  final String price;
  const PropertyPriceEvent({required this.price});

  @override
  List<Object> get props => [price];
}

class PropertyTotalAreaEvent extends PropertyCreateEvent {
  final String totalArea;
  const PropertyTotalAreaEvent({required this.totalArea});

  @override
  List<Object> get props => [totalArea];
}

class PropertyTotalUnitEvent extends PropertyCreateEvent {
  final String totalUnit;
  const PropertyTotalUnitEvent({required this.totalUnit});

  @override
  List<Object> get props => [totalUnit];
}

class PropertyTotalBedroomEvent extends PropertyCreateEvent {
  final String totalBedroom;
  const PropertyTotalBedroomEvent({required this.totalBedroom});

  @override
  List<Object> get props => [totalBedroom];
}

class PropertyTotalBathroomEvent extends PropertyCreateEvent {
  final String totalBathroom;
  const PropertyTotalBathroomEvent({required this.totalBathroom});

  @override
  List<Object> get props => [totalBathroom];
}

class PropertyTotalGarageEvent extends PropertyCreateEvent {
  final String totalGarage;
  const PropertyTotalGarageEvent({required this.totalGarage});

  @override
  List<Object> get props => [totalGarage];
}

class PropertyTotalKitchenEvent extends PropertyCreateEvent {
  final String totalKitchen;
  const PropertyTotalKitchenEvent({required this.totalKitchen});

  @override
  List<Object> get props => [totalKitchen];
}

class PropertyDescriptionEvent extends PropertyCreateEvent {
  final String description;
  const PropertyDescriptionEvent({required this.description});

  @override
  List<Object> get props => [description];
}

class PropertyPropertyImageEvent extends PropertyCreateEvent {
  final PropertyImageDto propertyImage;
  const PropertyPropertyImageEvent({required this.propertyImage});

  @override
  List<Object> get props => [propertyImage];
}

// class PropertyPropertyVideoEvent extends PropertyCreateEvent {
//   final PropertyVideoDto propertyVideo;
//   const PropertyPropertyVideoEvent({required this.propertyVideo});

//   @override
//   List<Object> get props => [propertyVideo];
// }

class PropertyPropertyLocationEvent extends PropertyCreateEvent {
  final PropertyLocationDto propertyLocation;
  const PropertyPropertyLocationEvent({required this.propertyLocation});

  @override
  List<Object> get props => [propertyLocation];
}

class PropertyPropertyAminitiesEvent extends PropertyCreateEvent {
  final List<int> propertyAminities;
  const PropertyPropertyAminitiesEvent({required this.propertyAminities});

  @override
  List<Object> get props => [propertyAminities];
}

class PropertyNearestLocationEvent extends PropertyCreateEvent {
  final List<NearestLocationDto> nearestLocation;
  const PropertyNearestLocationEvent({required this.nearestLocation});

  @override
  List<Object> get props => [nearestLocation];
}

class PropertyAdditionalInfoEvent extends PropertyCreateEvent {
  final List<AdditionalInfoDto> additionalInfo;
  const PropertyAdditionalInfoEvent({required this.additionalInfo});

  @override
  List<Object> get props => [additionalInfo];
}

class PropertyPropertyPlanEvent extends PropertyCreateEvent {
  final List<PropertyPlanDto> propertyPlan;
  const PropertyPropertyPlanEvent({required this.propertyPlan});

  @override
  List<Object> get props => [propertyPlan];
}

class PropertySeoTitleEvent extends PropertyCreateEvent {
  final String seoTitle;
  const PropertySeoTitleEvent({required this.seoTitle});

  @override
  List<Object> get props => [seoTitle];
}

class PropertySeoMetaDescriptionEvent extends PropertyCreateEvent {
  final String seoMetaDescription;
  const PropertySeoMetaDescriptionEvent({required this.seoMetaDescription});

  @override
  List<Object> get props => [seoMetaDescription];
}

class SubmitCreateProperty extends PropertyCreateEvent {}

class SubmitUpdateProperty extends PropertyCreateEvent {
  final String propertyId;
  const SubmitUpdateProperty({required this.propertyId});

  @override
  List<Object> get props => [propertyId];
}

class PropertyEditInfoEvent extends PropertyCreateEvent {
  final String propertyId;
  const PropertyEditInfoEvent({required this.propertyId});

  @override
  List<Object> get props => [propertyId];
}

class PropertyStateReset extends PropertyCreateEvent {}

class DeleteSliderImage extends PropertyCreateEvent {
  final String id;
  const DeleteSliderImage({required this.id});

  @override
  List<Object> get props => [id];
}
