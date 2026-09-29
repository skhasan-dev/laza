import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laza/app.dart' show LazaApp;
import 'package:laza/core/index.dart' show initDependencyLocator;
import 'package:laza/firebase_options.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await init();

    runApp(const LazaApp());
  }, catchUnhandledExceptions);
}


Future<void> init() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    PlatformDispatcher.instance.onError = (error, stack) {
      catchUnhandledExceptions(error, stack);
      return true;
    };
  } finally {
    await initDependencyLocator();
  }
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
}
