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
    apiKey: 'AIzaSyAkYVsVtrooiIa3QuVtEBvaDthS8jcn6Q8',
    appId: '1:898505909032:web:49ebfef8e98ec1ba56261d',
    messagingSenderId: '898505909032',
    projectId: 'tuto-next-js-7ade7',
    authDomain: 'tuto-next-js-7ade7.firebaseapp.com',
    storageBucket: 'tuto-next-js-7ade7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgXXAPZdkNRyrRTPbSqaY-4AsREbSA1NQ',
    appId: '1:898505909032:android:08163fbdead7efc656261d',
    messagingSenderId: '898505909032',
    projectId: 'tuto-next-js-7ade7',
    storageBucket: 'tuto-next-js-7ade7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALTbxilzvLhb6shRD-BqQl26z7MO47VcE',
    appId: '1:898505909032:ios:74f70524ee1b54c756261d',
    messagingSenderId: '898505909032',
    projectId: 'tuto-next-js-7ade7',
    storageBucket: 'tuto-next-js-7ade7.appspot.com',
    iosBundleId: 'com.example.taskManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALTbxilzvLhb6shRD-BqQl26z7MO47VcE',
    appId: '1:898505909032:ios:74f70524ee1b54c756261d',
    messagingSenderId: '898505909032',
    projectId: 'tuto-next-js-7ade7',
    storageBucket: 'tuto-next-js-7ade7.appspot.com',
    iosBundleId: 'com.example.taskManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAkYVsVtrooiIa3QuVtEBvaDthS8jcn6Q8',
    appId: '1:898505909032:web:f84dd6a920e9365e56261d',
    messagingSenderId: '898505909032',
    projectId: 'tuto-next-js-7ade7',
    authDomain: 'tuto-next-js-7ade7.firebaseapp.com',
    storageBucket: 'tuto-next-js-7ade7.appspot.com',
  );
}
