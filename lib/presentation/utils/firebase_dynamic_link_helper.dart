// ignore_for_file: use_build_context_synchronously

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../config/go_route/routes.dart';

class FirebaseDynamicLinkHelper {
  static Future initDynamicLinks(BuildContext context) async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      if (initialLink.link.path == '/register') {
        Navigator.pushNamed(context, '/register');
      } else {
        Navigator.pushNamed(context, initialLink.link.path);
      }
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      debugPrint(
          "_handleDeepLinkFROMAnother truedsd  ${dynamicLinkData.link.path}");
      if (dynamicLinkData.link.path == '/register') {
        Navigator.pushNamed(context, '/register');
      } else {
        Navigator.pushNamed(context, dynamicLinkData.link.path);
      }
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
      // context.push(dynamicLinkData.link.path);
    }).onError((error) {
      // Handle errors
    });
  }

  // static Future initDynamicLinks(BuildContext context) async {
  //   print("Initial DynamicLinks");
  //   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  //   // Incoming Links Listener
  //   dynamicLinks.onLink.listen((dynamicLinkData) {
  //     final Uri uri = dynamicLinkData.link;
  //     final queryParams = uri.queryParameters;
  //     if (queryParams.isNotEmpty) {
  //       print("Incoming Link :$uri");
  //       //  your code here
  //       Navigator.pushNamed(context, RouteNames.signUpScreen);
  //     } else {
  //       Navigator.pushNamed(context, RouteNames.homeScreen);
  //       print("No Current Links");
  //       // your code here
  //     }
  //   });

  //   // Search for Firebase Dynamic Links
  //   PendingDynamicLinkData? data = await dynamicLinks
  //       .getDynamicLink(Uri.parse("https://remp.page.link/register"));
  //   final Uri uri = data!.link;
  //   print("Found The Searched Link: $uri");
  //   Navigator.pushNamed(context, RouteNames.signUpScreen);
  //   // your code here
  // }
}
