import 'dart:developer';

import 'package:real_estate/data/model/api_model/setting_api_model.dart';
import 'package:real_estate/logic/cubit/api_model/settings_state.dart';
import 'package:real_estate/state_inject_package_names.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingRepository _settingRepository;
  final _className = 'Settings';

  SettingCubit({required SettingRepository settingRepository})
      : _settingRepository = settingRepository,
        super(SettingInitial());

  SettingApiModel? settingApiModel;

  Future<void> getSettings() async {
    debugPrint("------------- get Setting 1");
    emit(SettingLoading());
    debugPrint("------------- get Setting 2");
    final result = await _settingRepository.getSettings();
    debugPrint("------------- get Setting 3");
    result.fold((l) {
      log(l.toString(), name: _className);
      emit(SettingError(l.message, l.statusCode));
    }, (r) {
      debugPrint("------------- get Setting 4");
      settingApiModel = r;
      debugPrint(
          "------------- get Setting 5 : ${settingApiModel!.dataSettings!.enableRefCode}");
      emit(SettingLoaded(r));
    });
  }
}
