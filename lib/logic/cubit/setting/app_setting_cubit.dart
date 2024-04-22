import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/presentation/screens/on_boarding/model/on_boarding_model.dart';
import '../../../data/model/setting/setting_model.dart';

import '../../../data/model/setting/website_setup_model.dart';
import '../../repository/app_setting_repository.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  final _className = 'AppSettingCubit';
  final AppSettingRepository _appSettingRepository;

  final onBoarding = <OnBoardingModel>[];
  WebsiteSetupModel? settingModel;
  AppSettingCubit(AppSettingRepository appSettingRepository)
      : _appSettingRepository = appSettingRepository,
        super(const AppSettingStateInitial()) {
    init();
    loadWebSetting();
  }

  bool get isOnBoardingShown =>
      _appSettingRepository.checkOnBoarding().fold((l) => false, (r) => true);

  Future<bool> cachOnBoarding() async {
    final result = await _appSettingRepository.cashOnBoarding();

    return result.fold((l) => false, (success) => success);
  }

  void init() {
    emit(const AppSettingStateInitial());
    final localSetting = _appSettingRepository.getCachedWebsiteSetup();

    localSetting.fold(
      (failure) {
        log(failure.toString(), name: _className);
        emit(const AppSettingStateNotCashed('Not cashed app setting'));
      },
      (value) {
        settingModel = value;
        onBoarding.clear();
        onBoarding.add(OnBoardingModel(
          image: value.mobileAppContent.onboardingOneIcon,
          title: value.mobileAppContent.onboardingOneTitle,
          description: value.mobileAppContent.onboardingOneDescription,
          indicator: '',
        ));

        onBoarding.add(OnBoardingModel(
          image: value.mobileAppContent.onboardingTwoIcon,
          title: value.mobileAppContent.onboardingTwoTitle,
          description: value.mobileAppContent.onboardingTwoDescription,
          indicator: '',
        ));

        onBoarding.add(OnBoardingModel(
          image: value.mobileAppContent.onboardingThreeIcon,
          title: value.mobileAppContent.onboardingThreeTitle,
          description: value.mobileAppContent.onboardingThreeDescription,
          indicator: '',
        ));
        log('init success', name: _className);
        emit(AppSettingStateLoaded(value));
      },
    );
  }

  Future<void> loadWebSetting() async {
    emit(const AppSettingStateLoading());
    final result = await _appSettingRepository.websiteSetup();
    result.fold(
      (failure) {
        emit(AppSettingStateError(failure.message, failure.statusCode));
      },
      (value) {
        final stateData = AppSettingStateLoaded(value);
        onBoarding.clear();
        onBoarding.add(OnBoardingModel(
          image: value.mobileAppContent.onboardingOneIcon,
          title: value.mobileAppContent.onboardingOneTitle,
          description: value.mobileAppContent.onboardingOneDescription,
          indicator: '',
        ));

        onBoarding.add(OnBoardingModel(
          image: value.mobileAppContent.onboardingTwoIcon,
          title: value.mobileAppContent.onboardingTwoTitle,
          description: value.mobileAppContent.onboardingTwoDescription,
          indicator: '',
        ));

        onBoarding.add(OnBoardingModel(
          image: value.mobileAppContent.onboardingThreeIcon,
          title: value.mobileAppContent.onboardingThreeTitle,
          description: value.mobileAppContent.onboardingThreeDescription,
          indicator: '',
        ));
        settingModel = value;
        emit(stateData);
      },
    );
  }
}
