import 'package:equatable/equatable.dart';

import '../utils/k_images.dart';

class DummyPurpose extends Equatable {
  final int id;
  final String title;

  const DummyPurpose({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

class DummyLocation extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int totalProperty;

  const DummyLocation(
      {required this.id,
      required this.name,
      required this.slug,
      required this.totalProperty});

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        totalProperty,
      ];
}

final List<DummyPurpose> dummyPurpose = [
  const DummyPurpose(id: 1, title: 'Any'),
  const DummyPurpose(id: 2, title: 'For Rent'),
  const DummyPurpose(id: 3, title: 'For Sale'),
];

final List<DummyPurpose> updatePurpose = [
  const DummyPurpose(id: 1, title: 'For Rent'),
  const DummyPurpose(id: 2, title: 'For Sale'),
];
final List<DummyLocation> dummyLocation = [
  const DummyLocation(
      id: 1, name: 'Dhaka', slug: 'dhaka-1229', totalProperty: 2),
  const DummyLocation(
      id: 2, name: 'Rajshahi', slug: 'dhaka-1229', totalProperty: 3),
  const DummyLocation(
      id: 3, name: 'Natore', slug: 'dhaka-1229', totalProperty: 5),
  const DummyLocation(
      id: 4, name: 'Mirpur', slug: 'dhaka-1229', totalProperty: 7),
];

class DummyCategoryModel extends Equatable {
  final String name;
  final String image;

  const DummyCategoryModel({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}

// final List<DummyCategoryModel> categoryList = [
//   const DummyCategoryModel(name: 'Duplex House', image: KImages.categoryIcon01),
//   const DummyCategoryModel(name: 'Plaza', image: KImages.categoryIcon02),
//   const DummyCategoryModel(name: 'Apartment', image: KImages.categoryIcon03),
//   const DummyCategoryModel(name: 'Building', image: KImages.categoryIcon04),
//   const DummyCategoryModel(name: 'Duplex House', image: KImages.categoryIcon01),
//   const DummyCategoryModel(name: 'Plaza', image: KImages.categoryIcon02),
//   const DummyCategoryModel(name: 'Apartment', image: KImages.categoryIcon03),
//   const DummyCategoryModel(name: 'Building', image: KImages.categoryIcon04),
//   const DummyCategoryModel(name: 'Duplex House', image: KImages.categoryIcon01),
//   const DummyCategoryModel(name: 'Plaza', image: KImages.categoryIcon02),
// ];
final List<String> rendPeriodList = ['Daily', 'Monthly', 'Yearly'];

class DummyBrokerModel extends Equatable {
  final String name;
  final String image;
  final String designation;

  const DummyBrokerModel({
    required this.name,
    required this.image,
    this.designation = 'Real Estate Broker',
  });

  @override
  List<Object?> get props => [name, image];
}

final List<DummyBrokerModel> brokerList = [
  const DummyBrokerModel(name: 'Wade De Warren', image: KImages.brokerImage01),
  const DummyBrokerModel(name: 'Sarah Tylor', image: KImages.brokerImage02),
  const DummyBrokerModel(name: 'Daniel Morris', image: KImages.brokerImage03),
  const DummyBrokerModel(name: 'Debra Butcher', image: KImages.brokerImage04),
  const DummyBrokerModel(name: 'Tonya Fedler', image: KImages.brokerImage05),
  const DummyBrokerModel(name: 'Jean Johnson', image: KImages.brokerImage06),
  const DummyBrokerModel(
      name: 'Kelsey Jorgenson', image: KImages.brokerImage07),
  const DummyBrokerModel(name: 'Hubert Findley', image: KImages.brokerImage08),
];

class DummyPropertyCategory extends Equatable {
  final int id;
  final String name;

  const DummyPropertyCategory({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

final List<DummyPropertyCategory> propertyCategory = [
  const DummyPropertyCategory(id: 0, name: 'Building'),
  const DummyPropertyCategory(id: 1, name: 'Room'),
  const DummyPropertyCategory(id: 2, name: 'AC Room'),
  const DummyPropertyCategory(id: 3, name: 'Land'),
  const DummyPropertyCategory(id: 4, name: 'Ready Made Flat'),
  const DummyPropertyCategory(id: 5, name: 'Floor'),
];

const String eligibility =
    "Contrary to popular belief, Lorem Ipsum is not into simply random text. It has roots in a piece of the find classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin low in aaprofessor ";
const String refundCondition =
    "(3) All refund amounts shall be credited to your account within 3-4 business days in accordance with the terms that may be stipulated by the bank which has issued the credit ";
const String termsService =
    "Contrary to popular belief, Lorem Ipsum is not into simply random text. It has roots in a piece of the find classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin low in aaprofessor ";
const String cancelOrder =
    "The user  shall be entitled to a refund only if  following circumstances:\n(1)The  order packaging has been tampered or damaged at the time of delivery;\n(2)Your delivery location following outside our designated delivery zones.\n(3) All refund amounts shall be credited to your account within 3-4 business days in accordance with the terms that may be stipulated by the bank which has issued the credit/debit card.r ";
