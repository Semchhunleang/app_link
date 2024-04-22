import 'dart:convert';

import 'package:real_estate/logic/cubit/apier/apier_cubit.dart';

class ApierStateModel {
    final bool? showOptions;
    final String? selectedOption;
    final String? startDate;
    final String? endDate;
    final ApierState apierState;

    ApierStateModel({
        this.showOptions,
        this.selectedOption,
        this.startDate,
        this.endDate,
        this.apierState = const ApierInitial()
    });

    ApierStateModel copyWith({
        bool? showOptions,
        String? selectedOption,
        String? startDate,
        String? endDate,
        ApierState? apierState
    }) => 
        ApierStateModel(
            showOptions: showOptions ?? this.showOptions,
            selectedOption: selectedOption ?? this.selectedOption,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            apierState: apierState ?? this.apierState
        );

    factory ApierStateModel.fromRawJson(String str) => ApierStateModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApierStateModel.fromJson(Map<String, dynamic> json) => ApierStateModel(
        showOptions: json["show_options"],
        selectedOption: json["selected_option"],
        startDate: json["start_date"],
        endDate: json["end_date"],
    );

    Map<String, dynamic> toJson() => {
        "show_options": showOptions,
        "selected_option": selectedOption,
        "start_date": startDate,
        "end_date": endDate
    };
}
