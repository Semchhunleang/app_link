import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:real_estate/data/model/online_payment/data_success_payment_link_model.dart';

class PaymentLinkSuccessModel extends Equatable {
  final String message;
  final DataSuccessPaymentLinkModel? dataSuccessPaymentLinkModel;
  const PaymentLinkSuccessModel(
      {required this.message, this.dataSuccessPaymentLinkModel});

  PaymentLinkSuccessModel copyWith(
      {String? message,
      DataSuccessPaymentLinkModel? dataSuccessPaymentLinkModel}) {
    return PaymentLinkSuccessModel(
        message: message ?? this.message,
        dataSuccessPaymentLinkModel:
            dataSuccessPaymentLinkModel ?? this.dataSuccessPaymentLinkModel);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'data': dataSuccessPaymentLinkModel!.toMap()
    };
  }

  factory PaymentLinkSuccessModel.fromMap(Map<String, dynamic> map) {
    return PaymentLinkSuccessModel(
      message: map['message'] ?? '',
      dataSuccessPaymentLinkModel: map['data'] != null
          ? DataSuccessPaymentLinkModel.fromMap(
              map['data'] as Map<String, dynamic>)
          : null,
    );
  }
  String toJson() => json.encode(toMap());

  factory PaymentLinkSuccessModel.fromJson(String source) =>
      PaymentLinkSuccessModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, dataSuccessPaymentLinkModel];
}
