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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCb_I3QZS6bgXzTpHbt8W2x-bOUdNMHB7Y',
    appId: '1:196564787648:web:b46043883ae9e572dca825',
    messagingSenderId: '196564787648',
    projectId: 'aerify-b4cfd',
    authDomain: 'aerify-b4cfd.firebaseapp.com',
    storageBucket: 'aerify-b4cfd.appspot.com',
    measurementId: 'G-HX1BYDK1R1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAm8urD1jRnFXTeWNWLI6SgyZ0t8N4GSks',
    appId: '1:196564787648:android:6868dd15c7b1ba8cdca825',
    messagingSenderId: '196564787648',
    projectId: 'aerify-b4cfd',
    storageBucket: 'aerify-b4cfd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClCVz12GOdtuo2tWE8l4PvwILBlSbzCR8',
    appId: '1:196564787648:ios:7e122fe9457bbfffdca825',
    messagingSenderId: '196564787648',
    projectId: 'aerify-b4cfd',
    storageBucket: 'aerify-b4cfd.appspot.com',
    iosBundleId: 'com.techpanda.aerify',
  );
}
