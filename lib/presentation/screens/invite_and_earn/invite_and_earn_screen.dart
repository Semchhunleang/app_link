import 'package:flutter/services.dart';
import 'package:real_estate/data/model/auth/login/subscription_model.dart';
import 'package:real_estate/data/model/auth/login/user_data_model.dart';
import 'package:real_estate/logic/cubit/invite_earn/invite_earn_cubit.dart';
import 'package:real_estate/presentation/utils/constraints.dart';
import 'package:real_estate/presentation/utils/k_images.dart';
import 'package:real_estate/presentation/widget/custom_app_bar.dart';
import 'package:real_estate/presentation/widget/custom_images.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/presentation/widget/loading_widget.dart';
import 'package:real_estate/presentation/widget/primary_button.dart';
import 'package:real_estate/state_inject_package_names.dart';

class InviteAndEarnScreen extends StatelessWidget {
  const InviteAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inviteEarnCubit = context.read<InviteEarnCubit>();
    final loginCubit = context.read<LoginBloc>();
    final SubscriptionModel subScription = loginCubit.userInfo!.userDataModel.subscription;
    final UserDataModel userDataModel = loginCubit.userInfo!.userDataModel;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(
        title: "Invite & Earn",
        action: [
            // TextButton(
            //   onPressed: (){
            //     context.read<ApierCubit>().clearOptions();
            //     Navigator.pushNamed(
            //       context,
            //       RouteNames.inviteEarnBalance,
            //     );
            //   },
            //   style: TextButton.styleFrom(
            //     foregroundColor: primaryColor,
            //   ),
            //   child: const CustomTextStyle(text: "BALANCE")
            // )
          ],
          showButton: false,
        ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(subScription.canUpgrade!)
              Container(
                margin: EdgeInsets.all(paddingHorizontal),
                padding: EdgeInsets.all(paddingHorizontal),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color:grayColor),
                ),
                // padding: EdgeInsets.all(paddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CustomTextStyle(text: subScription.name!, fontSize: detailFontSize -2, color: grayColor,),
                    Row(
                      children: [
                      Expanded(
                        child: CustomTextStyle(text: "Membership", color: primaryColor, fontSize: titleFontSize, fontWeight: FontWeight.w600),
                        // child: Stack(
                        //   children: [
                        //     // Container(
                        //     //   margin: EdgeInsets.only(right: paddingHorizontal),
                        //     //   alignment: Alignment.center,
                        //     //   width: double.infinity,
                        //     //   height: 60,
                        //     //   decoration: BoxDecoration(
                        //     //     borderRadius: BorderRadius.circular(3),
                        //     //     color: primaryColor.withOpacity(0.05),
                        //     //     border: Border.all(
                        //     //       color: primaryColor,
                        //     //       width: 1,
                        //     //     ),
                        //     //   ),
                        //       // child: 
                        //       // CustomTextStyle(text: "Membership", color: primaryColor, fontSize: titleFontSize, fontWeight: FontWeight.w600),
                        //     // ),
                        //     Positioned(
                        //       right: paddingHorizontal+ 5,
                        //       child: CustomTextStyle(text: subScription.name!, fontSize: detailFontSize -2, color: grayColor,)
                        //     )
                        //   ],
                        // ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 30),
                      //   child: CustomTextStyle(text: subScription.name!)),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: PrimaryButton(
                          borderRadiusSize: 3,
                          text: "Upgrade", onPressed: (){
                        }),
                      )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              if(!subScription.canUpgrade!)
              const CustomTextStyle(text: "Invite friend Via"),
              if(!subScription.canUpgrade!)
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: CustomTextStyle(text: userDataModel.refCode, color: primaryColor,)
              ),
              if(!subScription.canUpgrade!)
              Padding(
                padding: EdgeInsets.only(
                left: paddingHorizontal,
                right: paddingHorizontal,
                bottom: 15.h),
                child: SizedBox(
                  width: isIpad ? 400: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // BlocBuilder<InviteEarnCubit, InviteEarnState>(
                      //   builder: (context, state) {
                      //     if (state is InviteEarnLoading) {
                      //       return const LoadingWidget();
                      //     }else{
                      //     return 
                          PrimaryButton(
                            maximumSize: const Size(150, 50),
                            minimumSize: const Size(150, 50),
                            borderRadiusSize: 5,
                            fontSize: titleFontSize,
                            text: 'Social Media',
                            onPressed: ()=>inviteEarnCubit.shareWithSocialMedia(userDataModel.refCodeDeepLink)),
                      //     }
                      //   }
                      // ),

                      // BlocBuilder<InviteEarnCubit, InviteEarnState>(
                      //   builder: (context, state) {
                      //     if (state is InviteEarnLoading) {
                      //       return const LoadingWidget();
                      //     }else{
                      //     return 
                          PrimaryButton(
                            maximumSize: const Size(150, 50),
                            minimumSize: const Size(150, 50),
                            borderRadiusSize: 5,
                            fontSize: titleFontSize,
                            text: 'SMS',
                            onPressed: ()=>inviteEarnCubit.shareWithSMS(userDataModel.refCodeDeepLink))
                        //   }
                        // }
                      // ),
                    ],
                  ),
                ),
              ),
              if(!subScription.canUpgrade!)
              Divider(
                color: Colors.grey.shade200,
                thickness: 3,
              ),
              if(!subScription.canUpgrade!)
              SizedBox(
                height: 5.h,
              ),
              // const CustomTextStyle(text: "Invite friend via sms"),
              // TextButton(
              //     onPressed: () {},
              //     style: TextButton.styleFrom(
              //       foregroundColor: Colors.blue,
              //     ),
              //     child: const CustomTextStyle(
              //       text: "Jrerm47",
              //     )),
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: paddingHorizontal,
              //       right: paddingHorizontal,
              //       bottom: 15.h),
              //   child: PrimaryButton(
              //     text: 'Share Link',
              //     onPressed: () async {
              //       const url =
              //           'sms:?body=Check out this amazing app! https://qrfy.com/p/20uSVJV2N4';
              //       if (await canLaunchUrl(Uri.parse(url))) {
              //         await launchUrl(Uri.parse(url));
              //       } else {
              //         throw 'Could not launch $url';
              //       }
              //     },
              //     borderRadiusSize: 5.r,
              //   ),
              // ),
              // Divider(
              //   color: Colors.grey.shade200,
              //   thickness: 3,
              // ),
              if(!subScription.canUpgrade!)
              SizedBox(
                height: 5.h,
              ),
              if(!subScription.canUpgrade!)
              Column(
                children: [
                const CustomTextStyle(text: "Invite via QR code"),
                defaultVerticalSpace,
                if(userDataModel.refCodeImage != "")
                CustomImage(path: userDataModel.refCodeImage, width: 280),
                if(userDataModel.refCodeImage != "")
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isIpad ? size.width * 0.22 : size.width * 0.15,
                    vertical: 10),
                    child:   BlocBuilder<InviteEarnCubit, InviteEarnState>(
                      builder: (context, state) {
                        if (state is InviteEarnLoading) {
                          return const LoadingWidget();
                        }else{
                        return  PrimaryButton(
                          text: 'Download',
                          onPressed: () async {
                            await inviteEarnCubit.downloadQR(userDataModel.refCodeImage, context);
                          },
                          borderRadiusSize: 5,
                        );
                      }}
                    )
                  ),

                  if(userDataModel.refCodeImage == "")
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomTextStyle(text: "API response QR code null!", color: redColor,),
                  )

                ],
              ),
              if(!subScription.canUpgrade!)
              defaultVerticalSpace,
              if(!subScription.canUpgrade!)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomTextField(
                        onChanged: () {},
                        initialValue: userDataModel.refCodeDeepLink,
                        hintText: "",
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      flex: 1,
                      child: PrimaryButton(
                        text: 'Copy',
                        fontSize: titleFontSize,
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                            text: userDataModel.refCodeDeepLink))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Copied")));
                          });
                        },
                        borderRadiusSize: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
