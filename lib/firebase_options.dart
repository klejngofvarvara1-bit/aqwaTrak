import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCgl-D8iSOagxL0T0jTSOLcY01fFUCOdVM',
    authDomain: 'aqwatrak.firebaseapp.com',
    projectId: 'aqwatrak',
    storageBucket: 'aqwatrak.firebasestorage.app',
    messagingSenderId: '942371806216',
    appId: '1:942371806216:web:84941f6c4c593ef1b105bd',
  );
}
