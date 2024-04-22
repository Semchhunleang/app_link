// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) => SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) => json.encode(data.toJson());

class SubscriptionModel {
    String? name;
    dynamic startDate;
    dynamic endDate;
    bool? isUnlimited;
    String? status;
    bool? isValid;
    bool? canUpgrade;

    SubscriptionModel({
        this.name,
        this.startDate,
        this.endDate,
        this.isUnlimited,
        this.status,
        this.isValid,
        this.canUpgrade,
    });

    SubscriptionModel copyWith({
        String? name,
        dynamic startDate,
        dynamic endDate,
        bool? isUnlimited,
        String? status,
        bool? isValid,
        bool? canUpgrade,
    }) => 
        SubscriptionModel(
            name: name ?? this.name,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            isUnlimited: isUnlimited ?? this.isUnlimited,
            status: status ?? this.status,
            isValid: isValid ?? this.isValid,
            canUpgrade: canUpgrade ?? this.canUpgrade,
        );

    factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
        name: json["name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        isUnlimited: json["is_unlimited"],
        status: json["status"],
        isValid: json["is_valid"],
        canUpgrade: json["can_upgrade"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "start_date": startDate,
        "end_date": endDate,
        "is_unlimited": isUnlimited,
        "status": status,
        "is_valid": isValid,
        "can_upgrade": canUpgrade,
    };
}
