import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/data/data_provider/remote_data_source.dart';
import 'package:real_estate/data/model/product/property_choose_model.dart';
import '../../../data/model/create_property/create_property_model.dart';
import '../../bloc/login/login_bloc.dart';
import '../../repository/property_repository.dart';
part 'create_info_state.dart';

class CreateInfoCubit extends Cubit<CreateInfoState> {
  final PropertyRepository _repository;
  final LoginBloc _loginBloc;
  final RemoteDataSource _remoteDataSource;

  CreateInfoCubit(
      {required PropertyRepository repository,
      required LoginBloc loginBloc,
      required RemoteDataSource remoteDataSource})
      : _repository = repository,
        _loginBloc = loginBloc,
        _remoteDataSource = remoteDataSource,
        super(CreateInfoInitial()) {
    getCreateInfo('rent');
    getCheckPricing('rent');
  }

  late CreatePropertyInfo createPropertyInfo;
  PropertyChooseModel? chooseProperty;
  String checkStatusPricing = "";

  // late GoogleMapController mapController;
  // Set<Marker> markers = {};
  // CameraPosition initialCameraPosition = const CameraPosition(target: LatLng(12.5260111,104.7209413), zoom: 6);
  // String latitude = "";
  // String longitude = "";

  Future getCurrentLocation(context) async {
    // try {
    //   LocationPermission permission;
    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       return Future.error('Location permissions are denied');
    //     }
    //   }
    //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(double.parse(latitude), double.parse(longitude)), zoom: 18)));

    //   return position;
    // } catch (e) {
    //   Utils.errorSnackBar(context, e.toString());
    //   // Utils.errorSnackBar(context, "Unable to get current position!");
    // }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    // print("cammer move=========");
    // print(cameraPosition.target.latitude.toString());
    // mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: cameraPosition.target, zoom: 18)));
    //    markers.clear();
    //                                   markers.add(Marker(
    //                                     markerId: MarkerId("currentLocation"),
    //                                     position: LatLng(double.parse(latitude), double.parse(longitude))
    //                                   ));
  }

  Future<void> getCreateInfo(String purpose) async {
    emit(CreateInfoLoading());
    final result = await _repository.getPropertyCreateInfo(
        _loginBloc.userInfo!.tokenModel.accessToken, purpose);

    result.fold((failuer) {
      emit(CreateInfoError(
          error: failuer.message, statusCode: failuer.statusCode));
    }, (data) {
      createPropertyInfo = data;
      emit(CreateInfoLoaded(infoData: data));
    });
  }

  Future<void> getCheckPricing(String purpose) async {
    try {
      print("object=========");
      final result = await _remoteDataSource.getCheckPricing(
          _loginBloc.userInfo!.tokenModel.accessToken, purpose);

      checkStatusPricing = result['is_subscribe'].toString();
    } catch (e) {
       print("error=========");
      checkStatusPricing = "false";
    }
  }

  Future<void> getPropertyChooseInfo() async {
    emit(CreateInfoLoading());
    final result = await _repository
        .getPropertyChooseInfo(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((failure) {
      emit(CreateInfoError(
          error: failure.message, statusCode: failure.statusCode));
    }, (data) {
      chooseProperty = data;
      emit(PropertyChooseInfoLoaded(data));
    });
  }
}
