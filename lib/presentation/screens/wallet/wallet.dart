import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/presentation/widget/custom_app_bar.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Point', showButton: false,),
      body: Container(
        alignment: Alignment.center,
        child: CustomTextStyle(text: "Wallet Screen"),
      ),
    );
  }
}