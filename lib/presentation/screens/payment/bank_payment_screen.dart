import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/presentation/widget/error_text.dart';

import '/logic/cubit/payment/bank_payment/bank_payment_cubit.dart';
import '/logic/cubit/payment/payment/payment_cubit.dart';
import '/presentation/utils/utils.dart';
import '/presentation/widget/custom_app_bar.dart';
import '/presentation/widget/primary_button.dart';
import '../../router/route_names.dart';

class BankPaymentScreen extends StatelessWidget {
  BankPaymentScreen({Key? key, required this.planSlug}) : super(key: key);
  final String planSlug;

  TextEditingController transactionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bankPayment = context.read<PaymentCubit>().payment!.bankPayment;
    //print(bankPayment!.accountInfo);
    print('bankPlanSlug: $planSlug');
    final bankCubit = context.read<BankPaymentCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bank Payment'),
      body: BlocListener<BankPaymentCubit, BankPaymentState>(
        listener: (context, state) {
          if (state is BankPaymentLoading) {
            Utils.loadingDialog(context);
          } else {
            Utils.closeDialog(context);
            if (state is BankPaymentError) {
              Utils.errorSnackBar(context, state.message);
            } else if (state is BankPaymentLoaded) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.purchaseScreen, (route) {
                if (route.settings.name == RouteNames.mainPageScreen) {
                  if (kDebugMode) {
                    print('message2');
                  }
                  return true;
                }
                return false;
              });
              transactionController.clear();
              Utils.showSnackBar(context, state.message);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              BlocBuilder<BankPaymentCubit, BankPaymentState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: transactionController,
                        maxLines: 10,
                        decoration:
                            InputDecoration(hintText: bankPayment!.accountInfo),
                      ),
                      if (state is BankPaymentFormError) ...[
                        if (state.errors.tnxInfo.isNotEmpty)
                          ErrorText(text: state.errors.tnxInfo.first),
                      ]
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
              PrimaryButton(
                  text: 'Payment Now',
                  onPressed: () {
                    Utils.closeKeyBoard(context);
                    Map<String, String> body = {
                      "tnx_info": transactionController.text.trim()
                    };
                    bankCubit.bankPayment(body, planSlug);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
