import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/utils/utils.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../data/model/auth/mix_model_old_new_user.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../router/route_names.dart';
import 'component/single_elements.dart';

class AllSettingScreen extends StatelessWidget {
  const AllSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: settingAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20.h),
          const CustomTextStyle(
            text: 'My Profile',
            fontWeight: FontWeight.w500,
            fontSize: titleFontSize,
            color: primaryColor,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(radius)),
            child: Column(
              children: [
                SingleElement(
                  icon: KImages.settingIcon01,
                  text: 'All Category',
                  onTap: () => Navigator.pushNamed(
                      context, RouteNames.allCategoryScreen),
                ),
                SingleElement(
                  icon: KImages.settingIcon02,
                  text: 'My Profile',
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.profileScreen),
                ),
                SingleElement(
                  icon: KImages.settingIcon03,
                  text: 'Edit Profile',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.viewProfileInfo,
                        arguments: MixModelOldNewUser(
                            profile.users!, profile.usersModel!));
                    // Navigator.pushNamed(context, RouteNames.viewProfileInfo,
                    //     arguments: profile.users);
                  },
                ),
                // SingleElement(
                //     icon: KImages.settingIcon04,
                //     text: 'My Deals',
                //     onTap: () {}),
                SingleElement(
                  icon: KImages.settingIcon05,
                  text: 'About us',
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.aboutUsScreen),
                ),
                SingleElement(
                    icon: KImages.settingIcon06,
                    text: 'Review',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.reviewScreen)),
                SingleElement(
                  icon: KImages.settingIcon07,
                  text: 'Support/Contact us',
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.contactUsScreen),
                  // onTap: () => contactUsDialog(context),
                ),
                SingleElement(
                  icon: KImages.savedActive,
                  text: 'Saved',
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.mySavedScreen),
                  // onTap: () => contactUsDialog(context),
                ),
              ],
            ),
          ),
          const CustomTextStyle(
            text: 'Settings',
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
            color: primaryColor,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 18.h),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(radius)),
            child: Column(
              children: [
                // SingleElement(
                //     icon: KImages.settingIcon08, text: 'Setting', onTap: () {}),
                // SingleElement(
                //   icon: KImages.settingIcon14,
                //   text: 'Purchase History',
                //   onTap: () =>
                //       Navigator.pushNamed(context, RouteNames.purchaseScreen),
                // ),
                SingleElement(
                  icon: KImages.settingIcon07,
                  text: 'Terms & Conditions',
                  onTap: () => Navigator.pushNamed(
                      context, RouteNames.termsAndConditionScreen),
                ),
                SingleElement(
                  icon: KImages.settingIcon10,
                  text: 'Privacy Policy',
                  onTap: () => Navigator.pushNamed(
                      context, RouteNames.privacyPolicyScreen),
                ),
                SingleElement(
                  icon: KImages.settingIcon11,
                  text: 'FAQ',
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.faqScreen),
                ),
                SingleElement(
                  icon: KImages.settingIcon12,
                  text: 'App Info',
                  onTap: () => Utils.appInfoDialog(context),
                ),
                BlocListener<LoginBloc, LoginModelState>(
                  listener: (context, state) {
                    final logout = state.state;
                    if (logout is LoginStateLogOutLoading) {
                      Utils.loadingDialog(context);
                    } else {
                      Utils.closeDialog(context);
                      if (logout is LoginStateSignOutError) {
                        Utils.errorSnackBar(context, logout.errorMsg);
                      } else if (logout is LoginStateLogOut) {
                        Navigator.of(context).pop();
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteNames.loginScreen, (route) => false);
                        Utils.showSnackBar(context, logout.msg);
                      }
                    }
                  },
                  child: SingleElement(
                    icon: KImages.settingIcon13,
                    text: 'Logout',
                    onTap: () => logoutDialog(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  // editProfileDialog(BuildContext context) {
  //   final spacer = SizedBox(height: 11.h);
  //   Utils.showCustomDialog(
  //     context,
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.vertical,
  //       physics: const BouncingScrollPhysics(),
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const CustomTextStyle(
  //                   text: 'Update your profile',
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 18.0,
  //                   color: blackColor,
  //                 ),
  //                 GestureDetector(
  //                     onTap: () => Navigator.of(context).pop(),
  //                     child: const CustomImage(path: KImages.cancelIcon))
  //               ],
  //             ),
  //             const SizedBox(height: 14.0),
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Name'),
  //               keyboardType: TextInputType.name,
  //             ),
  //             spacer,
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Email'),
  //               keyboardType: TextInputType.emailAddress,
  //             ),
  //             spacer,
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Phone'),
  //               keyboardType: TextInputType.phone,
  //             ),
  //             spacer,
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Description'),
  //               keyboardType: TextInputType.multiline,
  //               maxLines: 4,
  //             ),
  //             SizedBox(height: 18.h),
  //             PrimaryButton(
  //                 text: 'Update Profile',
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 textColor: blackColor,
  //                 fontSize: 20.0,
  //                 borderRadiusSize: radius,
  //                 bgColor: yellowColor)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // contactUsDialog(BuildContext context) {
  //   final spacer = SizedBox(height: 12.h);
  //   Utils.showCustomDialog(
  //     context,
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.vertical,
  //       physics: const BouncingScrollPhysics(),
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const CustomTextStyle(
  //                   text: 'Contact Us',
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 18.0,
  //                   color: blackColor,
  //                 ),
  //                 GestureDetector(
  //                     onTap: () => Navigator.of(context).pop(),
  //                     child: const CustomImage(path: KImages.cancelIcon))
  //               ],
  //             ),
  //             SizedBox(height: 12.h),
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Name'),
  //               keyboardType: TextInputType.name,
  //             ),
  //             spacer,
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Email'),
  //               keyboardType: TextInputType.emailAddress,
  //             ),
  //             spacer,
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Phone'),
  //               keyboardType: TextInputType.phone,
  //             ),
  //             spacer,
  //             TextFormField(
  //               decoration: const InputDecoration(hintText: 'Description'),
  //               keyboardType: TextInputType.multiline,
  //               maxLines: 4,
  //             ),
  //             SizedBox(height: 18.h),
  //             PrimaryButton(
  //                 text: 'Send Message',
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 textColor: blackColor,
  //                 fontSize: 20.0,
  //                 borderRadiusSize: radius,
  //                 bgColor: yellowColor)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  logoutDialog(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    Utils.showCustomDialog(
      context,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: KImages.logoutIcon),
            const SizedBox(height: 10.0),
            const CustomTextStyle(
              textAlign: TextAlign.center,
              text: 'Are you sure\nYou want to Logout?',
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoutButton(
                    'Not Now', () => Navigator.of(context).pop(), blackColor),
                SizedBox(width: 13.h),
                logoutButton('Logout', () {
                  loginBloc.add(const LoginEventLogout());
                }, primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton(String text, VoidCallback onPressed, Color bgColor) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100.0, 40.0)),
          backgroundColor: MaterialStateProperty.all(bgColor),
          elevation: MaterialStateProperty.all(0.0),
          shadowColor: MaterialStateProperty.all(transparent),
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadius))),
      child: CustomTextStyle(
        text: text,
        fontWeight: FontWeight.w500,
        fontSize: titleFontSize,
        color: whiteColor,
      ),
    );
  }

  PreferredSizeWidget settingAppBar(BuildContext context) {
    final profile = context.read<ProfileCubit>();
    final appSetting = context.read<AppSettingCubit>();
    final image = profile.usersModel != null
        ? profile.usersModel!.image.isNotEmpty
            ? profile.usersModel!.image
            : appSetting.settingModel!.setting.defaultAvatar
        : appSetting.settingModel!.setting.defaultAvatar;
    return AppBar(
      toolbarHeight: 60.h,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: CustomImage(
                width: 50,
                height: 50,
                //path: KImages.logo3,
                path: appSetting.settingModel!.setting.logo,
                fit: BoxFit.cover,
                color: whiteColor,
              )),
          BlocListener<ProfileCubit, ProfileStateModel>(
            listener: (context, state) {
              final profiles = state.profileState;
              if (profiles is ProfileUpdateLoaded) {
                Utils.showSnackBar(context, profiles.message);
                profile.getAgentProfile();
              }
            },
            child: BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                final profileState = state.profileState;
                if (profileState is AgentProfileLoaded) {
                  return showImageProfile(
                      context,
                      profileState.usersMore!.image.isNotEmpty
                          ? profileState.usersMore!.image
                          : appSetting.settingModel!.setting.defaultAvatar);
                }
                return showImageProfile(context, image);
              },
            ),
            // child: GestureDetector(
            //   onTap: () =>
            //       Navigator.pushNamed(context, RouteNames.profileScreen),
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       border: Border.all(color: whiteColor, width: 2.0),
            //     ),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(13),
            //       child: CustomImage(
            //         // path: KImages.profilePicture,
            //         path: image,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
          ),
          // ),
        ],
      ),
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
      ),
    );
  }

  Widget showImageProfile(BuildContext context, String image) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteNames.profileScreen),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: whiteColor, width: 2.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: CustomImage(
            // path: KImages.profilePicture,
            path: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
