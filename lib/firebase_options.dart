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
    apiKey: 'AIzaSyBO-n_dMnuECrblLh9f_ZHMyHTP8O4OZqU',
    appId: '1:531635005389:web:165cb2e5dbed50aa3f0684',
    messagingSenderId: '531635005389',
    projectId: 'peakabu-app',
    authDomain: 'peakabu-app.firebaseapp.com',
    storageBucket: 'peakabu-app.appspot.com',
    measurementId: 'G-W8M3PJ0LCE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5Dsgh_8zDCAhYswDZIRfMktSNMX7rjdk',
    appId: '1:531635005389:android:b5e2605f3e4a28ea3f0684',
    messagingSenderId: '531635005389',
    projectId: 'peakabu-app',
    storageBucket: 'peakabu-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBHYmdi0RocjKbENVcO5FtRfZ9q0yRgjE',
    appId: '1:531635005389:ios:21fe3ceb12a215c13f0684',
    messagingSenderId: '531635005389',
    projectId: 'peakabu-app',
    storageBucket: 'peakabu-app.appspot.com',
    iosClientId:
        '531635005389-anc7c47sbuhcc1osdg4redvr70ld8vn6.apps.googleusercontent.com',
    iosBundleId: 'com.peakabu.app',
  );
}
