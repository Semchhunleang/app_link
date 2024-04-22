import 'package:country_picker/country_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../utils/remove_leading_zeros.dart';
import '../../widget/countrycode_picker.dart';
import '/presentation/utils/utils.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../router/route_names.dart';
import '../../widget/error_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String subTitle =
      "I am happy to see you again\nContinue when you left off by login in";
  bool isShow = true;
  String countryCode = "855";
  String flagIcon = "🇰🇭";
  String phoneNumber = "";

  void showPassword() {
    setState(() {
      isShow = !isShow;
    });
  }

  final spacer = SizedBox(height: 20.h);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginBloc = context.read<LoginBloc>();
    final appSetting =
        context.read<AppSettingCubit>().settingModel!.mobileAppContent;
    final settings = context.read<SettingCubit>();
    // debugPrint(
    //     "get setting mlmmm: ${settings.settingApiModel!.dataSettings!.enableRegister}");
    //print(appSetting.loginBgImage);
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginModelState>(
          listenWhen: (previous, current) => previous.state != current.state,
          listener: (context, state) {
            if (state.state is LoginStateError) {
              final status = state.state as LoginStateError;

              if (status.statusCode == 402) {
                Utils.showSnackBarWithAction(
                  context,
                  status.errorMsg,
                  () {
                    // context
                    //     .read<LoginBloc>()
                    //     .add(const SentAccountActivateCodeSubmit());
                    // Navigator.pushNamed(
                    //     context, RouteNames.verificationCodeScreen);
                  },
                );
              } else {
                Utils.errorSnackBar(context, status.errorMsg);
              }
            } else if (state.state is LoginStateLoaded) {
              Navigator.pushReplacementNamed(
                  context, RouteNames.mainPageScreen);
            } else if (state.state is SendAccountCodeSuccess) {
              final messageState = state.state as SendAccountCodeSuccess;
              Utils.showSnackBar(context, messageState.msg);
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomImage(
                    path: RemoteUrls.imageUrl(appSetting.loginBgImage) ??
                        KImages.loginBackgroundImage,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    top: size.height * 0.14,
                    // left: size.width * 0.05,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextStyle(
                            text: 'Welcome Back!',
                            fontWeight: FontWeight.w700,
                            fontSize: profileNameFontSize,
                            color: whiteColor,
                          ),
                          SizedBox(height: 5.h),
                          CustomTextStyle(
                            text: subTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: subtitleFontSize,
                            height: 1.8,
                            color: whiteColor,
                          ),
                          SizedBox(height: size.height * 0.04),
                          //-------- login with phone number--------
                          BlocBuilder<LoginBloc, LoginModelState>(
                            builder: (context, state) {
                              final login = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    style: textFieldStyle,
                                    keyboardType: TextInputType.phone,
                                    initialValue: state.phone,
                                    onChanged: (value) {
                                      phoneNumber = value;
                                      loginBloc.add(LoginEvenPhone(
                                          removeLeadingZeros(phoneNumber),
                                          "+$countryCode"));

                                      // debugPrint(
                                      //     "phone number : ${removeLeadingZeros(value)}");
                                      // bloc.add(SignUpEventPhone(
                                      //     removeLeadingZeros(value),
                                      //     "+$countryCode",
                                      //     "7q9k689x2z639w149h69"));
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: IconButton(
                                          icon: CustomTextStyle(
                                            text: "$flagIcon+$countryCode",
                                            color: Colors.blueGrey.shade400,
                                            fontSize: textFieldSize,
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

                                                  loginBloc.add(LoginEvenPhone(
                                                      removeLeadingZeros(
                                                          phoneNumber),
                                                      "+$countryCode"));
                                                  // state.countryCode =
                                                  //     countryCode;
                                                  // loginBloc.add(SignUpEventPhone(
                                                  //     removeLeadingZeros(
                                                  //         phoneNumber),
                                                  //     "+$countryCode",
                                                  //     "7q9k689x2z639w149h69"));

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
                                  // CustomTextField(
                                  //   keyboardType: TextInputType.emailAddress,
                                  //   onChanged: (value) => loginBloc
                                  //       .add(LoginEvenEmailOrPhone(value)),
                                  //   hintText: 'Your email address',
                                  //   initialValue: state.text,
                                  //   prefixIcon:
                                  //       credentialIcon(KImages.emailIcon),
                                  // ),
                                  // TextFormField(
                                  //   keyboardType: TextInputType.emailAddress,
                                  //   initialValue: state.text,
                                  //   onChanged: (value) => loginBloc
                                  //       .add(LoginEvenEmailOrPhone(value)),
                                  //   decoration: InputDecoration(
                                  //     prefixIcon: credentialIcon(KImages.emailIcon),
                                  //     hintText: 'your email address',
                                  //   ),
                                  // ),
                                  if (login is LoginStateFormInvalid) ...[
                                    if (login.error.phone.isNotEmpty)
                                      ErrorText(text: login.error.phone.first)
                                  ]
                                ],
                              );
                            },
                          ),
                          spacer,
                          BlocBuilder<LoginBloc, LoginModelState>(
                            builder: (context, state) {
                              final login = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) => loginBloc
                                        .add(LoginEventPassword(value)),
                                    hintText: 'your password',
                                    initialValue: state.password,
                                    prefixIcon:
                                        credentialIcon(KImages.lockIcon),
                                    obscureText: isShow,
                                    suffixIcon: IconButton(
                                      splashRadius: 18.h,
                                      onPressed: showPassword,
                                      icon: Icon(
                                        isShow
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: grayColor,
                                        size: textFieldIconSize + 4,
                                      ),
                                    ),
                                  ),
                                  // TextFormField(
                                  //   keyboardType: TextInputType.visiblePassword,
                                  //   initialValue: state.password,
                                  //   onChanged: (value) => loginBloc.add(LoginEventPassword(value)),
                                  //   decoration: InputDecoration(
                                  //     prefixIcon:credentialIcon(KImages.lockIcon),
                                  //     hintText: 'your password',
                                  //     suffixIcon: IconButton(
                                  //       splashRadius: 20.0,
                                  //       onPressed: showPassword,
                                  //       icon: Icon(
                                  //         isShow? Icons.visibility_off
                                  //             : Icons.visibility,
                                  //         color: grayColor,
                                  //         size: 20.0,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   obscureText: isShow,
                                  // ),
                                  if (state.phone.isNotEmpty)
                                    if (login is LoginStateFormInvalid) ...[
                                      if (login.error.password.isNotEmpty)
                                        ErrorText(
                                            text: login.error.password.first)
                                    ]
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, RouteNames.forgotPasswordScreen),
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
                                    decoration: TextDecoration.underline,
                                    // fontSize: 1.sw > dWidthSize ? detailFontSize.sp-10:detailFontSize.sp
                                    fontSize: titleFontSize,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 14.h),
                          BlocBuilder<LoginBloc, LoginModelState>(
                            buildWhen: (previous, current) =>
                                previous.state != current.state,
                            builder: (context, state) {
                              if (state.state is LoginStateLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return PrimaryButton(
                                onPressed: () {
                                  Utils.closeKeyBoard(context);
                                  loginBloc.add(const LoginEventSubmit());
                                },
                                text: 'Login',
                                borderRadiusSize: 5.0,
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          if (settings.settingApiModel!.dataSettings != null)
                            if (settings.settingApiModel!.dataSettings!
                                    .enableRegister ==
                                1)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomTextStyle(
                                    text: "Don't have an account? ",
                                    fontWeight: FontWeight.w600,
                                    fontSize: titleFontSize,
                                    color: whiteColor,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, RouteNames.signUpScreen),
                                    child: const CustomTextStyle(
                                      text: 'Sign Up',
                                      fontWeight: FontWeight.w600,
                                      fontSize: titleFontSize,
                                      color: yellowColor,
                                    ),
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.03,
                    right: size.width * 0.05,
                    child: Utils.defaultIcon(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
