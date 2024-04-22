import 'package:flutter/material.dart';

enum DeviceTypes { mobile, tablet, unknown }

DeviceTypes getDeviceType(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Arbitrary threshold to differentiate between mobile and tablet
  double tabletThreshold = 600; // For example, 600 logical pixels

  return screenWidth >= tabletThreshold
      ? DeviceTypes.tablet
      : DeviceTypes.mobile;
}
