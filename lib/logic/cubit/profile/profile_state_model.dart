import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'profile_cubit.dart';

class ProfileStateModel extends Equatable {
  final String name;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String image;
  final String designation;
  final String aboutMe;
  final String facebook;
  final String twitter;
  final String linkedin;
  final String instagram;
  final ProfileState profileState;

  const ProfileStateModel({
    this.name = '',
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.address = '',
    this.image = '',
    this.designation = '',
    this.aboutMe = '',
    this.facebook = '',
    this.twitter = '',
    this.linkedin = '',
    this.instagram = '',
    this.profileState = const ProfileInitial(),
  });

  ProfileStateModel copyWith({
    String? name,
    String? firstName,
    String? lastName,
    String? phone,
    String? address,
    String? image,
    String? designation,
    String? aboutMe,
    String? facebook,
    String? twitter,
    String? linkedin,
    String? instagram,
    ProfileState? profileState,
  }) {
    return ProfileStateModel(
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      image: image ?? this.image,
      designation: designation ?? this.designation,
      aboutMe: aboutMe ?? this.aboutMe,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
      instagram: instagram ?? this.instagram,
      profileState: profileState ?? this.profileState,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
      //'image': image,
      'designation': designation,
      'about_me': aboutMe,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'instagram': instagram,
    };
  }

  ProfileStateModel clear() {
    return const ProfileStateModel(
      name: '',
      firstName: '',
      lastName: '',
      phone: '',
      address: '',
      image: '',
      designation: '',
      aboutMe: '',
      facebook: '',
      twitter: '',
      linkedin: '',
      instagram: '',
    );
  }

  factory ProfileStateModel.fromMap(Map<String, dynamic> map) {
    return ProfileStateModel(
      name: map['name'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      designation: map['designation'] as String,
      aboutMe: map['aboutMe'] as String,
      facebook: map['facebook'] as String,
      twitter: map['twitter'] as String,
      linkedin: map['linkedin'] as String,
      instagram: map['instagram'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileStateModel.fromJson(String source) =>
      ProfileStateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      firstName,
      lastName,
      phone,
      address,
      image,
      designation,
      aboutMe,
      facebook,
      twitter,
      linkedin,
      instagram,
      profileState,
    ];
  }
}
