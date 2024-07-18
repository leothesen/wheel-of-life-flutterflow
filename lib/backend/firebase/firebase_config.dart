import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBauegz5VZAgtFPHM1smSoNXuyRYlK4UgE",
            authDomain: "wheel-of-life-cj04yo.firebaseapp.com",
            projectId: "wheel-of-life-cj04yo",
            storageBucket: "wheel-of-life-cj04yo.appspot.com",
            messagingSenderId: "429846304913",
            appId: "1:429846304913:web:4a22cc3cfbd2b50fda8730"));
  } else {
    await Firebase.initializeApp();
  }
}
