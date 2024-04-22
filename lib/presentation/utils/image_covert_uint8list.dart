import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

imageToUint8List(String imagePath) async {
  try {
    File file = File(imagePath);
    Uint8List bytes = await file.readAsBytes();
    return bytes;
  } catch (e) {
    debugPrint('Error converting image to Uint8List: $e');
    return null;
  }
}

Future<Uint8List?> getImageUint8List(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Failed to load image: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error loading image: $e');
    return null;
  }
}
