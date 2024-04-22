import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/logic/cubit/otp/verify_otp_state.dart';

import '../../../logic/cubit/otp/verify_otp_cubit.dart';
import '/presentation/widget/custom_test_style.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/utils/utils.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../../logic/cubit/forgot_password/forgot_password_cubit.dart';
import '../../../logic/cubit/setting/app_setting_cubit.dart';
import '../../router/route_names.dart';
import '../../widget/error_text.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;

  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  void showConfirmPassword() {
    setState(() {
      isShowConfirmPassword = !isShowConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final bloc = context.read<ForgotPasswordCubit>();
    final verifyOtpCubit = context.read<VerifyOtpCubit>();
    // print('email ${bloc.emailController.text}');
    // print('code ${bloc.codeController.text}');
    final appSetting =
        context.read<AppSettingCubit>().settingModel!.mobileAppContent;
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpStateError) {
          Utils.errorSnackBar(context, state.errorMsg);
        } else if (state is VerifyOtpStateLoaded) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          });
          Utils.showSnackBar(context, state.message);
          verifyOtpCubit.passwordController.clear();
          verifyOtpCubit.passwordConfirmController.clear();
        }
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextStyle(
                          text: 'Update Password',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                        ),
                        Utils.verticalSpace(40),
                        _buildPassword(verifyOtpCubit),
                        Utils.verticalSpace(20),
                        _buildConfirmPass(verifyOtpCubit),
                        Utils.verticalSpace(20),
                        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                          buildWhen: (p, c) {
                            print('p $p');
                            print('c $c');
                            return false;
                          },
                          builder: (context, state) {
                            if (state is ForgotPasswordStateLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            return PrimaryButton(
                              text: "Update Password",
                              onPressed: () {
                                Utils.closeKeyBoard(context);
                                verifyOtpCubit.verifyOtp(
                                  "forget_password",
                                );
                                //bloc.forgotPassWord();
                              },
                            );
                          },
                        ),
                      ],
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

  passwordChangeDialog(BuildContext context) {
    Utils.showCustomDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: KImages.trickIcon),
            const SizedBox(height: 10.0),
            const CustomTextStyle(
              text: 'Password Changed',
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              color: blackColor,
            ),
            const SizedBox(height: 5.0),
            const CustomTextStyle(
              text: 'Your Password has been Changed\nSuccessfully',
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
              color: Color(0xFF7E8BA0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            PrimaryButton(
              text: 'Back To Home',
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.mainPageScreen, (route) => false);
              },
              borderRadiusSize: radius,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPassword(VerifyOtpCubit bloc) {
    return BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
      builder: (context, state) {
        // ForgotPasswordFormValidateError
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: bloc.passwordController,
              decoration: InputDecoration(
                prefixIcon: credentialIcon(KImages.lockIcon),
                hintText: 'Password',
                suffixIcon: IconButton(
                  splashRadius: 20.0,
                  onPressed: showPassword,
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: grayColor,
                    size: 20.0,
                  ),
                ),
              ),
              obscureText: isShowPassword,
            ),
            if (state is VerifyOtpFormValidateError) ...[
              if (state.errors.password.isNotEmpty)
                ErrorText(text: state.errors.password.first)
            ]
          ],
        );
      },
    );
  }

  Widget _buildConfirmPass(VerifyOtpCubit bloc) {
    return BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: bloc.passwordConfirmController,
              decoration: InputDecoration(
                  prefixIcon: credentialIcon(KImages.lockIcon),
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    splashRadius: 20.0,
                    onPressed: showConfirmPassword,
                    icon: Icon(
                      isShowConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: grayColor,
                      size: 20.0,
                    ),
                  )),
              // validator: (text) {
              //   if (!(text!.contains(bloc.passwordController.text)) &&
              //       text.isEmpty) {
              //     return "Confirm Password doesn't match";
              //   } else {
              //     return null;
              //   }
              // },
              obscureText: isShowConfirmPassword,
            ),
            if (bloc.passwordController.text.isNotEmpty)
              if (state is VerifyOtpFormValidateError) ...[
                if (state.errors.confirmPassword.isNotEmpty)
                  ErrorText(text: state.errors.confirmPassword.first)
              ]
          ],
        );
      },
    );
  }
}
