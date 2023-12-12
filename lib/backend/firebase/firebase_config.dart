import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAfjNmY3OZb4TM5tOMSrmaiDXs2S_ekdKM",
            authDomain: "shopxchange-36f71.firebaseapp.com",
            projectId: "shopxchange-36f71",
            storageBucket: "shopxchange-36f71.appspot.com",
            messagingSenderId: "801452878226",
            appId: "1:801452878226:web:6de27869bfd560e274b94b",
            measurementId: "G-DTKM82X40M"));
  } else {
    await Firebase.initializeApp();
  }
}
