import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/presentation/utils/utils.dart';
import '../../../data/model/order/single_order_model.dart';
import '../../../logic/cubit/order/order_cubit.dart';
import '../../utils/constraints.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';

class PurchaseDetailScreen extends StatelessWidget {
  const PurchaseDetailScreen({Key? key, required this.orderId})
      : super(key: key);
  final String orderId;

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrderCubit>();
    orderCubit.getOrderDetails(orderId);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(title: 'Items Details'),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const LoadingWidget();
          } else if (state is OrderError) {
            if (state.statusCode == 503) {
              return OrderDetailLoaded(orderDetail: orderCubit.singleOrder!);
            } else {
              return Center(
                  child: CustomTextStyle(text: state.message, color: redColor));
            }

            //Utils.errorSnackBar(context, state.message);
          }

          // else if (state is OrderLoaded) {
          //   return LoadedOrderWidget(orders: state.orders.orders!);
          // }
          return OrderDetailLoaded(orderDetail: orderCubit.singleOrder!);
        },
      ),
    );
  }
}

class OrderDetailLoaded extends StatelessWidget {
  const OrderDetailLoaded({Key? key, required this.orderDetail})
      : super(key: key);
  final SingleOrderModel orderDetail;

  @override
  Widget build(BuildContext context) {
    final user = context.read<OrderCubit>().orders!.user;
    print('type: ${orderDetail.expirationDate.runtimeType}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        physics: const BouncingScrollPhysics(),
        children: [
          // const CustomImage(path: KImages.logo),
          const SizedBox(height: 20.0),
          _addressComponent('Name', user!.name),
          _addressComponent('Phone', user.phone),
          _addressComponent('Email', user.email),
          _addressComponent('Location', user.address),
          const SizedBox(height: 20.0),
          _propertyComponent('Order ID', orderDetail.orderId),
          _propertyComponent(
              'Amount', Utils.formatPrice(context, orderDetail.planPrice)),
          _propertyComponent('Payment', orderDetail.paymentMethod),
          //_propertyComponent('Transaction', orderDetail.transactionId),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity.w,
            //height: 300.0,
            margin: const EdgeInsets.symmetric(horizontal: 0.0),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: borderRadius,
            ),
            child: Column(
              children: [
                tableContent('Package', orderDetail.planName),
                tableContent(
                    'Price', Utils.formatPrice(context, orderDetail.planPrice)),
                tableContent(
                    'Purchase', Utils.formatDate(orderDetail.createdAt)),
                tableContent(
                    'Expire', getRemainingDay(orderDetail.expirationDate)),
                tableContent(
                    'Remaining day', orderDetail.orderStatus.toUpperCase()),

                ///start here
                tableContent(
                    'Property', orderDetail.numberOfProperty.toString()),

                tableContent(
                    'Feature Property',
                    orderDetail.featuredProperty == 'enable'
                        ? 'Available'
                        : 'Unavailable'),

                tableContent('Feature Property',
                    orderDetail.featuredPropertyQty.toString()),

                tableContent(
                    'Top Property',
                    orderDetail.topProperty == 'enable'
                        ? 'Available'
                        : 'Unavailable'),

                tableContent(
                    'Top Property', orderDetail.topPropertyQty.toString()),

                tableContent(
                    'Urgent Property',
                    orderDetail.urgentProperty == 'enable'
                        ? 'Available'
                        : 'Unavailable'),

                tableContent('Urgent Property',
                    orderDetail.urgentPropertyQty.toString()),

                tableContent(
                    'Remaining day', orderDetail.orderStatus.toUpperCase()),
                paymentContent('Payment Status', orderDetail.paymentStatus,
                    isLast: true),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }

  String getRemainingDay(String date) {
    if (date.contains('/') || date.contains('-') || date.contains(':')) {
      return Utils.formatDate(date);
    } else {
      return date;
    }
  }

  Widget tableContent(String text, String value, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0)
              .copyWith(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextStyle(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: detailFontSize,
              ),
              CustomTextStyle(
                text: value,
                fontWeight: FontWeight.w500,
                fontSize: detailFontSize,
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          width: double.infinity,
          color: isLast ? transparent : borderColor,
        ),
      ],
    );
  }

  Widget paymentContent(String text, String value, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0)
              .copyWith(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextStyle(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: detailFontSize,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                    color: value == 'success' ? greenColor : redColor,
                    borderRadius: borderRadius),
                child: CustomTextStyle(
                  text: value,
                  color: whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: detailFontSize,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          width: double.infinity,
          color: isLast ? transparent : borderColor,
        ),
      ],
    );
  }

  Widget _addressComponent(String text, String value) {
    return Row(
      children: [
        CustomTextStyle(
          text: '$text: ',
          color: blackColor,
          fontSize: detailFontSize,
        ),
        CustomTextStyle(
          text: value,
          color: grayColor,
          fontSize: detailFontSize,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }

  Widget _propertyComponent(String text, String value) {
    return Row(
      children: [
        CustomTextStyle(
          text: '$text: ',
          color: blackColor,
          fontSize: detailFontSize,
        ),
        CustomTextStyle(
          text: value,
          color: primaryColor,
          fontSize: detailFontSize,
          maxLine: 2,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}
