import 'package:real_estate/data/model/auth/login/user_data_model.dart';
import 'package:real_estate/data/model/auth/user_profile_model.dart';

class MixModelOldNewUser {
  final UserDataModel userDataModel;
  final UserProfileModel userProfileModel;

  const MixModelOldNewUser(this.userDataModel, this.userProfileModel);
}
