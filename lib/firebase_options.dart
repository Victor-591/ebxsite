import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
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
    apiKey: 'AIzaSyD2iT2B7DbRZ2tFN-8cf05SgpmMBcXV7A8',
    appId: '1:149861354267:web:21899046eb6032c38561be',
    messagingSenderId: '149861354267',
    projectId: 'ebxsite-6963a',
    authDomain: 'ebxsite-6963a.firebaseapp.com',
    storageBucket: 'ebxsite-6963a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFN-gtjT01vIbxxuaKvpKo_L9AHHHp2A8',
    appId: '1:149861354267:android:850a4a2541b08ab18561be',
    messagingSenderId: '149861354267',
    projectId: 'ebxsite-6963a',
    storageBucket: 'ebxsite-6963a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhC4sEtbO7nU7ssZIKlOkR5_cmJ_FFCHg',
    appId: '1:149861354267:ios:460491055d0f5eb68561be',
    messagingSenderId: '149861354267',
    projectId: 'ebxsite-6963a',
    storageBucket: 'ebxsite-6963a.firebasestorage.app',
    iosBundleId: 'com.example.ebx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhC4sEtbO7nU7ssZIKlOkR5_cmJ_FFCHg',
    appId: '1:149861354267:ios:460491055d0f5eb68561be',
    messagingSenderId: '149861354267',
    projectId: 'ebxsite-6963a',
    storageBucket: 'ebxsite-6963a.firebasestorage.app',
    iosBundleId: 'com.example.ebx',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2iT2B7DbRZ2tFN-8cf05SgpmMBcXV7A8',
    appId: '1:149861354267:web:f92ec478ec530bb48561be',
    messagingSenderId: '149861354267',
    projectId: 'ebxsite-6963a',
    authDomain: 'ebxsite-6963a.firebaseapp.com',
    storageBucket: 'ebxsite-6963a.firebasestorage.app',
  );

}