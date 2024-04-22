import 'package:flutter/cupertino.dart';
import 'package:real_estate/data/model/online_payment/agrument_product_model.dart';

import '../../../../data/model/online_payment/product_data_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';
import 'subscription_description.dart';

class CustomProductList extends StatefulWidget {
  final List<ProductDataModel> productDataList;
  final ArgumentProductModel argumentProductModel;
  const CustomProductList(
      {super.key,
      required this.productDataList,
      required this.argumentProductModel});

  @override
  State<CustomProductList> createState() => _CustomProductListState();
}

class _CustomProductListState extends State<CustomProductList> {
  int _currentIndex = 1;
  List<Widget> descriptionListWidget = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              // 3,
              widget.productDataList.length,
              (index) {
                // final isActive = _currentIndex == index;
                final isActive = _currentIndex == index;
                descriptionListWidget.add(SubscriptionDescription(
                  productDataModel: widget.productDataList[index],
                  argumentProductModel: widget.argumentProductModel,
                ));
                return GestureDetector(
                  onTap: () => setState(() => _currentIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 5.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: isActive ? primaryColor : transparent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: CustomTextStyle(
                      // text: "Basic",
                      text: " ${widget.productDataList[index].name}",
                      color: isActive ? whiteColor : grayColor,
                      fontWeight: FontWeight.w500,
                      fontSize: titleFontSize,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [descriptionListWidget[_currentIndex]],
          ),
        ),
        // Expanded(
        //     child: SingleChildScrollView(
        //   child: Column(
        //       children: widget.productDataList.map((e) {
        //     return Column(
        //       children: e.descriptionProductModel.asMap().entries.map((e) {
        //         return const SubscriptionDescription();
        //       }).toList(),
        //     );
        //   }).toList()),
        // )),
      ],
    );
  }
}
