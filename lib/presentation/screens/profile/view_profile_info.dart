import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/logic/cubit/profile/profile_cubit.dart';
import 'package:real_estate/logic/cubit/setting/app_setting_cubit.dart';
import 'package:real_estate/presentation/screens/profile/component/row_text_style.dart';

import '../../../data/model/auth/login/user_data_model.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../router/route_names.dart';
import '../../router/route_packages_name.dart';
import '../../utils/constraints.dart';
import '../../utils/utils.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_images.dart';
import '../../widget/custom_test_style.dart';
import 'component/custom_title_with_button.dart';

class ViewProfileInfo extends StatelessWidget {
  final UserDataModel profile;
  final UserProfileModel userModel;
  const ViewProfileInfo(
      {super.key, required this.profile, required this.userModel});

  @override
  Widget build(BuildContext context) {
    // final appSetting = context.read<AppSettingCubit>();
    final profileCubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile Information',
      ),
      body: BlocListener<ProfileCubit, ProfileStateModel>(
        listener: (context, state) {
          final profile = state.profileState;
          if (profile is ProfileUpdateLoaded) {
            Utils.showSnackBar(context, profile.message);
            profileCubit.getAgentProfile();
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileStateModel>(
          builder: (context, state) {
            final profileState = state.profileState;
            if (profileState is AgentProfileLoaded) {
              return UserInformationBloc(
                profile: profile,
              );
            }
            return UserInformationBloc(
              profile: profile,
            );
          },
        ),
      ),
    );
  }
}

class UserInformationBloc extends StatelessWidget {
  final UserDataModel profile;
  const UserInformationBloc({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final appSetting = context.read<AppSettingCubit>();
    final profileCubit = context.read<ProfileCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25.0,
          ),
          Center(
            child: ClipOval(
              child: CustomImage(
                path: profileCubit.usersModel!.image != ""
                    ? profileCubit.usersModel!.image
                    : appSetting.settingModel!.setting.defaultAvatar,
                height: 1.sh * 0.14,
                width: 1.sh * 0.14,
                fit: BoxFit.cover,
              ),
            ),
          ),
          defaultVerticalSpace,
          const CustomTextStyle(
              text: "Basic Information",
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
              color: blackColor),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "First Name",
            value: profile.firstName,
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Last Name",
            value: profile.lastName,
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Phone",
            value: profile.phone,
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Email",
            value: profile.email,
          ),
          // defaultVerticalSpace,
          CustomTitleWithButton(
            title: "More Information",
            onTap: () {
              Navigator.pushNamed(context, RouteNames.updateProfileScreen,
                  arguments: profileCubit.usersModel);
            },
          ),

          // defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Address",
            value: profileCubit.usersModel!.address != ""
                ? profileCubit.usersModel!.address
                : "N/A",
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Designation",
            value: profileCubit.usersModel!.designation != ""
                ? profileCubit.usersModel!.designation
                : "N/A",
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "About",
            value: profileCubit.usersModel!.aboutMe != ""
                ? profileCubit.usersModel!.aboutMe
                : "N/A",
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Facebook",
            value: profileCubit.usersModel!.facebook != ""
                ? profileCubit.usersModel!.facebook
                : "N/A",
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Twitter",
            value: profileCubit.usersModel!.twitter != ""
                ? profileCubit.usersModel!.twitter
                : "N/A",
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "LinkedIn",
            value: profileCubit.usersModel!.linkedin != ""
                ? profileCubit.usersModel!.linkedin
                : "N/A",
          ),
          defaultVerticalSpace,
          CustomRowTextStyle(
            title: "Instagram",
            value: profileCubit.usersModel!.instagram != ""
                ? profileCubit.usersModel!.instagram
                : "N/A",
          ),
        ],
      ),
    );
  }
}
