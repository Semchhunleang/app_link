import 'package:flutter/material.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';

class MyDealsScreen extends StatelessWidget {
  const MyDealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: const CustomAppBar(
        title: 'My Deals',
        showButton: false,
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            itemBuilder: (context, index) {
              return const Text('All item is commented');
              // const SinglePropertyCardView()
            },
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
