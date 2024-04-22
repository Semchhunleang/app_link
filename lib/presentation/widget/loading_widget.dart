import 'package:flutter/material.dart';

import '../utils/constraints.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: primaryColor));
    // return Center(child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_mJoATa65eI.json'));
    //return Center(child: Lottie.asset(KImages.animatedHouse));
  }
}
