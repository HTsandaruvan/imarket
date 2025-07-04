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
    apiKey: 'AIzaSyD0SZ-Uo6Cveao2oEI1QSxjLTEotdQ-74E',
    appId: '1:949463043143:web:f8e6a21bad4b8969e9b562',
    messagingSenderId: '949463043143',
    projectId: 'imarket-8b026',
    authDomain: 'imarket-8b026.firebaseapp.com',
    storageBucket: 'imarket-8b026.firebasestorage.app',
    measurementId: 'G-991FCB4ELK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsAmQsdxbBZnGeL0Fgph6_MXBTnV8YVrY',
    appId: '1:949463043143:android:f0a02e84885666efe9b562',
    messagingSenderId: '949463043143',
    projectId: 'imarket-8b026',
    storageBucket: 'imarket-8b026.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOHOZU4ZxtMKhcO4G_GwIR4jTqS5y5iAA',
    appId: '1:949463043143:ios:4499f60882dd0f4be9b562',
    messagingSenderId: '949463043143',
    projectId: 'imarket-8b026',
    storageBucket: 'imarket-8b026.firebasestorage.app',
    iosBundleId: 'com.example.imarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOHOZU4ZxtMKhcO4G_GwIR4jTqS5y5iAA',
    appId: '1:949463043143:ios:4499f60882dd0f4be9b562',
    messagingSenderId: '949463043143',
    projectId: 'imarket-8b026',
    storageBucket: 'imarket-8b026.firebasestorage.app',
    iosBundleId: 'com.example.imarket',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0SZ-Uo6Cveao2oEI1QSxjLTEotdQ-74E',
    appId: '1:949463043143:web:ce4b13bad06441aee9b562',
    messagingSenderId: '949463043143',
    projectId: 'imarket-8b026',
    authDomain: 'imarket-8b026.firebaseapp.com',
    storageBucket: 'imarket-8b026.firebasestorage.app',
    measurementId: 'G-Z24JLJKKSK',
  );
}
