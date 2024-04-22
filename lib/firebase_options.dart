// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA5B4-3LWbNh6mdhbIWsorTGCWA2Kx8JHQ',
    appId: '1:397285538208:web:7972affad4133d7570ccc5',
    messagingSenderId: '397285538208',
    projectId: 'remp-25fa3',
    authDomain: 'remp-25fa3.firebaseapp.com',
    storageBucket: 'remp-25fa3.appspot.com',
    measurementId: 'G-X8DCV03Y88',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhdzT8cN12YYOQcKQVBpTtVPz8ySiRC_s',
    appId: '1:397285538208:android:269aeed58ad0614270ccc5',
    messagingSenderId: '397285538208',
    projectId: 'remp-25fa3',
    storageBucket: 'remp-25fa3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdB4kMRUq_RTXTB4V_i8QFvwmVsRw5Hvo',
    appId: '1:397285538208:ios:b715267a81a576cd70ccc5',
    messagingSenderId: '397285538208',
    projectId: 'remp-25fa3',
    storageBucket: 'remp-25fa3.appspot.com',
    iosBundleId: 'com.remp.co',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA5B4-3LWbNh6mdhbIWsorTGCWA2Kx8JHQ',
    appId: '1:397285538208:web:daadd66c73cfbd5e70ccc5',
    messagingSenderId: '397285538208',
    projectId: 'remp-25fa3',
    authDomain: 'remp-25fa3.firebaseapp.com',
    storageBucket: 'remp-25fa3.appspot.com',
    measurementId: 'G-8V52M1M70B',
  );
}