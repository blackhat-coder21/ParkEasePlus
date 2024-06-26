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
        return macos;
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
    apiKey: 'AIzaSyCaT3zWA1qjJ-P1e2A1GzOAbdciZWxgsiI',
    appId: '1:757530382736:web:3baf3effdae1e3bf7ce315',
    messagingSenderId: '757530382736',
    projectId: 'parkease-59b90',
    authDomain: 'parkease-59b90.firebaseapp.com',
    storageBucket: 'parkease-59b90.appspot.com',
    measurementId: 'G-J8LPBMCT1X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiey3v-6cfUH42kyGur4xJXIQM7l1N6kE',
    appId: '1:757530382736:android:361e9ff7b0811d347ce315',
    messagingSenderId: '757530382736',
    projectId: 'parkease-59b90',
    storageBucket: 'parkease-59b90.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWj2mwMBBkRfVQBdo2oax-hDPfcY1so8o',
    appId: '1:757530382736:ios:a0b41637c81f84a67ce315',
    messagingSenderId: '757530382736',
    projectId: 'parkease-59b90',
    storageBucket: 'parkease-59b90.appspot.com',
    iosBundleId: 'com.example.parkEase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWj2mwMBBkRfVQBdo2oax-hDPfcY1so8o',
    appId: '1:757530382736:ios:a0b41637c81f84a67ce315',
    messagingSenderId: '757530382736',
    projectId: 'parkease-59b90',
    storageBucket: 'parkease-59b90.appspot.com',
    iosBundleId: 'com.example.parkEase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCaT3zWA1qjJ-P1e2A1GzOAbdciZWxgsiI',
    appId: '1:757530382736:web:34ba658be7e2ec447ce315',
    messagingSenderId: '757530382736',
    projectId: 'parkease-59b90',
    authDomain: 'parkease-59b90.firebaseapp.com',
    storageBucket: 'parkease-59b90.appspot.com',
    measurementId: 'G-E0GTPR32DX',
  );
}
