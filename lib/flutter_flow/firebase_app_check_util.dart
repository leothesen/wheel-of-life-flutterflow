import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaEnterpriseProvider(
          '6Lcr2RgqAAAAAA0KHn_nCkGHzL0HwChvO6Sbyp0S'),
      androidProvider: AndroidProvider.playIntegrity,
    );
