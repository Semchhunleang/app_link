import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/user_profile_model.dart';
import 'bank_payment_model.dart';
import 'flutterwave_model.dart';
import 'instamojo_model.dart';
import 'molli_paystack_model.dart';
import 'paypal_model.dart';
import 'pricing_plan_model.dart';
import 'razorpay_model.dart';
import 'stripe_model.dart';

class PaymentModel extends Equatable {
  final UserProfileModel? user;
  final BankPayment? bankPayment;
  final String planeExpireData;
  final FlutterWavePayment? flutterWave;
  final InstamojoPayment? instamojo;
  final MolliPayStackPayment? molliPayStack;
  final MolliPayStackPayment? paystack;
  final PayPalPayment? payPal;
  final PricePlan? pricePlan;
  final RazorPayPayment? razorPay;
  final StripePayment? stripe;

  const PaymentModel({
    this.user,
    this.bankPayment,
    required this.planeExpireData,
    this.flutterWave,
    this.instamojo,
    this.molliPayStack,
    this.paystack,
    this.payPal,
    this.pricePlan,
    this.razorPay,
    this.stripe,
  });

  PaymentModel copyWith({
    UserProfileModel? user,
    BankPayment? bankPayment,
    String? planeExpireData,
    FlutterWavePayment? flutterWave,
    InstamojoPayment? instamojo,
    MolliPayStackPayment? molliPayStack,
    MolliPayStackPayment? paystack,
    PayPalPayment? payPal,
    PricePlan? pricePlan,
    RazorPayPayment? razorPay,
    StripePayment? stripe,
  }) {
    return PaymentModel(
      user: user ?? this.user,
      bankPayment: bankPayment ?? this.bankPayment,
      planeExpireData: planeExpireData ?? this.planeExpireData,
      flutterWave: flutterWave ?? this.flutterWave,
      instamojo: instamojo ?? this.instamojo,
      molliPayStack: molliPayStack ?? this.molliPayStack,
      paystack: paystack ?? this.paystack,
      payPal: payPal ?? this.payPal,
      pricePlan: pricePlan ?? this.pricePlan,
      razorPay: razorPay ?? this.razorPay,
      stripe: stripe ?? this.stripe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user!.toMap(),
      'bankPayment': bankPayment!.toMap(),
      'plan_expired_date': planeExpireData,
      'flutterwave': flutterWave!.toMap(),
      'instamojoPayment': instamojo!.toMap(),
      'mollie': molliPayStack!.toMap(),
      'paystack': paystack!.toMap(),
      'paypal': payPal!.toMap(),
      'pricing_plan': pricePlan!.toMap(),
      'razorpay': razorPay!.toMap(),
      'stripe': stripe!.toMap(),
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      user: map['user'] != null
          ? UserProfileModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      bankPayment: map['bankPayment'] != null
          ? BankPayment.fromMap(map['bankPayment'] as Map<String, dynamic>)
          : null,
      planeExpireData: map['plan_expired_date'] ?? '',
      flutterWave: map['flutterwave'] != null
          ? FlutterWavePayment.fromMap(
              map['flutterwave'] as Map<String, dynamic>)
          : null,
      instamojo: map['instamojoPayment'] != null
          ? InstamojoPayment.fromMap(
              map['instamojoPayment'] as Map<String, dynamic>)
          : null,
      molliPayStack: map['mollie'] != null
          ? MolliPayStackPayment.fromMap(map['mollie'] as Map<String, dynamic>)
          : null,
      paystack: map['paystack'] != null
          ? MolliPayStackPayment.fromMap(
              map['paystack'] as Map<String, dynamic>)
          : null,
      payPal: map['paypal'] != null
          ? PayPalPayment.fromMap(map['paypal'] as Map<String, dynamic>)
          : null,
      pricePlan: map['pricing_plan'] != null
          ? PricePlan.fromMap(map['pricing_plan'] as Map<String, dynamic>)
          : null,
      razorPay: map['razorpay'] != null
          ? RazorPayPayment.fromMap(map['razorpay'] as Map<String, dynamic>)
          : null,
      stripe: map['stripe'] != null
          ? StripePayment.fromMap(map['stripe'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      user!,
      bankPayment!,
      planeExpireData,
      flutterWave!,
      instamojo!,
      molliPayStack!,
      paystack!,
      payPal!,
      pricePlan!,
      razorPay!,
      stripe!,
    ];
  }
}
