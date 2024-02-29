// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBOAzDOzR92922h_Sio7sfMzxDGgSv0j3k',
    appId: '1:1006899885328:web:04f9b0eae7c98e0852a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    authDomain: 'senim-79c06.firebaseapp.com',
    storageBucket: 'senim-79c06.appspot.com',
    measurementId: 'G-39Z35BTM3R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFVQPASYgut6o-hKRadpsH_0NvMxWXWYg',
    appId: '1:1006899885328:android:813ac1a2826a897252a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    storageBucket: 'senim-79c06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5dcLyLOnr8O_6AT59_eNw8Iv8TH_5E8c',
    appId: '1:1006899885328:ios:91be6a909da60dfc52a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    storageBucket: 'senim-79c06.appspot.com',
    androidClientId: '1006899885328-r4je32lv8djpnrsbd32o8cl9lbdsodjp.apps.googleusercontent.com',
    iosClientId: '1006899885328-sgjesalp9at87ifkp42ts3bd3iiscnf8.apps.googleusercontent.com',
    iosBundleId: 'com.example.senim',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5dcLyLOnr8O_6AT59_eNw8Iv8TH_5E8c',
    appId: '1:1006899885328:ios:91be6a909da60dfc52a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    storageBucket: 'senim-79c06.appspot.com',
    androidClientId: '1006899885328-r4je32lv8djpnrsbd32o8cl9lbdsodjp.apps.googleusercontent.com',
    iosClientId: '1006899885328-sgjesalp9at87ifkp42ts3bd3iiscnf8.apps.googleusercontent.com',
    iosBundleId: 'com.example.senim',
  );
}