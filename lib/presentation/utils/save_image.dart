// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:real_estate/presentation/utils/save_result.dart';

// import 'request_storage_permission.dart';

// Future<Object> saveImageToGallery(Uint8List imageBytes, BuildContext context) async {
//   Object res = {};
//   if (await requestStoragePermission()) {
//     debugPrint('---------- before save image');
//     final result = await ImageGallerySaver.saveImage(imageBytes);
//     // debugPrint('---------- before save image 1');
//     if(result['isSuccess']) {
//      return res = {
//         'isSave': true,
//        'message':'Qr code was downloaded in your gallery',
//       };
//       // debugPrint('---------- success save image');
//       // Show a success message (optional)
//     } else {
//      return res = {
//       'isSave': false,
//        'message':'Something went wrong!',
//       };
//       // debugPrint('---------- error save image');
//       // Handle saving error (optional)
//     }
//   }else{
//     return res = {
//       'isSave': false,
//        'message':'You denied to save image to gallery.',
//     };
//   }
//   // return res;
// }
