import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/user_profile_model.dart';
import 'agent_properties_model.dart';

class AgentProfileModel extends Equatable {
  final int publishProperty;
  final int awaitingProperty;
  final int rejectProperty;
  final int totalPurchase;
  final int totalWishlist;
  final int totalReview;
  final UserProfileModel? agent;
  final AgentPropertiesModel? properties;

  //final MobileAppModel? mobileApp;

  const AgentProfileModel({
    required this.publishProperty,
    required this.awaitingProperty,
    required this.rejectProperty,
    required this.totalPurchase,
    required this.totalWishlist,
    required this.totalReview,
    required this.agent,
    required this.properties,
    //this.mobileApp,
  });

  AgentProfileModel copyWith({
    int? publishProperty,
    int? awaitingProperty,
    int? rejectProperty,
    int? totalPurchase,
    int? totalWishlist,
    int? totalReview,
    UserProfileModel? agent,
    AgentPropertiesModel? properties,
    //MobileAppModel? mobileApp,
  }) {
    return AgentProfileModel(
      publishProperty: publishProperty ?? this.publishProperty,
      awaitingProperty: awaitingProperty ?? this.awaitingProperty,
      rejectProperty: rejectProperty ?? this.rejectProperty,
      totalPurchase: totalPurchase ?? this.totalPurchase,
      totalWishlist: totalWishlist ?? this.totalWishlist,
      totalReview: totalReview ?? this.totalReview,
      agent: agent ?? this.agent,
      properties: properties ?? this.properties,
      //mobileApp: mobileApp ?? this.mobileApp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'publish_property': publishProperty,
      'awaiting_property': awaitingProperty,
      'reject_property': rejectProperty,
      'total_purchase': totalPurchase,
      'total_wishlist': totalWishlist,
      'total_review': totalReview,
      'agent': agent!.toMap(),
      'properties': properties!.toMap(),
      //'mobile_app': mobileApp!.toMap(),
    };
  }

  factory AgentProfileModel.fromMap(Map<String, dynamic> map) {
    return AgentProfileModel(
      publishProperty: map['publish_property'] != null
          ? int.parse(map['publish_property'].toString())
          : 0,
      awaitingProperty: map['awaiting_property'] != null
          ? int.parse(map['awaiting_property'].toString())
          : 0,
      rejectProperty: map['reject_property'] != null
          ? int.parse(map['reject_property'].toString())
          : 0,
      totalPurchase: map['total_purchase'] != null
          ? int.parse(map['total_purchase'].toString())
          : 0,
      totalWishlist: map['total_wishlist'] != null
          ? int.parse(map['total_wishlist'].toString())
          : 0,
      totalReview: map['total_review'] != null
          ? int.parse(map['total_review'].toString())
          : 0,

      agent: map['agent'] != null
          ? UserProfileModel.fromMap(map['agent'] as Map<String, dynamic>)
          : null,
      properties: map['properties'] != null
          ? AgentPropertiesModel.fromMap(
              map['properties'] as Map<String, dynamic>)
          : null,
      // mobileApp: map['mobile_app'] != null
      //     ? MobileAppModel.fromMap(map['mobile_app'] as Map<String, dynamic>)
      //     : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentProfileModel.fromJson(String source) =>
      AgentProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        //agent!,
        properties!,
        publishProperty,
        awaitingProperty,
        rejectProperty,
        totalPurchase,
        totalWishlist,
        totalReview,
      ];
}
