// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BankPayment extends Equatable {
  final int id;
  final int status;
  final String accountInfo;
  final String image;

  const BankPayment({
    required this.id,
    required this.status,
    required this.accountInfo,
    required this.image,
  });

  BankPayment copyWith({
    int? id,
    int? status,
    String? accountInfo,
    String? image,
  }) {
    return BankPayment(
      id: id ?? this.id,
      status: status ?? this.status,
      accountInfo: accountInfo ?? this.accountInfo,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'account_info': accountInfo,
      'image': image,
    };
  }

  factory BankPayment.fromMap(Map<String, dynamic> map) {
    return BankPayment(
      id: map['id'] ?? 0,
      status: map['status'] != null ? int.parse(map['status'].toString()) : 0,
      accountInfo: map['account_info'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BankPayment.fromJson(String source) =>
      BankPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, status, accountInfo, image];
}
