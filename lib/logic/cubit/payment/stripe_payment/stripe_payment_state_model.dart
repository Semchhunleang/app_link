import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/logic/cubit/payment/stripe_payment/stripe_payment_cubit.dart';

class StripePaymentStateModel extends Equatable {
  final String cardNumber;
  final String year;
  final String month;
  final String cvc;
  final StripePaymentState paymentState;

  const StripePaymentStateModel({
    this.cardNumber = '',
    this.year = '',
    this.month = '',
    this.cvc = '',
    this.paymentState = const StripePaymentInitial(),
  });

  StripePaymentStateModel copyWith({
    String? cardNumber,
    String? year,
    String? month,
    String? cvc,
    StripePaymentState? paymentState,
  }) {
    return StripePaymentStateModel(
      cardNumber: cardNumber ?? this.cardNumber,
      year: year ?? this.year,
      month: month ?? this.month,
      cvc: cvc ?? this.cvc,
      paymentState: paymentState ?? this.paymentState,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'card_number': cardNumber,
      'year': year,
      'month': month,
      'cvc': cvc,
    };
  }

  factory StripePaymentStateModel.fromMap(Map<String, dynamic> map) {
    return StripePaymentStateModel(
      cardNumber: map['card_number'] ?? '',
      year: map['year'] ?? '',
      month: map['month'] ?? '',
      cvc: map['cvc'] ?? '',
    );
  }

  StripePaymentStateModel clear() {
    return const StripePaymentStateModel(
      cardNumber: '',
      year: '',
      month: '',
      cvc: '',
      paymentState: StripePaymentInitial(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StripePaymentStateModel.fromJson(String source) =>
      StripePaymentStateModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      cardNumber,
      year,
      month,
      cvc,
      paymentState,
    ];
  }
}
