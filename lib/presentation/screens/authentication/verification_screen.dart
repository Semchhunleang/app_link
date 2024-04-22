import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:real_estate/logic/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';

import '/presentation/router/route_names.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/utils/utils.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../logic/bloc/signup/sign_up_bloc.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.isVerification})
      : super(key: key);

  final bool isVerification;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // timerStart() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       second--;
  //       if (second < 1) {
  //         minute--;
  //         if (minute < 1) {
  //           minute = 0;
  //         }
  //         second = minute == 0 ? 0 : 4;
  //       }
  //     });
  //   });
  // }
  bool finishTime = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<SignUpBloc>();
    final forgotCubit = context.read<ForgotPasswordCubit>();
    // print('isVerification ${widget.isVerification}');
    // print('forgotEmail ${forgotCubit.emailController.text}');
    // print('code ${forgotCubit.codeController.text}');
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: MultiBlocListener(
          listeners: [
            BlocListener<SignUpBloc, SignUpModelState>(
                listener: (context, state) {
              final code = state.state;
              if (code is SignUpStateLoading) {
                Utils.loadingDialog(context);
              } else {
                Utils.closeDialog(context);
                if (code is SignUpStateFormError) {
                  Utils.errorSnackBar(context, code.errorMsg);
                } else if (code is AccountActivateSuccess) {
                  Utils.showSnackBar(context, code.msg);
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.loginScreen, (route) => false);
                  bloc.pinController.clear();
                  //bloc.add(const SignUpEventFormDataClear());
                } else if (code is ResendCodeState) {
                  Utils.showSnackBar(context, code.message);
                  setState(() => finishTime = true);
                }
              }
            }),
            BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
              if (state is ForgotPasswordStateLoading) {
                Utils.loadingDialog(context);
              } else {
                Utils.closeDialog(context);
                if (state is VerifyingForgotPasswordCodeLoaded) {
                  Navigator.pushNamed(context, RouteNames.updatePasswordScreen);
                }
              }
            })
          ],
          child: SizedBox(
            height: size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const CustomImage(
                    path: KImages.verifyBackgroundImage, fit: BoxFit.cover),
                Positioned.fill(
                  top: size.height * 0.14,
                  // left: size.width * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextStyle(
                            text: 'Verification Code',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: whiteColor),
                        SizedBox(height: size.height * 0.04),
                        Align(
                          alignment: Alignment.center,
                          child: Pinput(
                            controller: bloc.pinController,
                            mainAxisAlignment: MainAxisAlignment.center,
                            defaultPinTheme: PinTheme(
                                height: 45.0.h,
                                width: 45.0.h,
                                margin: const EdgeInsets.only(right: 12.0),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: borderRadius,
                                ),
                                textStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                  color: blackColor,
                                )),
                            onCompleted: (v) {
                              if (widget.isVerification) {
                                // print('new user create');
                                bloc.add(AccountActivateCodeSubmit(v));
                              } else {
                                print('forgot password');
                                forgotCubit.codeController.text = v;
                                forgotCubit.verifyForgotPasswordCode();
                              }
                            },
                            length: 6,
                          ),
                        ),
                        Utils.verticalSpace(20),
                        /* BlocBuilder<SignUpBloc, SignUpModelState>(
                        builder: (context, state) {
                          if (state.state is SignUpStateLoading) {
                            return const CircularProgressIndicator();
                          }
                          // return _buildContinueBtn();
                        },
                      ),*/
                        const SizedBox(height: 10.0),
                        widget.isVerification
                            ? verificationWidget()
                            : const SizedBox(),
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

  Widget verificationWidget() {
    final bloc = context.read<SignUpBloc>();
    if (finishTime) {
      return Align(
        alignment: Alignment.center,
        child: TimerCountdown(
          format: CountDownTimerFormat.minutesSeconds,
          enableDescriptions: false,
          spacerWidth: 6.0,
          timeTextStyle: GoogleFonts.poppins(
            fontSize: 30.0,
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
          colonsTextStyle: GoogleFonts.poppins(
            fontSize: 30.0,
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
          endTime: DateTime.now().add(
            const Duration(minutes: 1),
          ),
          onEnd: () {
            print('finish');
            setState(() => finishTime = false);
          },
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't get any Code? ",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
              color: whiteColor,
            ),
          ),
          BlocBuilder<SignUpBloc, SignUpModelState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => bloc.add(SignUpEventResendCodeSubmit(state.email)),
                child: Text(
                  'Resend',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                    color: yellowColor,
                  ),
                ),
              );
            },
          ),
        ],
      );
    }
  }

// Widget _buildContinueBtn() {
//   final bloc = context.read<SignUpBloc>();
//   return PrimaryButton(
//     onPressed: () {
//       context
//           .read<SignUpBloc>()
//           .add(AccountActivateCodeSubmit(bloc.pinController.text));
//       //Navigator.pushNamed(context, RouteNames.updatePasswordScreen);
//     },
//     text: 'Continue',
//     borderRadiusSize: 5.0,
//   );
// }
}
