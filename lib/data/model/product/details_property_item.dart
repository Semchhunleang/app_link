import 'dart:convert';

import 'package:equatable/equatable.dart';

class DetailsPropertyItem extends Equatable {
  final int id;
  final int agentId;
  final int propertyTypeId;
  final int cityId;
  final String title;
  final String slug;
  final String purpose;
  final String rentPeriod;
  final double price;
  final String thumbnailImage;
  final String description;
  final String videoDescription;
  final String videoThumbnail;
  final String videoId;
  final String address;
  final String addressDescription;
  // final String googleMap;
  final int totalArea;
  final int totalUnit;
  final int totalBedroom;
  final int totalBathroom;
  final int totalGarage;
  final int totalKitchen;
  final String isFeatured;
  final String isTop;
  final String isUrgent;
  final String status;
  final String expiredDate;
  final String seoTitle;
  final String seoMetaDescription;
  final int serial;
  final String showSlider;
  final String approveByAdmin;
  final String createdAt;
  final String updatedAt;
  final int totalRating;
  final double ratingAvarage;
  final String latitude;
  final String longitude;

  const DetailsPropertyItem({
    required this.id,
    required this.agentId,
    required this.propertyTypeId,
    required this.cityId,
    required this.title,
    required this.slug,
    required this.purpose,
    required this.rentPeriod,
    required this.price,
    required this.thumbnailImage,
    required this.description,
    required this.videoDescription,
    required this.videoThumbnail,
    required this.videoId,
    required this.address,
    required this.addressDescription,
    // required this.googleMap,
    required this.totalArea,
    required this.totalUnit,
    required this.totalBedroom,
    required this.totalBathroom,
    required this.totalGarage,
    required this.totalKitchen,
    required this.isFeatured,
    required this.isTop,
    required this.isUrgent,
    required this.status,
    required this.expiredDate,
    required this.seoTitle,
    required this.seoMetaDescription,
    required this.serial,
    required this.showSlider,
    required this.approveByAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.totalRating,
    required this.ratingAvarage,
    required this.latitude,
    required this.longitude,
  });

  DetailsPropertyItem copyWith({
    int? id,
    int? agentId,
    int? propertyTypeId,
    int? cityId,
    String? title,
    String? slug,
    String? purpose,
    String? rentPeriod,
    double? price,
    String? thumbnailImage,
    String? description,
    String? videoDescription,
    String? videoThumbnail,
    String? videoId,
    String? address,
    String? addressDescription,
    // String? googleMap,
    int? totalArea,
    int? totalUnit,
    int? totalBedroom,
    int? totalBathroom,
    int? totalGarage,
    int? totalKitchen,
    String? isFeatured,
    String? isTop,
    String? isUrgent,
    String? status,
    String? expiredDate,
    String? seoTitle,
    String? seoMetaDescription,
    int? serial,
    String? showSlider,
    String? approveByAdmin,
    String? createdAt,
    String? updatedAt,
    int? totalRating,
    double? ratingAvarage,
    String? latitude,
    String? longitude,
  }) {
    return DetailsPropertyItem(
      id: id ?? this.id,
      agentId: agentId ?? this.agentId,
      propertyTypeId: propertyTypeId ?? this.propertyTypeId,
      cityId: cityId ?? this.cityId,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      purpose: purpose ?? this.purpose,
      rentPeriod: rentPeriod ?? this.rentPeriod,
      price: price ?? this.price,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      description: description ?? this.description,
      videoDescription: videoDescription ?? this.videoDescription,
      videoThumbnail: videoThumbnail ?? this.videoThumbnail,
      videoId: videoId ?? this.videoId,
      address: address ?? this.address,
      addressDescription: addressDescription ?? this.addressDescription,
      // googleMap: googleMap ?? this.googleMap,
      totalArea: totalArea ?? this.totalArea,
      totalUnit: totalUnit ?? this.totalUnit,
      totalBedroom: totalBedroom ?? this.totalBedroom,
      totalBathroom: totalBathroom ?? this.totalBathroom,
      totalGarage: totalGarage ?? this.totalGarage,
      totalKitchen: totalKitchen ?? this.totalKitchen,
      isFeatured: isFeatured ?? this.isFeatured,
      isTop: isTop ?? this.isTop,
      isUrgent: isUrgent ?? this.isUrgent,
      status: status ?? this.status,
      expiredDate: expiredDate ?? this.expiredDate,
      seoTitle: seoTitle ?? this.seoTitle,
      seoMetaDescription: seoMetaDescription ?? this.seoMetaDescription,
      serial: serial ?? this.serial,
      showSlider: showSlider ?? this.showSlider,
      approveByAdmin: approveByAdmin ?? this.approveByAdmin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalRating: totalRating ?? this.totalRating,
      ratingAvarage: ratingAvarage ?? this.ratingAvarage,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'agent_id': agentId,
      'property_type_id': propertyTypeId,
      'city_id': cityId,
      'title': title,
      'slug': slug,
      'purpose': purpose,
      'rent_period': rentPeriod,
      'price': price,
      'thumbnail_image': thumbnailImage,
      'description': description,
      'video_description': videoDescription,
      'video_thumbnail': videoThumbnail,
      'video_id': videoId,
      'address': address,
      'address_description': addressDescription,
      // 'google_map': googleMap,
      'total_area': totalArea,
      'total_unit': totalUnit,
      'total_bedroom': totalBedroom,
      'total_bathroom': totalBathroom,
      'total_garage': totalGarage,
      'total_kitchen': totalKitchen,
      'is_featured': isFeatured,
      'is_top': isTop,
      'is_urgent': isUrgent,
      'status': status,
      'expired_date': expiredDate,
      'seo_title': seoTitle,
      'seo_meta_description': seoMetaDescription,
      'serial': serial,
      'show_slider': showSlider,
      'approve_by_admin': approveByAdmin,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'totalRating': totalRating,
      'ratingAvarage': ratingAvarage,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory DetailsPropertyItem.fromMap(Map<String, dynamic> map) {
    return DetailsPropertyItem(
      id: map['id'] ?? 0,
      agentId:
          map['agent_id'] != null ? int.parse(map['agent_id'].toString()) : 0,
      propertyTypeId: map['property_type_id'] != null
          ? int.parse(map['property_type_id'].toString())
          : 0,
      cityId: map['city_id'] != null ? int.parse(map['city_id'].toString()) : 0,
      title: map['title'] ?? '',
      slug: map['slug'] ?? '',
      purpose: map['purpose'] ?? '',
      rentPeriod: map['rent_period'] ?? '',
      price: map['price'] != null ? double.parse(map['price'].toString()) : 0.0,
      thumbnailImage: map['thumbnail_image'] ?? '',
      description: map['description'] ?? '',
      videoDescription: map['video_description'] ?? '',
      videoThumbnail: map['video_thumbnail'] ?? '',
      videoId: map['video_id'] ?? '',
      address: map['address'] ?? '',
      addressDescription: map['address_description'] ?? '',
      // googleMap: map['google_map'] ?? '',
      totalArea: map['total_area'] ?? "",
      totalUnit: map['total_unit'] != null
          ? int.parse(map['total_unit'].toString())
          : 0,
      totalBedroom: map['total_bedroom'] != null
          ? int.parse(map['total_bedroom'].toString())
          : 0,
      totalBathroom: map['total_bathroom'] != null
          ? int.parse(map['total_bathroom'].toString())
          : 0,
      totalGarage: map['total_garage'] != null
          ? int.parse(map['total_garage'].toString())
          : 0,
      totalKitchen: map['total_kitchen'] != null
          ? int.parse(map['total_kitchen'].toString())
          : 0,
      isFeatured: map['is_featured'] ?? '',
      isTop: map['is_top'] ?? '',
      isUrgent: map['is_urgent'] ?? '',
      status: map['status'] ?? '',
      expiredDate: map['expired_date'] ?? '',
      seoTitle: map['seo_title'] ?? '',
      seoMetaDescription: map['seo_meta_description'] ?? '',
      serial: map['serial'] != null ? int.parse(map['serial'].toString()) : 0,
      showSlider: map['show_slider'] ?? '',
      approveByAdmin: map['approve_by_admin'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      totalRating: map['totalRating'] != null
          ? int.parse(map['totalRating'].toString())
          : 0,
      ratingAvarage: map['ratingAvarage'] != null
          ? double.parse(map['ratingAvarage'].toString())
          : 0.0,
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsPropertyItem.fromJson(String source) =>
      DetailsPropertyItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      agentId,
      propertyTypeId,
      cityId,
      title,
      slug,
      purpose,
      rentPeriod,
      price,
      thumbnailImage,
      description,
      videoDescription,
      videoThumbnail,
      videoId,
      address,
      addressDescription,
      // googleMap,
      totalArea,
      totalUnit,
      totalBedroom,
      totalBathroom,
      totalGarage,
      totalKitchen,
      isFeatured,
      isTop,
      isUrgent,
      status,
      expiredDate,
      seoTitle,
      seoMetaDescription,
      serial,
      showSlider,
      approveByAdmin,
      createdAt,
      updatedAt,
      totalRating,
      ratingAvarage,
      latitude,
      longitude
    ];
  }
}
