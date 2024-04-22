import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:real_estate/logic/cubit/otp/verify_otp_state.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/utils/k_images.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../data/model/auth/form_number_phone.dart';
import '../../router/route_names.dart';
import '../../utils/format_phone_number.dart';
import '../../utils/remove_leading_zeros.dart';
import '../../utils/utils.dart';
import '../../widget/primary_button.dart';

class OtpScreen extends StatefulWidget {
  final FormNumberPhone? formNumberPhone;
  const OtpScreen({super.key, this.formNumberPhone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _seconds = 0;
  late Timer _timer;
  bool isNit = true;

  @override
  void initState() {
    final otpCubit = context.read<OtpCubit>();
    debugPrint(
        "phone number from sign up : +${widget.formNumberPhone!.countryCode}${removeLeadingZeros(widget.formNumberPhone!.phoneNumber)}");
    context
        .read<OtpCubit>()
        .requestOtp(
            "+${widget.formNumberPhone!.countryCode}${removeLeadingZeros(widget.formNumberPhone!.phoneNumber)}")
        .then((value) {
      _seconds = otpCubit.requestOtpModel != null
          ? otpCubit.requestOtpModel!.messageRequestOtpData!.retryInSecond
          : 60;
      debugPrint("----------- retry second 1: $_seconds");
      startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        setState(() {
          if (_seconds == 0) {
            timer.cancel();
            // Do something when countdown is complete
          } else {
            _seconds--;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("---phone number: ${widget.formNumberPhone} and callback");
    final verifyOtpCubit = context.read<VerifyOtpCubit>();
    final bloc = context.read<SignUpBloc>();
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          //title: const Text("Verify OTP"),
          ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<VerifyOtpCubit, VerifyOtpState>(
              listener: ((context, state) {
            if (state is VerifyOtpStateError) {
              Utils.errorSnackBar(context, state.errorMsg);
            } else if (state is VerifyOtpStateLoaded) {
              Future.delayed(const Duration(seconds: 2), () {
                if (widget.formNumberPhone!.callBackType == "register") {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.loginScreen);
                  bloc.onClearDataController();
                  bloc.add(const SignUpEventFormDataClear());
                }
                if (widget.formNumberPhone!.callBackType == "forget_password") {
                  Navigator.pushNamedAndRemoveUntil(context,
                          RouteNames.updatePasswordScreen, (route) => true)
                      .then(
                          (value) => widget.formNumberPhone!.callBackType = '');
                }
              });
              Utils.showSnackBar(context, state.message);
            }
            // if (state is VerifyOtpStateLoaded) {
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text(state.message)));
            //   Future.delayed(const Duration(seconds: 2), () {
            //     Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
            //   });
            // }
          }))
        ],
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  KImages.otpImage,
                  width: 250.0.w,
                  height: 250.0.h,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextStyle(
                  text: 'OTP Verification',
                  textAlign: TextAlign.center,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextStyle(
                      text: 'Enter the OTP send to ',
                    ),
                    CustomTextStyle(
                      text: widget.formNumberPhone!.phoneNumber == ""
                          ? ""
                          : "+${widget.formNumberPhone!.countryCode} ${removeLeadingZeros(formatPhoneNumber(widget.formNumberPhone!.phoneNumber))}",
                      //removeLeadingZeros(),
                      //' +855 70 862 608',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isIpad ? 60.0.w : 40.w),
                      child: PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: isIpad ? 60 : 50,
                          fieldWidth: isIpad ? 50 : 40,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.white,
                          //  selectedFillColor: Colors.blue.shade50,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        //Colors.blue.shade50,

                        enableActiveFill: true,

                        //  errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          debugPrint("Completed :$v");
                          verifyOtpCubit.code = v;
                          verifyOtpCubit.phoneNumber =
                              "+${widget.formNumberPhone!.countryCode}${removeLeadingZeros(widget.formNumberPhone!.phoneNumber)}";
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          // setState(() {
                          //   currentText = value;
                          // });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextStyle(text: "Didn't receive OTP?"),
                    if (_seconds == 0)
                      TextButton(
                        onPressed: () {
                          final otpCubit = context.read<OtpCubit>();
                          context
                              .read<OtpCubit>()
                              .requestOtp(
                                  "+${widget.formNumberPhone!.countryCode}${removeLeadingZeros(widget.formNumberPhone!.phoneNumber)}")
                              .then((value) {
                            _seconds = otpCubit.requestOtpModel != null
                                ? otpCubit.requestOtpModel!
                                    .messageRequestOtpData!.retryInSecond
                                : 60;
                            debugPrint("----------- retry second 2: $_seconds");
                            startTimer();
                          });
                        },
                        child: const CustomTextStyle(
                          text: "RESENT",
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (_seconds != 0)
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 35.0,
                        // decoration: const BoxDecoration(color: Colors.blue),
                        child: CustomTextStyle(
                            text: '$_seconds', textAlign: TextAlign.center),
                      )
                  ],
                ),
                BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
                  builder: (context, state) {
                    if (state is LoginStateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 40.0),
                      child: PrimaryButton(
                        onPressed: () {
                          Utils.closeKeyBoard(context);
                          verifyOtpCubit.verifyOtp(
                              widget.formNumberPhone!.callBackType,
                              checkVerifyOnly: "true");
                        },
                        text: 'Verify',
                        borderRadiusSize: 5.0,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
