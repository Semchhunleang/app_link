import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/utils/utils.dart';

import '../../../data/model/agent/agent_profile_model.dart';
import '../../../data/model/auth/auth_error_model.dart';
import '../../../data/model/auth/login/user_data_model.dart';
import '../../../data/model/auth/user_profile_model.dart';
import '../../../presentation/error/failure.dart';
import '../../bloc/login/login_bloc.dart';
import '../../repository/profile_repository.dart';
import 'profile_state_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStateModel> {
  final ProfileRepository _profileRepository;
  final LoginBloc _loginBloc;

  ProfileCubit({
    required ProfileRepository profileRepository,
    required LoginBloc loginBloc,
  })  : _profileRepository = profileRepository,
        _loginBloc = loginBloc,
        super(const ProfileStateModel());

  void nameChange(String text) {
    emit(state.copyWith(name: text, profileState: const ProfileInitial()));
  }

  // void firstNameChange(String text) {
  //   emit(state.copyWith(firstName: text, profileState: const ProfileInitial()));
  // }

  // void lastNameChange(String text) {
  //   emit(state.copyWith(lastName: text, profileState: const ProfileInitial()));
  // }

  void phoneChange(String text) {
    emit(state.copyWith(phone: text, profileState: const ProfileInitial()));
  }

  void addressChange(String text) {
    emit(state.copyWith(address: text, profileState: const ProfileInitial()));
  }

  void designationChange(String text) {
    emit(state.copyWith(
        designation: text, profileState: const ProfileInitial()));
  }

  void aboutMeChange(String text) {
    emit(state.copyWith(aboutMe: text, profileState: const ProfileInitial()));
  }

  void facebookChange(String text) {
    emit(state.copyWith(facebook: text, profileState: const ProfileInitial()));
  }

  void twitterChange(String text) {
    emit(state.copyWith(twitter: text, profileState: const ProfileInitial()));
  }

  void linkedinChange(String text) {
    emit(state.copyWith(linkedin: text, profileState: const ProfileInitial()));
  }

  void instagramChange(String text) {
    emit(state.copyWith(instagram: text, profileState: const ProfileInitial()));
  }

  Future<void> imageChange() async {
    var imageSourcePath = await Utils.pickSingleImage();
    if (imageSourcePath != "") {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageSourcePath!,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: primaryColor,
              toolbarWidgetColor: whiteColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile != null && croppedFile.path != "") {
        emit(state.copyWith(
            image: croppedFile.path, profileState: const ProfileInitial()));
      }
    }
  }

  AgentProfileModel? agentDetailModel;

  Future<void> getAgentDashboardInfo() async {
    emit(state.copyWith(profileState: ProfileLoading()));
    final result = await _profileRepository
        .getAgentDashboardInfo(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold(
        (failure) => emit(state.copyWith(
            profileState: ProfileError(failure.message, failure.statusCode))),
        (success) {
      agentDetailModel = success;
      emit(state.copyWith(profileState: ProfileLoaded(success)));
    });
  }

//---------------- old api of update profile user -------------------------
  Future<void> updateAgentProfileInfo() async {
    emit(state.copyWith(profileState: ProfileUpdateLoading()));
    print('stateBody: $state');
    final result = await _profileRepository.updateAgentProfileInfo(
        _loginBloc.userInfo!.tokenModel.accessToken, state);
    result.fold((failure) {
      if (failure is InvalidAuthData) {
        final errors = ProfileUpdateFormValidate(failure.errors);
        emit(state.copyWith(profileState: errors));
      } else {
        final errors = ProfileUpdateError(failure.message, failure.statusCode);
        emit(state.copyWith(profileState: errors));
      }
    }, (success) {
      emit(state.copyWith(profileState: ProfileUpdateLoaded(success)));
      //  emit(state.clear());
    });
  }

//--------------- new api of update profile info ------------------
  Future<void> updateUserProfileInfo() async {
    emit(state.copyWith(profileState: ProfileUpdateLoading()));
    print('stateBody: $state');
    final result = await _profileRepository.updateUserProfileInfo(
        _loginBloc.userInfo!.tokenModel.accessToken, state);
    result.fold((failure) {
      if (failure is InvalidAuthData) {
        final errors = ProfileUpdateFormValidate(failure.errors);
        emit(state.copyWith(profileState: errors));
      } else {
        final errors = ProfileUpdateError(failure.message, failure.statusCode);
        emit(state.copyWith(profileState: errors));
      }
    }, (success) {
      emit(state.copyWith(profileState: ProfileUpdateLoaded(success)));
      //  emit(state.clear());
    });
  }

  //------------- old api get user info --------------------
  UserProfileModel? usersModel;
  Future<void> getAgentProfile() async {
    emit(state.copyWith(profileState: ProfileLoading()));
    // debugPrint(_loginBloc.userInfo!.tokenModel.accessToken);
    final result = await _profileRepository
        .getAgentProfile(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((failure) {
      //----- add status to check UnAuthenticated in splash screen -------

      statusCode = failure.statusCode;

      debugPrint("Status code agent profile : $statusCode");

      emit(
        state.copyWith(
          profileState: ProfileError(failure.message, failure.statusCode),
        ),
      );
    }, (success) {
      usersModel = success;
      emit(
        state.copyWith(
          profileState: AgentProfileLoaded(success),
        ),
      );
    });
  }

  //----------------- new api get user info ----------------
  int statusCode = 0;
  UserDataModel? users;
  Future<void> getUserProfile() async {
    emit(state.copyWith(profileState: ProfileLoading()));
    debugPrint(_loginBloc.userInfo!.tokenModel.accessToken);
    final result = await _profileRepository
        .getUserProfile(_loginBloc.userInfo!.tokenModel.accessToken);
    result.fold((failure) {
      //----- add status to check UnAuthenticated in splash screen -------

      statusCode = failure.statusCode;

      debugPrint("Status code agent profile : $statusCode");

      emit(
        state.copyWith(
          profileState: ProfileError(failure.message, failure.statusCode),
        ),
      );
    }, (success) {
      users = success;
      emit(
        state.copyWith(
          profileState: UserProfileLoaded(success),
        ),
      );
    });
  }
}
