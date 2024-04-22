import 'package:country_picker/country_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';
import '../../../data/model/auth/form_number_phone.dart';
import '../../../logic/bloc/verify_forgot_password/verify_forgot_password_event.dart';
import '../../../logic/bloc/verify_forgot_password/verify_forgot_password_state.dart';
import '../../utils/remove_leading_zeros.dart';
import '../../widget/countrycode_picker.dart';
import '../../widget/custom_test_style.dart';
import '/presentation/utils/utils.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../router/route_names.dart';
import '../../widget/error_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextStyle textStyle() {
    return GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        // fontSize: 1.sw > dWidthSize ? detailFontSize.sp-10:detailFontSize.sp,
        fontSize: titleFontSize,
        color: whiteColor);
  }

  final spacer = SizedBox(height: 20.h);
  String countryCode = "855";
  String flagIcon = "🇰🇭";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    //final bloc = context.read<ForgotPasswordCubit>();
    final verifyForgotPass = context.read<VerifyForgotPasswordBloc>();
    final size = MediaQuery.of(context).size;
    final appSetting =
        context.read<AppSettingCubit>().settingModel!.mobileAppContent;
    return BlocListener<VerifyForgotPasswordBloc,
        VerifyForgotPasswordModelState>(
      listenWhen: (previous, current) {
        return previous.state != current.state;
      },
      listener: (context, state) {
        if (state.state is VerifyForgotPasswordStateError) {
          final status = state.state as VerifyForgotPasswordStateError;
          debugPrint('----- status code :${status.statusCode}');
          // Utils.errorSnackBar(context, myState.errorMsg);
          if (status.statusCode == 400) {
            Navigator.pushReplacementNamed(context, RouteNames.otpScreen,
                arguments: FormNumberPhone(
                    countryCode: countryCode,
                    phoneNumber: phoneNumber,
                    callBackType: "forget_password"));
            verifyForgotPass.add(const VerifyForgotPasswordClear());
            verifyForgotPass.phoneController.clear();
          } else {
            Utils.errorSnackBar(context, status.errorMsg);
          }
        }
        // else if (state is VerifyForgotPasswordStateLoaded) {
        //   final myState = state as VerifyForgotPasswordStateLoaded;
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, RouteNames.verificationScreen, (route) => false,
        //       arguments: true);
        //   Utils.showSnackBar(context, myState.message);
        // }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomImage(
                    path: RemoteUrls.imageUrl(appSetting.loginBgImage) ??
                        KImages.verifyBackgroundImage,
                    fit: BoxFit.cover),
                Positioned.fill(
                  top: size.height * 0.14,
                  // left: size.width * 0.05,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forget Password',
                          style: textStyle(),
                        ),
                        SizedBox(height: size.height * 0.04),
                        BlocBuilder<VerifyForgotPasswordBloc,
                            VerifyForgotPasswordModelState>(
                          builder: (context, state) {
                            final verifyPass = state.state;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: verifyForgotPass.phoneController,
                                  //  initialValue: state.phone,
                                  onChanged: (value) {
                                    phoneNumber = value;
                                    verifyForgotPass.add(
                                        VerifyForgotPasswordEvenPhone(
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
                                      padding: const EdgeInsets.only(left: 5.0),
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
                                                  flagIcon = country.flagEmoji;
                                                  countryCode =
                                                      country.phoneCode;
                                                });
                                                verifyForgotPass.add(
                                                    VerifyForgotPasswordEvenPhone(
                                                        removeLeadingZeros(
                                                            state.phone),
                                                        "+$countryCode"));

                                                // loginBloc.add(LoginEvenPhone(
                                                //     removeLeadingZeros(
                                                //         phoneNumber),
                                                //     "+$countryCode"));

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
                                if (verifyPass
                                    is VerifyForgotPasswordStateFormInvalid) ...[
                                  if (verifyPass.error.phone.isNotEmpty)
                                    ErrorText(
                                        text: verifyPass.error.phone.first)
                                ]
                              ],
                            );
                          },
                        ),
                        // BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                        //   builder: (context, state) {
                        //     // ForgotPasswordFormValidateError
                        //     return Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         CustomTextField(
                        //             keyboardType: TextInputType.emailAddress,
                        //             controller: bloc.phoneNumberController,
                        //             prefixIcon:
                        //                 credentialIcon(KImages.emailIcon),
                        //             onChanged: () {},
                        //             hintText: "Phone number"),
                        //         if (state
                        //             is ForgotPasswordFormValidateError) ...[
                        //           if (state.errors.email.isNotEmpty)
                        //             ErrorText(text: state.errors.email.first)
                        //         ]
                        //       ],
                        //     );
                        //   },
                        // ),
                        spacer,
                        const SizedBox(height: 10.0),
                        BlocBuilder<VerifyForgotPasswordBloc,
                                VerifyForgotPasswordModelState>(
                            builder: (context, state) {
                          if (state is ForgotPasswordStateLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return PrimaryButton(
                            onPressed: () {
                              Utils.closeKeyBoard(context);
                              verifyForgotPass
                                  .add(const VerifyForgotPasswordEventSubmit());
                            },
                            text: 'Send Code',
                            borderRadiusSize: 5.0,
                          );
                        }),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Don't get any Code? ",
                        //       style: GoogleFonts.poppins(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 17.0,
                        //         color: whiteColor,
                        //       ),
                        //     ),
                        //     Text(
                        //       'Resend',
                        //       style: GoogleFonts.poppins(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 17.0,
                        //         color: yellowColor,
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
    );
  }
}
