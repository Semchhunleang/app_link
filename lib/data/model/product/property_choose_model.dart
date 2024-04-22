import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyChooseModel extends Equatable {
  final String rentLogo;
  final String rentTitle;
  final String rentDescription;
  final String rentBtnText;
  final String saleLogo;
  final String saleTitle;
  final String saleDescription;
  final String saleBtnText;

  const PropertyChooseModel({
    required this.rentLogo,
    required this.rentTitle,
    required this.rentDescription,
    required this.rentBtnText,
    required this.saleLogo,
    required this.saleTitle,
    required this.saleDescription,
    required this.saleBtnText,
  });

  PropertyChooseModel copyWith({
    String? rentLogo,
    String? rentTitle,
    String? rentDescription,
    String? rentBtnText,
    String? saleLogo,
    String? saleTitle,
    String? saleDescription,
    String? saleBtnText,
  }) {
    return PropertyChooseModel(
      rentLogo: rentLogo ?? this.rentLogo,
      rentTitle: rentTitle ?? this.rentTitle,
      rentDescription: rentDescription ?? this.rentDescription,
      rentBtnText: rentBtnText ?? this.rentBtnText,
      saleLogo: saleLogo ?? this.saleLogo,
      saleTitle: saleTitle ?? this.saleTitle,
      saleDescription: saleDescription ?? this.saleDescription,
      saleBtnText: saleBtnText ?? this.saleBtnText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rent_logo': rentLogo,
      'rent_title': rentTitle,
      'rent_description': rentDescription,
      'rent_btn_text': rentBtnText,
      'sale_logo': saleLogo,
      'sale_title': saleTitle,
      'sale_description': saleDescription,
      'sale_btn_text': saleBtnText,
    };
  }

  factory PropertyChooseModel.fromMap(Map<String, dynamic> map) {
    return PropertyChooseModel(
      rentLogo: map['rent_logo'] ?? '',
      rentTitle: map['rent_title'] ?? '',
      rentDescription: map['rent_description'] ?? '',
      rentBtnText: map['rent_btn_text'] ?? '',
      saleLogo: map['sale_logo'] ?? '',
      saleTitle: map['sale_title'] ?? '',
      saleDescription: map['sale_description'] ?? '',
      saleBtnText: map['sale_btn_text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyChooseModel.fromJson(String source) =>
      PropertyChooseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      rentLogo,
      rentTitle,
      rentDescription,
      rentBtnText,
      saleLogo,
      saleTitle,
      saleDescription,
      saleBtnText,
    ];
  }
}
