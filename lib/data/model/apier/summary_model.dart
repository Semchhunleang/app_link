import 'dart:convert';

class SummaryApierModel {
    String? status;
    String? message;
    List<DataSummaryModel>? data;
    int? totalInvite;
    String? totalAmount;

    SummaryApierModel({
        this.status,
        this.message,
        this.data,
        this.totalInvite,
        this.totalAmount,
    });

    factory SummaryApierModel.fromRawJson(String str) => SummaryApierModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SummaryApierModel.fromJson(Map<String, dynamic> json) => SummaryApierModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<DataSummaryModel>.from(json["data"]!.map((x) => DataSummaryModel.fromJson(x))),
        totalInvite: json["total_invite"],
        totalAmount: json["total_amount"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total_invite": totalInvite,
        "total_amount": totalAmount,
    };
}

class DataSummaryModel {
    int? depth;
    int? level;
    int? invite;
    double? amount;
    String? amountFormat;

    DataSummaryModel({
        this.depth,
        this.level,
        this.invite,
        this.amount,
        this.amountFormat,
    });

    factory DataSummaryModel.fromRawJson(String str) => DataSummaryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataSummaryModel.fromJson(Map<String, dynamic> json) => DataSummaryModel(
        depth: json["depth"],
        level: json["level"],
        invite: json["invite"],
        amount: json["amount"]?.toDouble(),
        amountFormat: json["amount_format"],
    );

    Map<String, dynamic> toJson() => {
        "depth": depth,
        "level": level,
        "invite": invite,
        "amount": amount,
        "amount_format": amountFormat,
    };
}
