import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product/property_item_model.dart';
import '../../../data/model/wishlist/wishlist_model.dart';
import '../../bloc/login/login_bloc.dart';
import '../../repository/wishlist_repository.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final LoginBloc _loginBloc;
  final WishListRepository _wishListRepository;

  WishlistCubit({
    required LoginBloc loginBloc,
    required WishListRepository wishListRepository,
  })  : _loginBloc = loginBloc,
        _wishListRepository = wishListRepository,
        super(const WishlistInitial()) {
    getWishListProperties();
  }
  List<PropertyItemModel> wishlist = [];
  int statusCode = 0;

  Future<void> getWishListProperties() async {
    debugPrint(
        "--------------- get whistlist : ${_loginBloc.userInfo!.tokenModel.accessToken}");
    emit(WishListLoading());

    final result = await _wishListRepository
        .getWishListProperties(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((failure) {
      final error = WishListError(failure.message, failure.statusCode);

      //----- add status to check UnAuthenticated in main page screen -------
      statusCode = failure.statusCode;
      emit(error);
    }, (success) {
      wishlist = success.properties!.data!;
      emit(WishListLoaded(success));
    });
  }

  Future<void> addToWishlist(String id) async {
    emit(AddToWishlistLoading());
    final result = await _wishListRepository.addToWishlist(
        _loginBloc.userInfo!.tokenModel.accessToken, id);

    result.fold((failure) {
      final error = WishListError(failure.message, failure.statusCode);
      emit(error);
    }, (success) {
      emit(AddToWishlistLoad(success));
    });
    //return result;
  }

  Future<void> removeFromWishlist(String id) async {
    emit(RemoveFromWishlistLoading());
    final result = await _wishListRepository.removeFromWishlist(
        _loginBloc.userInfo!.tokenModel.accessToken, id);

    result.fold((failure) {
      final error = WishListError(failure.message, failure.statusCode);
      emit(error);
      return false;
    }, (success) {
      wishlist.removeWhere((element) => element.id.toString() == id);
      emit(RemoveFromWishlistLoad(success));
      return true;
    });
    // return result;
  }
}
