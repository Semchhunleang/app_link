import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../data/model/payment/pricing_plan_model.dart';
import '../../../logic/cubit/payment/price_plan/price_plan_cubit.dart';
import '../../widget/loading_widget.dart';
import 'component/subscription_fees.dart';

class PremiumMembershipScreen extends StatelessWidget {
  const PremiumMembershipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pricePlanCubit = context.read<PricePlanCubit>();
    pricePlanCubit.getPricePlan();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Premium Membership',
      ),
      body: BlocBuilder<PricePlanCubit, PricePlanState>(
        builder: (context, state) {
          if (state is PricePlanLoading) {
            return const LoadingWidget();
          } else if (state is PricePlanError) {
            if (state.statusCode == 503) {
              return PricePlanLoadedWidget(pricePlan: pricePlanCubit.pricePlan);
            } else {
              return Center(
                child: CustomTextStyle(
                  text: state.message,
                  color: redColor,
                  fontSize: 20.0,
                ),
              );
            }
          }
          // else if (state is PricePlanLoaded) {
          //   return PricePlanLoadedWidget(pricePlan: state.pricePlan);
          // }
          return PricePlanLoadedWidget(pricePlan: pricePlanCubit.pricePlan);
        },
      ),
    );
  }
}

class PricePlanLoadedWidget extends StatefulWidget {
  const PricePlanLoadedWidget({Key? key, required this.pricePlan})
      : super(key: key);
  final List<PricePlan> pricePlan;

  @override
  State<PricePlanLoadedWidget> createState() => _PricePlanLoadedWidgetState();
}

class _PricePlanLoadedWidgetState extends State<PricePlanLoadedWidget> {
  int _currentIndex = 1;
  List<Widget> priceWidget = [];

  @override
  Widget build(BuildContext context) {
    //print('planLength: ${widget.pricePlan.length}');
    for (var i in widget.pricePlan) {
      //print('name: ${i.planName}');
      //print('type: $i');
      priceWidget.add(SubscriptionFees(pricePlan: i));
      // print('widget ${priceWidget.length}');
    }
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.pricePlan.length,
                (index) {
                  final isActive = _currentIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _currentIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 5.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: isActive ? primaryColor : transparent,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: CustomTextStyle(
                        text: widget.pricePlan[index].planName,
                        color: isActive ? whiteColor : grayColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(child: ListView(
            children: [
              priceWidget[_currentIndex],
            ],
           )
          ),
          
        ],
      ),
    );
  }
}

// if (state is PaymentStateEnrollLoading) {
// Utils.loadingDialog(context);
// } else {
// Utils.closeDialog(context);
// if (state is PaymentStateEnrollError) {
// Utils.errorSnackBar(context, state.message);
// } else if (state is PaymentStateEnrollLoaded) {
// Utils.showSnackBar(context, state.message);
// }
// }
