import 'package:country_picker/country_picker.dart';
import 'package:real_estate/data/model/auth/form_number_phone.dart';
import 'package:real_estate/presentation/widget/countrycode_picker.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../router/route_names.dart';
import '../../utils/remove_leading_zeros.dart';
import '../../utils/utils.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/error_text.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final String subTitle =
      "Are you want to Buy New house,\nPlease Create account & Inter New House";
  bool isShow = true;
  bool isShowConfirm = true;
  String countryCode = "855";
  String flagIcon = "🇰🇭";
  String phoneNumber = "";
  String refCode = "";

  void showPassword() {
    setState(() {
      isShow = !isShow;
    });
  }

  void showConfirmPassword() {
    setState(() {
      isShowConfirm = !isShowConfirm;
    });
  }

  final spacer = const SizedBox(height: 18.0);
  final spacerWidth = const SizedBox(width: 18.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<SignUpBloc>();
    final appSetting = context.read<AppSettingCubit>();
    final settings = context.read<SettingCubit>();
    // debugPrint(
    //     "get setting mlm: ${settings.settingApiModel!.dataSettings!.enableRegister}");
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocListener<SignUpBloc, SignUpModelState>(
          listenWhen: (previous, current) {
            return previous.state != current.state;
          },
          listener: (context, state) {
            final myState = state.state;
            if (myState is SignUpStateFormError) {
              // Utils.errorSnackBar(context, myState.errorMsg);
              debugPrint("------- in bloc : ");
              if (myState.statusCode == 400) {
                Navigator.pushNamed(context, RouteNames.otpScreen,
                    arguments: FormNumberPhone(
                        countryCode: countryCode,
                        phoneNumber: phoneNumber,
                        callBackType: "register"));

                // context.read<OtpCubit>().requestOtp(
                //     "+$countryCode${removeLeadingZeros(phoneNumber)}");
              } else {
                Utils.errorSnackBar(context, myState.errorMsg);
              }
            }
            // else if (state.state is SignUpStateFormError) {
            //   final status = state.state as SignUpStateFormError;
            //   Utils.showSnackBar(context, status.errorMsg);
            // }
            else if (myState is SignUpStateLoaded) {
              final loadedData = state.state as SignUpStateLoaded;
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.verificationScreen, (route) => false,
                  arguments: true);
              Utils.showSnackBar(context, loadedData.msg);
            } else if (state.state is AccountActivateSuccess) {
              final messageState = state.state as AccountActivateSuccess;
              Utils.showSnackBar(context, messageState.msg);
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginScreen, (route) => true);
            }
          },
          child: SizedBox(
            height: size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomImage(
                  path: RemoteUrls.imageUrl(appSetting
                          .settingModel!.mobileAppContent.loginBgImage) ??
                      KImages.signUpBackgroundImage,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  top: size.height * 0.14,
                  // left: size.width * 0.05,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextStyle(
                            text: 'Create Account',
                            fontWeight: FontWeight.w700,
                            fontSize: profileNameFontSize,
                            color: whiteColor,
                          ),
                          const SizedBox(height: 5.0),
                          CustomTextStyle(
                            text: subTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: subtitleFontSize,
                            height: 1.8,
                            color: whiteColor,
                          ),
                          if (appSetting.settingModel!.setting.isReferralCode)
                            const SizedBox(height: 5.0),
                          if (settings.settingApiModel!.dataSettings != null)
                            if (settings.settingApiModel!.dataSettings!
                                    .enableRefCode ==
                                1)
                              const CustomTextStyle(
                                text: 'Referral Code: 7q9k689x2z639w149h69',
                                fontWeight: FontWeight.w500,
                                fontSize: subtitleFontSize,
                                color: primaryColor,
                              ),
                          SizedBox(height: size.height * 0.04),

                          // //-------- bloc of first name ------------
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            // buildWhen: (previous, current) =>
                            //     previous.password != current.password,
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    //initialValue: state.firstName,
                                    controller: bloc.firstNameController,
                                    onChanged: (value) {
                                      debugPrint("First name : $value");
                                      bloc.add(SignUpEventFirstName(value));
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          credentialIcon(KImages.userIcon),
                                      hintText: 'First name',
                                    ),
                                  ),
                                  //Utils.verticalSpace(6),
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.firstName.isNotEmpty)
                                      ErrorText(text: s.errors.firstName.first),
                                  ]
                                ],
                              );
                            },
                          ),
                          // //-------- bloc of last name ------------
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            // buildWhen: (previous, current) =>
                            //     previous.password != current.password,
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    // initialValue: state.lastName,
                                    controller: bloc.lastNameController,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventLastName(value)),
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          credentialIcon(KImages.userIcon),
                                      hintText: 'Last name',
                                    ),
                                  ),
                                  //Utils.verticalSpace(6),
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.lastName.isNotEmpty)
                                      ErrorText(text: s.errors.lastName.first),
                                  ]
                                ],
                              );
                            },
                          ),
                          //-------- bloc of phone number ------------

                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            // buildWhen: (previous, current) =>
                            //     previous.password != current.password,
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: bloc.phoneNumberController,
                                    //initialValue: state.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                      debugPrint(
                                          "phone number : ${removeLeadingZeros(value)}");
                                      bloc.add(SignUpEventPhone(
                                          removeLeadingZeros(value),
                                          "+$countryCode",
                                          "7q9k689x2z639w149h69"));
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: IconButton(
                                          icon: CustomTextStyle(
                                            text: "$flagIcon+$countryCode",
                                            color: Colors.blueGrey.shade400,
                                          ),
                                          onPressed: () {
                                            onShowCountryCodePicker(
                                                context: context,
                                                onSelect: (Country country) {
                                                  setState(() {
                                                    flagIcon =
                                                        country.flagEmoji;
                                                    countryCode =
                                                        country.phoneCode;
                                                  });
                                                  bloc.add(SignUpEventPhone(
                                                      removeLeadingZeros(
                                                          phoneNumber),
                                                      "+$countryCode",
                                                      "7q9k689x2z639w149h69"));

                                                  debugPrint(
                                                      "----- country code :${country.flagEmoji}");
                                                  debugPrint(
                                                      "----- country code :${country.phoneCode}");
                                                });
                                          },
                                        ),
                                      ),
                                      hintText: 'Phone number',
                                    ),
                                  ),
                                  //Utils.verticalSpace(6),
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.phone.isNotEmpty)
                                      ErrorText(text: s.errors.phone.first),
                                  ]
                                ],
                              );
                            },
                          ),
                          // spacer,
                          // BlocBuilder<SignUpBloc, SignUpModelState>(
                          //   builder: (context, state) {
                          //     final s = state.state;
                          //     return Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         TextFormField(
                          //           keyboardType: TextInputType.emailAddress,
                          //           initialValue: state.email,
                          //           onChanged: (value) =>
                          //               bloc.add(SignUpEventEmail(value)),
                          //           decoration: InputDecoration(
                          //             prefixIcon:
                          //                 credentialIcon(KImages.emailIcon),
                          //             hintText: 'Email address',
                          //           ),
                          //         ),
                          //         if (state.name.isNotEmpty)
                          //           if (s is SignUpStateLoadedError) ...[
                          //             if (s.errors.email.isNotEmpty)
                          //               ErrorText(text: s.errors.email.first),
                          //           ]
                          //       ],
                          //     );
                          //   },
                          // ),
                          //-------- bloc of password number ------------
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    // initialValue: state.password,
                                    controller: bloc.passwordController,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventPassword(value)),
                                    obscureText: isShow,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            credentialIcon(KImages.lockIcon),
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          splashRadius: 20.0,
                                          onPressed: showPassword,
                                          icon: Icon(
                                            isShow
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: grayColor,
                                            size: 20.0,
                                          ),
                                        )),
                                  ),
                                  // if (state.password.isNotEmpty)
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.password.isNotEmpty)
                                      ErrorText(text: s.errors.password.first),
                                  ]
                                ],
                              );
                            },
                          ),
                          //-------- bloc of confirmPassword number ------------
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    //initialValue: state.passwordConfirmation,
                                    controller: bloc.passwordConfirmController,
                                    onChanged: (value) => bloc
                                        .add(SignUpEventPasswordConfirm(value)),
                                    obscureText: isShowConfirm,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            credentialIcon(KImages.lockIcon),
                                        hintText: 'Confirm Password',
                                        suffixIcon: IconButton(
                                          splashRadius: 20.0,
                                          onPressed: showConfirmPassword,
                                          icon: Icon(
                                            isShowConfirm
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: grayColor,
                                            size: 20.0,
                                          ),
                                        )),
                                  ),
                                  // if (state.passwordConfirmation.isNotEmpty)
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.confirmPassword.isNotEmpty)
                                      ErrorText(
                                          text: s.errors.confirmPassword.first),
                                  ]
                                  // if (s is SignUpStateLoadedError) ...[
                                  //   if (s.errors.confirmPassword.isNotEmpty)
                                  //     ErrorText(
                                  //         text: s.errors.confirmPassword.first),
                                  // ]
                                ],
                              );
                            },
                          ),

                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              if (s is SignUpStateLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return PrimaryButton(
                                onPressed: () {
                                  Utils.closeKeyBoard(context);

                                  bloc.add(SignUpEventSubmit());
                                },
                                text: 'Sign Up',
                                borderRadiusSize: 5.0,
                              );
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomTextStyle(
                                text: "Already have an account? ",
                                fontWeight: FontWeight.w600,
                                fontSize: titleFontSize,
                                color: whiteColor,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, RouteNames.loginScreen),
                                child: const CustomTextStyle(
                                  text: "Login",
                                  fontWeight: FontWeight.w600,
                                  fontSize: titleFontSize,
                                  color: yellowColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
