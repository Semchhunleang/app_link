import 'dart:developer';
import 'package:real_estate/data/model/api_model/setting_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/error/exception.dart';
import '../../presentation/utils/k_strings copy.dart';
import '../model/auth/login/login_data_model.dart';
import '../model/auth/login/user_data_model.dart';
import '../model/auth/user_login_response_model.dart';
import '../model/setting/website_setup_model.dart';

abstract class LocalDataSource {
  /// Gets the cached [UserLoginResponseModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  LoginDataModel getUserResponseModel();

  Future<bool> cacheUserResponse(LoginDataModel userLoginResponseModel);

  Future<bool> cacheUserProfile(UserDataModel userProfileModel);
  //Future<bool> cacheAgentProfile(UserProfileModel userModel);

  Future<bool> clearUserProfile();
  Future<bool> clearCoupon();

  bool checkOnBoarding();

  Future<bool> cacheOnBoarding();

  WebsiteSetupModel getWebsiteSetting();
  SettingApiModel getSettings();
}

class LocalDataSourceImpl implements LocalDataSource {
  final _className = 'LocalDataSourceImpl';
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  LoginDataModel getUserResponseModel() {
    final jsonString =
        sharedPreferences.getString(KStrings.cachedUserResponseKey);
    if (jsonString != null) {
      return LoginDataModel.fromJson(jsonString);
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  @override
  Future<bool> cacheUserResponse(LoginDataModel userLoginResponseModel) {
    return sharedPreferences.setString(
      KStrings.cachedUserResponseKey,
      userLoginResponseModel.toJson(),
    );
  }

  @override
  Future<bool> cacheUserProfile(UserDataModel userProfileModel) {
    final user = getUserResponseModel();
    user.userDataModel != userProfileModel;
    return cacheUserResponse(user);
  }

  @override
  Future<bool> clearUserProfile() {
    return sharedPreferences.remove(KStrings.cachedUserResponseKey);
  }

  @override
  bool checkOnBoarding() {
    final jsonString = sharedPreferences.getBool(KStrings.cachOnboardingKey);
    if (jsonString != null) {
      return true;
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  @override
  Future<bool> cacheOnBoarding() {
    return sharedPreferences.setBool(KStrings.cachOnboardingKey, true);
  }

  @override
  Future<bool> clearCoupon() {
    // TODO: implement clearCoupon
    throw UnimplementedError();
  }

  // @override
  // Future<bool> cacheWebsiteSetting(WebsiteSetupModel settingModel) async {
  //   log(settingModel.toJson(), name: _className);
  //   return sharedPreferences.setString(
  //       KStrings.cachedWebSettingKey, settingModel.toJson());
  // }

  @override
  WebsiteSetupModel getWebsiteSetting() {
    final jsonString =
        sharedPreferences.getString(KStrings.cachedWebSettingKey);
    log(jsonString.toString(), name: _className);
    if (jsonString != null) {
      return WebsiteSetupModel.fromJson(jsonString);
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  @override
  SettingApiModel getSettings() {
    final jsonString =
        sharedPreferences.getString(KStrings.cachedWebSettingKey);
    log(jsonString.toString(), name: _className);
    if (jsonString != null) {
      return SettingApiModel.fromJson(jsonString);
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  // @override
  // Future<bool> cacheAgentProfile(UserProfileModel userModel) {
  //   final user = getUserResponseModel();
  //   user.userDataModel != userModel;
  //   return cacheUserResponse(user);
  // }
}
