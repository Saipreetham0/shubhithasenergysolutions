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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYPT2zgOWEF-FwAWBRSlciPD7DXY7NRzg',
    appId: '1:85046497910:android:4ac408a53cce201113c557',
    messagingSenderId: '85046497910',
    projectId: 'shubhitha-s-energy-solutions',
    storageBucket: 'shubhitha-s-energy-solutions.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBNVSV1INha662rHgeA_v7FUEwNYaENvU',
    appId: '1:85046497910:ios:219917769119ca4513c557',
    messagingSenderId: '85046497910',
    projectId: 'shubhitha-s-energy-solutions',
    storageBucket: 'shubhitha-s-energy-solutions.appspot.com',
    androidClientId: '85046497910-8s66r6fivq92hmhpdt1bttb259ou7462.apps.googleusercontent.com',
    iosClientId: '85046497910-eb853cf8c0gm128sk33rqru3me16kk9m.apps.googleusercontent.com',
    iosBundleId: 'com.ksp.shubhithasenergysolutions',
  );
}