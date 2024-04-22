import 'dart:developer';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../data/model/auth/user_profile_model.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../utils/utils.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/error_text.dart';
import '../../widget/loading_widget.dart';
import '../../widget/primary_button.dart';
import 'component/profile_image.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key, required this.profile})
      : super(key: key);
  final UserProfileModel profile;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  void initState() {
    getExitingProfileData();
    super.initState();
  }

  getExitingProfileData() {
    final profile = context.read<ProfileCubit>();
    profile.nameChange(widget.profile.name);
    profile.phoneChange(widget.profile.phone);
    profile.addressChange(widget.profile.address);
    profile.designationChange(widget.profile.designation);
    profile.aboutMeChange(widget.profile.aboutMe);
    profile.facebookChange(widget.profile.facebook);
    profile.instagramChange(widget.profile.instagram);
    profile.twitterChange(widget.profile.twitter);
    profile.linkedinChange(widget.profile.linkedin);
  }

  final _className = "UpdateProfileScreen";
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(
        title: 'Update Profile',
      ),
      body: BlocListener<ProfileCubit, ProfileStateModel>(
        listener: (context, state) {
          final update = state.profileState;
          if (update is ProfileUpdateLoading) {
            log(_className, name: update.toString());
          } else if (update is ProfileUpdateError) {
            Utils.errorSnackBar(context, update.message);
          } else if (update is ProfileUpdateLoaded) {
            profileCubit.getAgentProfile();
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });

            // Navigator.popAndPushNamed(context, RouteNames.viewProfileInfo)
            //     .then((value) => profileCubit.getAgentProfile());
          }
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          controller: _controller,
          children: [
            SizedBox(height: 20.h),
            ProfileImages(profilePicture: widget.profile.image),
            // defaultVerticalSpace,
            // BlocBuilder<ProfileCubit, ProfileStateModel>(
            //   builder: (context, state) {
            //     final update = state.profileState;
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         CustomTextField(
            //             initialValue: widget.profile.name,
            //             onChanged: (String text) =>
            //                 profileCubit.nameChange(text),
            //             hintText: 'Name'),
            //         // if (update is ProfileUpdateFormValidate) ...[
            //         //   if (update.error.name.isNotEmpty)
            //         //     ErrorText(
            //         //       text: update.error.name.first,
            //         //     ),
            //         // ]
            //       ],
            //     );
            //   },
            // ),
            // defaultVerticalSpace,
            // BlocBuilder<ProfileCubit, ProfileStateModel>(
            //   builder: (context, state) {
            //     final update = state.profileState;
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         CustomTextField(
            //             initialValue: widget.profile.phone,
            //             onChanged: (String text) =>
            //                 profileCubit.phoneChange(text),
            //             hintText: 'Phone'),
            //         if (update is ProfileUpdateFormValidate) ...[
            //           if (update.error.phone.isNotEmpty)
            //             ErrorText(
            //               text: update.error.phone.first,
            //             ),
            //         ]
            //       ],
            //     );
            //   },
            // ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                final update = state.profileState;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.streetAddress,
                      initialValue: widget.profile.address,
                      labelText: "Address",
                      onChanged: (String text) =>profileCubit.addressChange(text),
                      hintText: 'Address',
                    ),
                    if (update is ProfileUpdateFormValidate) ...[
                      if (update.error.address.isNotEmpty)
                        ErrorText(
                          text: update.error.address.first,
                        ),
                    ]
                  ],
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                final update = state.profileState;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      initialValue: widget.profile.designation,
                      onChanged: (String text) =>
                          profileCubit.designationChange(text),
                      labelText: "Designation",
                      hintText: 'Designation',
                      keyboardType: TextInputType.text,
                    ),
                    if (update is ProfileUpdateFormValidate) ...[
                      if (update.error.designation.isNotEmpty)
                        ErrorText(
                          text: update.error.designation.first,
                        ),
                    ]
                  ],
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                final update = state.profileState;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      initialValue: widget.profile.aboutMe,
                      onChanged: (String text) =>
                          profileCubit.aboutMeChange(text),
                      hintText: 'About me',
                      labelText: "About me",
                      keyboardType: TextInputType.text,
                      maxLines: 6,
                    ),
                    if (update is ProfileUpdateFormValidate) ...[
                      if (update.error.aboutMe.isNotEmpty)
                        ErrorText(
                          text: update.error.aboutMe.first,
                        ),
                    ]
                  ],
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                return CustomTextField(
                  initialValue: widget.profile.facebook,
                  onChanged: (String text) => profileCubit.facebookChange(text),
                  hintText: 'Facebook',
                  labelText: "Facebook",
                  keyboardType: TextInputType.text,
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                return CustomTextField(
                  initialValue: widget.profile.twitter,
                  onChanged: (String text) => profileCubit.twitterChange(text),
                  hintText: 'Twitter',
                  labelText: 'Twitter',
                  keyboardType: TextInputType.url,
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                return CustomTextField(
                  initialValue: widget.profile.linkedin,
                  onChanged: (String text) => profileCubit.linkedinChange(text),
                  hintText: 'LinkedIn',
                  labelText: 'LinkedIn',
                  keyboardType: TextInputType.url,
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                return CustomTextField(
                  initialValue: widget.profile.instagram,
                  onChanged: (String text) =>
                      profileCubit.instagramChange(text),
                  hintText: 'Instagram',
                  labelText: 'Instagram',
                  keyboardType: TextInputType.url,
                );
              },
            ),
            defaultVerticalSpace,
            BlocBuilder<ProfileCubit, ProfileStateModel>(
              builder: (context, state) {
                final update = state.profileState;
                if (update is ProfileUpdateLoading) {
                  return const LoadingWidget();
                }
                return PrimaryButton(
                    fontSize: titleFontSize,
                    text: 'Update Profile',
                    onPressed: () {
                      Utils.closeKeyBoard(context);
                      profileCubit.updateAgentProfileInfo();
                    });
              },
            ),
            defaultVerticalSpace,
          ],
        ),
      ),
    );
  }
}
