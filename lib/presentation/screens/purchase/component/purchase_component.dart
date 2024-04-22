import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/presentation/utils/utils.dart';
import '../../../../data/model/order/single_order_model.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/primary_button.dart';

class PurchaseComponent extends StatelessWidget {
  const PurchaseComponent({Key? key, required this.singleOrder})
      : super(key: key);
  final SingleOrderModel singleOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 200.0.h,
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.0.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextStyle(
                text: Utils.formatDate(singleOrder.createdAt),
                fontSize: detailFontSize,
                color: const Color(0xFF7E8BA0),
              ),
              PrimaryButton(
                text: singleOrder.orderStatus,
                onPressed: () {},
                fontSize: subtitleFontSize,
                bgColor: singleOrder.orderStatus == 'expired'
                    ? redColor
                    : greenColor,
                borderRadiusSize: 3.0,
                minimumSize: Size(64.0.w, 50),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextStyle(
                text: singleOrder.planName,
                fontSize: titleFontSize,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
              CustomTextStyle(
                text: Utils.formatPrice(context, singleOrder.planPrice),
                fontSize: subtitleFontSize,
                color: blackColor,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          SizedBox(height: 16.0.h),
          ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  splashFactory: NoSplash.splashFactory,
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: borderRadius)),
                  minimumSize: MaterialStateProperty.all(
                      Size(double.infinity.w, 50))),
              onPressed: () => Navigator.pushNamed(
                  context, RouteNames.purchaseDetailsScreen,
                  arguments: singleOrder.orderId),
              icon: const Icon(
                Icons.visibility,
                size: iconSize,
                color: whiteColor,
              ),
              label: const CustomTextStyle(
                text: 'View Details',
                fontSize: subtitleFontSize,
                color: whiteColor,
              ))
        ],
      ),
    );
  }
}
