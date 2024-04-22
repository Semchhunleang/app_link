import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthErrorModel extends Equatable {
  final String message;
  final Errors errors;

  const AuthErrorModel({
    required this.message,
    required this.errors,
  });

  AuthErrorModel copyWith({
    String? message,
    Errors? errors,
  }) {
    return AuthErrorModel(
      message: message ?? this.message,
      errors: errors ?? this.errors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'errors': errors.toMap(),
    };
  }

  factory AuthErrorModel.fromMap(Map<String, dynamic> map) {
    return AuthErrorModel(
      message: map['message'] ?? "",
      errors: Errors.fromMap(map['errors'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthErrorModel.fromJson(String source) =>
      AuthErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [message, errors];
}

class Errors extends Equatable {
  //final List<String> name;
  final List<String> firstName;
  final List<String> lastName;
  final List<String> agree;
  final List<String> email;
  final List<String> agentEmail;
  final List<String> password;
  final List<String> confirmPassword;
  final List<String> phone;
  final List<String> refCode;
  final List<String> country;
  final List<String> state;
  final List<String> city;
  final List<String> address;
  final List<String> type;
  final List<String> subject;
  final List<String> message;
  final List<String> review;
  final List<String> designation;
  final List<String> aboutMe;
  final List<String> tnxInfo;
  final List<String> cardNumber;
  final List<String> year;
  final List<String> month;
  final List<String> cvc;
  final List<String> title;
  final List<String> slug;
  final List<String> propertytypeId;
  final List<String> purpose;
  final List<String> price;
  final List<String> description;
  final List<String> cityId;
  final List<String> addressDescription;
  final List<String> googleMap;
  final List<String> totalArea;
  final List<String> totalUnit;
  final List<String> totalBedroom;
  final List<String> totalBathroom;
  final List<String> totalGarage;
  final List<String> totalKitchen;
  final List<String> thumbnailImage;
  final List<String> latitude;
  final List<String> longitude;
  final List<String> productCode;
  final List<String> listingId;

  const Errors(
      {
      // required this.name,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.agentEmail,
      required this.agree,
      required this.password,
      required this.confirmPassword,
      required this.phone,
      required this.refCode,
      required this.country,
      required this.state,
      required this.city,
      required this.address,
      required this.type,
      required this.subject,
      required this.message,
      required this.review,
      required this.designation,
      required this.aboutMe,
      required this.tnxInfo,
      required this.cardNumber,
      required this.year,
      required this.month,
      required this.cvc,
      required this.title,
      required this.slug,
      required this.cityId,
      required this.propertytypeId,
      required this.purpose,
      required this.price,
      required this.description,
      required this.addressDescription,
      required this.googleMap,
      required this.totalArea,
      required this.totalUnit,
      required this.totalBedroom,
      required this.totalBathroom,
      required this.totalKitchen,
      required this.totalGarage,
      required this.thumbnailImage,
      required this.latitude,
      required this.longitude,
      required this.productCode,
      required this.listingId});

  Errors copyWith({
    // List<String>? name,
    List<String>? firstName,
    List<String>? lastName,
    List<String>? agree,
    List<String>? email,
    List<String>? agentEmail,
    List<String>? password,
    List<String>? confirmPassword,
    List<String>? phone,
    List<String>? refCode,
    List<String>? country,
    List<String>? state,
    List<String>? city,
    List<String>? address,
    List<String>? type,
    List<String>? subject,
    List<String>? message,
    List<String>? review,
    List<String>? designation,
    List<String>? aboutMe,
    List<String>? tnxInfo,
    List<String>? cardNumber,
    List<String>? year,
    List<String>? month,
    List<String>? cvc,
    List<String>? title,
    List<String>? slug,
    List<String>? propertytypeId,
    List<String>? purpose,
    List<String>? price,
    List<String>? description,
    List<String>? cityId,
    List<String>? addressDescription,
    List<String>? googleMap,
    List<String>? totalArea,
    List<String>? totalUnit,
    List<String>? totalBedroom,
    List<String>? totalBathroom,
    List<String>? totalGarage,
    List<String>? totalKitchen,
    List<String>? thumbnailImage,
    List<String>? latitude,
    List<String>? longitude,
    List<String>? productCode,
    List<String>? listingId,
  }) {
    return Errors(
      // name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      agentEmail: agentEmail ?? this.agentEmail,
      agree: agree ?? this.agree,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      refCode: refCode ?? this.refCode,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      address: address ?? this.address,
      type: type ?? this.type,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      review: review ?? this.review,
      designation: designation ?? this.designation,
      aboutMe: aboutMe ?? this.aboutMe,
      tnxInfo: tnxInfo ?? this.tnxInfo,
      cardNumber: cardNumber ?? this.cardNumber,
      year: year ?? this.year,
      month: month ?? this.month,
      cvc: cvc ?? this.cvc,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      propertytypeId: propertytypeId ?? this.propertytypeId,
      purpose: purpose ?? this.purpose,
      price: price ?? this.price,
      description: description ?? this.description,
      cityId: cityId ?? this.cityId,
      addressDescription: addressDescription ?? this.addressDescription,
      googleMap: googleMap ?? this.googleMap,
      totalArea: totalArea ?? this.totalArea,
      totalUnit: totalUnit ?? this.totalUnit,
      totalBedroom: totalBedroom ?? this.totalBedroom,
      totalBathroom: totalBathroom ?? this.totalBathroom,
      totalGarage: totalGarage ?? this.totalGarage,
      totalKitchen: totalKitchen ?? this.totalKitchen,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      productCode: productCode ?? this.productCode,
      listingId: listingId ?? this.listingId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'agent_email': agentEmail,
      'agree': agree,
      'password': password,
      "password_confirmation": confirmPassword,
      'phone': phone,
      'ref_code': refCode,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'type': type,
      'subject': subject,
      'message': message,
      'review': review,
      'designation': designation,
      'about_me': aboutMe,
      'tnx_info': tnxInfo,
      'card_number': cardNumber,
      'year': year,
      'month': month,
      'cvc': cvc,
      'product_code': productCode,
      'listing_id': listingId,
    };
  }

  factory Errors.fromMap(Map<String, dynamic> map) {
    return Errors(
      // name: map['name'] != null
      //     ? List<String>.from(map['name'].map((x) => x))
      //     : [],
      firstName: map['first_name'] != null
          ? List<String>.from(map['first_name'].map((x) => x))
          : [],
      lastName: map['last_name'] != null
          ? List<String>.from(map['last_name'].map((x) => x))
          : [],
      email: map['email'] != null
          ? List<String>.from(map['email'].map((x) => x))
          : [],
      agentEmail: map['agent_email'] != null
          ? List<String>.from(map['agent_email'].map((x) => x))
          : [],
      agree: map['agree'] != null
          ? List<String>.from(map['agree'].map((x) => x))
          : [],
      password: map['password'] != null
          ? List<String>.from(map['password'].map((x) => x))
          : [],
      confirmPassword: map['password_confirmation'] != null
          ? List<String>.from(map['password_confirmation'].map((x) => x))
          : [],
      phone: map['phone'] != null
          ? List<String>.from(map['phone'].map((x) => x))
          : [],
      refCode: map['ref_code'] != null
          ? List<String>.from(map['ref_code'].map((x) => x))
          : [],
      country: map['country'] != null
          ? List<String>.from(map['country'].map((x) => x))
          : [],
      state: map['state'] != null
          ? List<String>.from(map['state'].map((x) => x))
          : [],
      city: map['city'] != null
          ? List<String>.from(map['city'].map((x) => x))
          : [],
      address: map['address'] != null
          ? List<String>.from(map['address'].map((x) => x))
          : [],
      type: map['type'] != null
          ? List<String>.from(map['type'].map((x) => x))
          : [],
      subject: map['subject'] != null
          ? List<String>.from(map['subject'].map((x) => x))
          : [],
      message: map['message'] != null
          ? List<String>.from(map['message'].map((x) => x))
          : [],
      review: map['review'] != null
          ? List<String>.from(map['review'].map((x) => x))
          : [],
      designation: map['designation'] != null
          ? List<String>.from(map['designation'].map((x) => x))
          : [],
      aboutMe: map['about_me'] != null
          ? List<String>.from(map['about_me'].map((x) => x))
          : [],
      tnxInfo: map['tnx_info'] != null
          ? List<String>.from(map['tnx_info'].map((x) => x))
          : [],
      cardNumber: map['card_number'] != null
          ? List<String>.from(map['card_number'].map((x) => x))
          : [],
      year: map['year'] != null
          ? List<String>.from(map['year'].map((x) => x))
          : [],
      month: map['month'] != null
          ? List<String>.from(map['month'].map((x) => x))
          : [],
      cvc:
          map['cvc'] != null ? List<String>.from(map['cvc'].map((x) => x)) : [],

      title: map['title'] != null
          ? List<String>.from(map['title'].map((x) => x))
          : [],

      slug: map['slug'] != null
          ? List<String>.from(map['slug'].map((x) => x))
          : [],

      propertytypeId: map['property_type_id'] != null
          ? List<String>.from(map['property_type_id'].map((x) => x))
          : [],

      purpose: map['purpose'] != null
          ? List<String>.from(map['purpose'].map((x) => x))
          : [],

      price: map['price'] != null
          ? List<String>.from(map['price'].map((x) => x))
          : [],

      description: map['description'] != null
          ? List<String>.from(map['description'].map((x) => x))
          : [],

      cityId: map['city_id'] != null
          ? List<String>.from(map['city_id'].map((x) => x))
          : [],

      addressDescription: map['address_description'] != null
          ? List<String>.from(map['address_description'].map((x) => x))
          : [],

      googleMap: map['google_map'] != null
          ? List<String>.from(map['google_map'].map((x) => x))
          : [],

      totalArea: map['total_area'] != null
          ? List<String>.from(map['total_area'].map((x) => x))
          : [],

      totalUnit: map['total_unit'] != null
          ? List<String>.from(map['total_unit'].map((x) => x))
          : [],

      totalBedroom: map['total_bedroom'] != null
          ? List<String>.from(map['total_bedroom'].map((x) => x))
          : [],

      totalBathroom: map['total_bathroom'] != null
          ? List<String>.from(map['total_bathroom'].map((x) => x))
          : [],

      totalGarage: map['total_garage'] != null
          ? List<String>.from(map['total_garage'].map((x) => x))
          : [],

      totalKitchen: map['total_kitchen'] != null
          ? List<String>.from(map['total_kitchen'].map((x) => x))
          : [],

      thumbnailImage: map['thumbnail_image'] != null
          ? List<String>.from(map['thumbnail_image'].map((x) => x))
          : [],
      latitude: map['latitude'] != null
          ? List<String>.from(map['latitude'].map((x) => x))
          : [],
      longitude: map['longitude'] != null
          ? List<String>.from(map['longitude'].map((x) => x))
          : [],
      productCode: map['product_code'] != null
          ? List<String>.from(map['product_code'].map((x) => x))
          : [],
      listingId: map['listing_id'] != null
          ? List<String>.from(map['listing_id'].map((x) => x))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Errors.fromJson(String source) =>
      Errors.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        // name,
        firstName,
        lastName,
        email,
        agentEmail,
        agree,
        password,
        confirmPassword,
        phone,
        refCode,
        country,
        state,
        city,
        address,
        type,
        subject,
        message,
        review,
        aboutMe,
        designation,
        tnxInfo,
        cardNumber,
        year,
        month,
        cvc,
        title,
        slug,
        price,
        purpose,
        cityId,
        propertytypeId,
        description,
        addressDescription,
        googleMap,
        totalArea,
        totalUnit,
        totalBedroom,
        totalBathroom,
        totalKitchen,
        totalGarage,
        thumbnailImage,
        latitude,
        longitude,
        productCode,
        listingId,
      ];
}
