import 'dart:convert';

class FilterOptionsModel {
    DateNow? dateNow;
    List<DateFilter>? dateFilter;

    FilterOptionsModel({
        this.dateNow,
        this.dateFilter,
    });

    factory FilterOptionsModel.fromRawJson(String str) => FilterOptionsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FilterOptionsModel.fromJson(Map<String, dynamic> json) => FilterOptionsModel(
        dateNow: json["date_now"] == null ? null : DateNow.fromJson(json["date_now"]),
        dateFilter: json["date_filter"] == null ? [] : List<DateFilter>.from(json["date_filter"]!.map((x) => DateFilter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date_now": dateNow?.toJson(),
        "date_filter": dateFilter == null ? [] : List<dynamic>.from(dateFilter!.map((x) => x.toJson())),
    };
}

class DateFilter {
    String? key;
    DateTime? startDate;
    DateTime? endDate;

    DateFilter({
        this.key,
        this.startDate,
        this.endDate,
    });

    factory DateFilter.fromRawJson(String str) => DateFilter.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DateFilter.fromJson(Map<String, dynamic> json) => DateFilter(
        key: json["key"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    };
}

class DateNow {
    DateTime? startDate;
    DateTime? endDate;

    DateNow({
        this.startDate,
        this.endDate,
    });

    factory DateNow.fromRawJson(String str) => DateNow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DateNow.fromJson(Map<String, dynamic> json) => DateNow(
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    };
}
