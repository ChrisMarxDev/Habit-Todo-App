// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/util/logging.dart';

late Flavor kAppFlavor;
bool kIsDevelop = kAppFlavor != Flavor.production;

final bool kUseDevicePreview = Platform.isMacOS;

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  Flavor flavor,
  FirebaseOptions firebaseOptions,
) async {
  kAppFlavor = flavor;

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(options: firebaseOptions);

  debugPrintGestureArenaDiagnostics = true;

  await EasyLocalization.ensureInitialized();

  FlutterError.onError = (details) {
    logger.e(details.exceptionAsString(), details.exception, details.stack);
  };

  // await Firebase.initializeApp();
  //
  // FirebaseFirestore.instance;
  //
  // if (!kIsWeb) {
  //   final crashlytics = FirebaseCrashlytics.instance;
  //   await crashlytics.setCrashlyticsCollectionEnabled(true);
  //   FlutterError.onError = (details) {
  //     crashlytics.recordFlutterError(details);
  //     logger.e(details.exceptionAsString(), details.exception, details.stack);
  //   };
  // } else {
  //   FlutterError.onError = (details) {
  //     logger.e(details.exceptionAsString(), details.exception, details.stack);
  //   };
  // }
  //
  // await RemoteConfig.instance.fetchAndActivate();

  // setup service locators
  await configureDependencies();

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async {
          final build = await builder();
          runApp(
            DevicePreview(
              // ignore: avoid_redundant_argument_values
              enabled: !kReleaseMode && kUseDevicePreview,
              builder: (context) => build,
            ),
          );
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) {
      if (!kIsWeb) {
        // FirebaseCrashlytics.instance.recordError(
        //   error,
        //   stackTrace,
        // );
      }
      logger.e(error.toString(), error, stackTrace);
    },
  );
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

enum Flavor { production, develop, staging }
