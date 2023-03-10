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
    apiKey: 'AIzaSyCP5ILAcIQJgAMe_QwvT2mMoCFsGWgErrI',
    appId: '1:946472396973:web:45e1d585b2b8d030ebfe24',
    messagingSenderId: '946472396973',
    projectId: 'flash-chat-da50a',
    authDomain: 'flash-chat-da50a.firebaseapp.com',
    storageBucket: 'flash-chat-da50a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVmxDE6Dt3f3rcAWw2E3N5uW_wlW7QJw0',
    appId: '1:946472396973:android:2945403bdb4f9830ebfe24',
    messagingSenderId: '946472396973',
    projectId: 'flash-chat-da50a',
    storageBucket: 'flash-chat-da50a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSYPdRG80Yp2rx2YfumCOlCS4ukqtvBAQ',
    appId: '1:946472396973:ios:fdd83f9ebc6c72aaebfe24',
    messagingSenderId: '946472396973',
    projectId: 'flash-chat-da50a',
    storageBucket: 'flash-chat-da50a.appspot.com',
    iosClientId: '946472396973-esn40n4ji8m8t8pm7sek71jqr0i1uoll.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChatStartingProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSYPdRG80Yp2rx2YfumCOlCS4ukqtvBAQ',
    appId: '1:946472396973:ios:fdd83f9ebc6c72aaebfe24',
    messagingSenderId: '946472396973',
    projectId: 'flash-chat-da50a',
    storageBucket: 'flash-chat-da50a.appspot.com',
    iosClientId: '946472396973-esn40n4ji8m8t8pm7sek71jqr0i1uoll.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChatStartingProject',
  );
}
