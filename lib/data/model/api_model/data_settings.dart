import 'dart:convert';

import 'package:equatable/equatable.dart';

class DataSettings extends Equatable {
  final int enableRegister;
  final int enableRefCode;
  final int hideMembership;

  const DataSettings(
      {required this.enableRefCode,
      required this.enableRegister,
      required this.hideMembership});

  DataSettings copyWith({
    int? enableRegister,
    int? enableRefCode,
    int? hideMembership,
  }) {
    return DataSettings(
      enableRegister: enableRegister ?? this.enableRegister,
      enableRefCode: enableRefCode ?? this.enableRefCode,
      hideMembership: hideMembership ?? this.hideMembership,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enable_register': enableRegister,
      'enable_ref_code': enableRefCode,
      'hide_membership': hideMembership,
    };
  }

  factory DataSettings.fromMap(Map<String, dynamic> map) {
    return DataSettings(
      enableRegister: map['enable_register'] ?? 0,
      enableRefCode: map['enable_ref_code'] ?? 0,
      hideMembership: map['hide_membership'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSettings.fromJson(String source) =>
      DataSettings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [enableRegister, enableRefCode, hideMembership];
}
