import 'dart:convert';

import 'package:equatable/equatable.dart';

class DataSuccessPaymentLinkModel extends Equatable {
  final String paymentLink;

  const DataSuccessPaymentLinkModel({required this.paymentLink});

  DataSuccessPaymentLinkModel copyWith({String? paymentLink}) {
    return DataSuccessPaymentLinkModel(
        paymentLink: paymentLink ?? this.paymentLink);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payment_link': paymentLink,
    };
  }

  factory DataSuccessPaymentLinkModel.fromMap(Map<String, dynamic> map) {
    return DataSuccessPaymentLinkModel(
      paymentLink: map['payment_link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSuccessPaymentLinkModel.fromJson(String source) =>
      DataSuccessPaymentLinkModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [paymentLink];
}
