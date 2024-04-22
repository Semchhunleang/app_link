import 'dart:convert';

import 'google_maps_cubit.dart';

class LatLngModel{
    final String lat;
    final String lng;
    final GoogleMapsState googleMapsState;
    LatLngModel({
        this.lat = "",
        this.lng = "",
        this.googleMapsState = const GoogleMapsInitial(),
    });

    factory LatLngModel.fromRawJson(String str) => LatLngModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    LatLngModel copyWith({
      String? lat,
      String? lng,
      GoogleMapsState? googleMapsState
      }) => LatLngModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      googleMapsState : googleMapsState ?? this.googleMapsState
    );
  

    factory LatLngModel.fromJson(Map<String, dynamic> json) => LatLngModel(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
