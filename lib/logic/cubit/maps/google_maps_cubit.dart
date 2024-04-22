import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/logic/cubit/maps/google_maps_state_model.dart';
import 'package:real_estate/state_inject_package_names.dart';
part 'google_maps_state.dart';

class GoogleMapsCubit extends Cubit<LatLngModel> {
  GoogleMapsCubit():super(LatLngModel());
  
  // Completer<GoogleMapController> googleMapController = Completer();
  late GoogleMapController googleMapController;
  CameraPosition? cameraPosition;
  double zoom = 17.5;
  String currentLat = "";
  String currentLng = "";
  String smsUserDeniedPermission = "";
  bool isLoadMap = true;
  bool isDefault = false;

  _initMap(LatLng latLng) async{
    cameraPosition = CameraPosition(
      target: latLng,
      zoom: zoom
    );
  isLoadMap = false;
  }

  Future currentPosition(String lat, String lng) async {
    emit(state.copyWith(googleMapsState: const GoogleMapsInitial()));
    LatLng latLng;
    if(lat =="" && lng ==""){
      print("currentLat ===========1");
      LatLng currentPosition = await determineUserCurrentPosition();
      currentLat = currentPosition.latitude.toString();
      currentLng = currentPosition.longitude.toString();
      print("currentLat ===========2");
      print(currentLat);
      latLng = LatLng(currentPosition.latitude, currentPosition.longitude);
    }else{
      latLng = LatLng(double.parse(lat), double.parse(lng));
    }
  
    await _initMap(latLng);
    emit(state.copyWith(googleMapsState:GoogleMapsGetPositionLoaded()));
  }

  Future <void> goToCurrentPosition(String cLat, String cLng) async {
    emit(state.copyWith(googleMapsState: GoogleMapsLoading()));
    String _lat;
    String _lng;
    if(cLat == "" && cLng == ""){
      LatLng currentPosition = await determineUserCurrentPosition();
      _lat = currentPosition.latitude.toString();
      _lng = currentPosition.longitude.toString();

    }else {
      _lat = cLat;
      _lng = cLng;
    }
    animateTo(_lat, _lng);
    emit(state.copyWith(googleMapsState:GoogleMapsGetPositionLoaded()));
  }

  Future <void> animateTo(String cLat, String cLng) async {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
        target: LatLng(double.parse(cLat), double.parse(cLng)),
        zoom: zoom
        )
      )
    );
    currentLat = cLat;
    currentLng = cLng;
  }

  Future determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    LatLng latLng;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if(!isLocationServiceEnabled) {
      print("user don't enable location permission============");
    }



    locationPermission = await Geolocator.checkPermission();
    // print(isLocationServiceEnabled);
    // print("========== permission");
    // print(locationPermission);

    // // check if user denied location and retry requesting for permission
    // if(locationPermission == LocationPermission.denied) {
    //   locationPermission = await Geolocator.requestPermission();
    //   if(locationPermission == LocationPermission.denied) {
    //     smsUserDeniedPermission = "You've denied your current location permission.";
    //     print("user denied location permission========");
    //   }
    // }
    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {
        smsUserDeniedPermission = "You've denied your current location permission.";
      }
    }
    // check if user denied permission forever
    if(locationPermission == LocationPermission.deniedForever) {
      smsUserDeniedPermission = "You've denied your current location permission.";
    }

    if(locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever){
      LatLng defaultLatLng =  LatLng(11.576103,104.9228033);
      isDefault = true;
      latLng = defaultLatLng;
    }else{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      latLng = currentLatLng;
    }
    return latLng;
  }

  Future <void> permissionGoogleMaps()async{
    LocationPermission locationPermission;
    locationPermission = await Geolocator.checkPermission();
    // check if user denied location and retry requesting for permission
    if(locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        smsUserDeniedPermission = "You've denied your current location permission.";
        isDefault = true;
      }
    }
  }

  Future <void> clearCurrentLatLng() async {
    currentLat = "";
    currentLng = "";
    smsUserDeniedPermission = "";
    isLoadMap = true;
    isDefault = false;
  }

}
