import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/model/online_payment/agrument_product_model.dart';
import '../../../../data/model/online_payment/product_data_model.dart';
import '../../../../logic/cubit/payment_online/payment_plan/submit_payment_link_cubit.dart';
import '../../../../logic/cubit/payment_online/payment_plan/submit_payment_link_state.dart';
import '../../../../logic/cubit/setting/app_setting_cubit.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/error_text.dart';
import '../../../widget/loading_widget.dart';
import 'product_description.dart';

class SubscriptionDescription extends StatelessWidget {
  //final DescriptionProductModel descriptionModel;
  final ProductDataModel productDataModel;
  final ArgumentProductModel argumentProductModel;
  const SubscriptionDescription(
      {super.key,
      // required this.descriptionModel,
      required this.productDataModel,
      required this.argumentProductModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final icon =
        context.read<AppSettingCubit>().settingModel!.setting.currencyIcon;
    final paymentOnlineCubit = context.read<SubmitPaymentLinkCubit>();
    return BlocListener<SubmitPaymentLinkCubit, SubmitPaymentLinkState>(
      listener: (context, state) {
        if (state is SubmitPaymentLinkLoading) {
          debugPrint("-------- get into error line 3");
          log("PaymentOnline", name: state.toString());
        } else if (state is SubmitPaymentLinkError) {
          debugPrint("-------- get into error line 4");
          Utils.errorSnackBar(context, state.message);
        } else if (state is SubmitPaymentLinkLoaded) {
          Utils.showSnackBar(context, state.paymentLinkSuccessModel.message);
          Future.delayed(const Duration(milliseconds: 1000), () async {
            String url = state.paymentLinkSuccessModel
                .dataSuccessPaymentLinkModel!.paymentLink;
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
              debugPrint("can launch url");
            } else {
              throw 'Could not launch $url';
            }
          });
          Future.delayed(const Duration(seconds: 2), () async {
            if (argumentProductModel.group == "listing") {
              Navigator.pop(context);
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }

            // Navigator.popAndPushNamed(context, RouteNames.homeScreen);
          });

          debugPrint(
              "---------- in success payment :${state.paymentLinkSuccessModel.dataSuccessPaymentLinkModel!.paymentLink}");
        } else {
          debugPrint("-------- get into error line 5");
        }
        if (state is SubmitPaymentLinkFormError) {
          [
            Utils.errorSnackBar(context, state.errors.productCode.first),
            Utils.errorSnackBar(context, state.errors.listingId.first),
            Utils.errorSnackBar(context, state.errors.price.first)
          ];
        }
      },
      child: Container(
        width: size.width,
        // height: 400.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius,
          border: Border.all(color: primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BlocBuilder<SubmitPaymentLinkCubit, SubmitPaymentLinkState>(
            //   builder: ((context, state) {
            //     //final update = state.submitPaymentLinkState;
            //     return Column(
            //       children: [
            //         TextButton(
            //             onPressed: () async {
            //               String url =
            //                   "https://devwebpayment.kesspay.io/pay/721563088210751099271538";
            //               if (await canLaunchUrl(Uri.parse(url))) {
            //                 await launchUrl(Uri.parse(url));
            //                 debugPrint("can launch url");
            //               } else {
            //                 throw 'Could not launch $url';
            //               }
            //             },
            //             child: const Text("Submit Payment Link"))
            //         // const Text("Hello"),
            //         // if (state is SubmitPaymentLinkFormError) ...[
            //         //   //if (state.errors.productCode.isNotEmpty)
            //         //   ErrorText(
            //         //     text: state.errors.productCode.first,
            //         //   ),
            //         // ]
            //       ],
            //     );
            //   }),
            // ),
            Container(
              width: size.width,
              margin:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0)
                      .copyWith(top: 0.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: borderRadius,
              ),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, -16.0),
                            child: CustomTextStyle(
                              text: icon,
                              fontSize: iconSize,
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: productDataModel.price,
                          // text: pricePlan.planPrice.toStringAsFixed(2),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: priceFontSize,
                            color: blackColor,
                          ),
                        ),
                        TextSpan(
                          text: argumentProductModel.group == "listing"
                              ? "/weekly"
                              : "/${productDataModel.name}",
                          // text: pricePlan.expiredTime.isNotEmpty
                          //     ? '/${pricePlan.expiredTime}'
                          //     : pricePlan.expiredTime,
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: titleFontSize,
                            color: blackColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: productDataModel.descriptionProductModel.map((e) {
                return ProductDescription(
                  descriptionModel: e,
                );
              }).toList(),
            ),
            BlocBuilder<SubmitPaymentLinkCubit, SubmitPaymentLinkState>(
              builder: (context, state) {
                if (state is SubmitPaymentLinkLoading) {
                  return const LoadingWidget();
                }

                return GestureDetector(
                  onTap: () {
                    paymentOnlineCubit.submitPaymentLink(
                        productCode: productDataModel.code,
                        listingId: argumentProductModel.id,
                        price: double.parse(productDataModel.price));
                  },
                  // onTap: pricePlan.planType == 'free'
                  //     ? () => paymentCubit.freeEnrollment(pricePlan.planSlug)
                  //     : () => Navigator.pushNamed(
                  //         context, RouteNames.paymentMethodScreen,
                  //         arguments: pricePlan.planSlug),
                  child: Container(
                    width: size.width * 0.6,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0)
                        .copyWith(bottom: 0.0),
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: borderRadius,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomTextStyle(
                          text: 'Apply for Plan',
                          fontWeight: FontWeight.w500,
                          fontSize: titleFontSize,
                          color: whiteColor,
                        ),
                        Container(
                          width: size.width * 0.1,
                          height: size.height * 0.04,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.22),
                            borderRadius: borderRadius,
                          ),
                          child: const Icon(
                            Icons.arrow_right_alt_outlined,
                            color: whiteColor,
                            size: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
