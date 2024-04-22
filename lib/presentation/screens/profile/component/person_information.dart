import 'package:dotted_border/dotted_border.dart';
import 'package:real_estate/data/model/auth/mix_model_old_new_user.dart';
import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../data/model/agent/agent_profile_model.dart';
import '../../../../data/model/auth/login/user_data_model.dart';
import '../../../../logic/cubit/profile/profile_state_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class PersonInformation extends StatelessWidget {
  const PersonInformation({Key? key, required this.properties})
      : super(key: key);
  final AgentProfileModel properties;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileStateModel>(
      builder: (context, state) {
        final profile = state.profileState;
        if (profile is UserProfileLoaded) {
          return ProfileInLoaded(
            profile: profile.users!,
          );
        }
        // if (profile is AgentProfileLoaded) {
        //   return const ProfileInLoaded();
        // }
        return ProfileInLoaded(profile: profileCubit.users!);
      },
    );
  }
}

class ProfileInLoaded extends StatelessWidget {
  const ProfileInLoaded({Key? key, required this.profile}) : super(key: key);
  final UserDataModel profile;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final properties = context.read<ProfileCubit>().agentDetailModel;
    final profileCubit = context.read<ProfileCubit>();
    final appSetting = context.read<AppSettingCubit>();
    final image = profileCubit.usersModel!.image.isNotEmpty
        ? profileCubit.usersModel!.image
        : appSetting.settingModel!.setting.defaultAvatar;

    return SizedBox(
      height: 1.sh * 0.34,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            child: const CustomImage(
              path: KImages.profileBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 18.h,
            left: 9.w,
            child: Row(
              children: [
                //const SizedBox(width: 10.0),
                const BtnCycleBack(
                  isBackGroundWhite: true,
                ),
                SizedBox(width: 10.h),
                const CustomTextStyle(
                  text: 'My Profile',
                  fontWeight: FontWeight.w500,
                  fontSize: titleFontSize,
                  color: whiteColor,
                )
              ],
            ),
          ),
          Positioned.fill(
              top: -1.sh / 60.0,
              left: isIpad ? 20.w : 10.w,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: ClipOval(
                      child: CustomImage(
                        path: image,
                        height: 1.sh * 0.14,
                        width: 1.sh * 0.14,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.h),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: profile.nickname,
                        fontSize: profileNameFontSize,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                      // SizedBox(height: 8.h),
                      // if (profile.address.isNotEmpty)
                      //   Row(
                      //     children: [
                      //       const CustomImage(
                      //         path: KImages.locationIcon,
                      //         color: whiteColor,
                      //         height: iconSize,
                      //         width: iconSize,
                      //       ),
                      //       SizedBox(width: 6.h),
                      //       CustomTextStyle(
                      //         text: profile.address,
                      //         color: whiteColor,
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: subtitleFontSize,
                      //       ),
                      //     ],
                      //   ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          const CustomImage(
                            path: KImages.callIcon,
                            color: whiteColor,
                            height: iconSize,
                            width: iconSize,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 6.h),
                          CustomTextStyle(
                            text: profile.phone.isNotEmpty
                                ? profile.phone
                                : '+880 123-456-7890',
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: subtitleFontSize,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
          Positioned(
            right: size.width * 0.08,
            top: size.height * 0.03,
            child: ElevatedButton.icon(
              //onPressed: () => messageDialog(context),
              onPressed: () => Navigator.pushNamed(
                  context, RouteNames.viewProfileInfo,
                  arguments:
                      MixModelOldNewUser(profile, profileCubit.usersModel!)),
              // Navigator.pushNamed(
              //     context, RouteNames.updateProfileScreen,
              //     arguments: profile),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                backgroundColor: MaterialStateProperty.all(yellowColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                elevation: MaterialStateProperty.all(0.0),
                shadowColor: MaterialStateProperty.all(transparent),
                splashFactory: NoSplash.splashFactory,
              ),
              icon: const CustomImage(
                path: KImages.settingIcon03,
                color: blackColor,
                width: textFieldIconSize,
                height: textFieldIconSize,
              ),
              label: const CustomTextStyle(
                text: 'Edit',
                fontWeight: FontWeight.w500,
                fontSize: titleFontSize,
                color: blackColor,
              ),
            ),
          ),
          Positioned(
            bottom: -(1.sh * 0.05),
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 75.h,
              width: double.infinity,
              color: const Color(0xFFECEAFF),
              // color: whiteColor,
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: DottedBorder(
                color: primaryColor,
                dashPattern: const [6, 3],
                strokeCap: StrokeCap.square,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    propertiesCount(properties!.publishProperty, 'Property'),
                    propertiesCount(properties.totalPurchase, 'Purchase'),
                    //propertiesCount(properties.totalWishlist, 'Wishlist'),
                    // propertiesCount(properties.awaitingProperty, 'Awaiting'),
                    // propertiesCount(properties.rejectProperty, 'Rejected'),
                    propertiesCount(properties.totalReview, 'Reviewed'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget propertiesCount(int count, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextStyle(
            text: count.toString().padLeft(2, '0'),
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
            color: blackColor),
        SizedBox(height: 5.h),
        CustomTextStyle(
            text: title,
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.w400,
            color: grayColor),
      ],
    );
  }
}
