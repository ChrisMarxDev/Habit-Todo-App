import 'dart:async';
import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mindful/util/logging.dart';

void logEvent(
  String name, [
  Map<String, Object>? params,
]) {
  logger.i('[📊 Analytics Event] $name, ${jsonEncode(params)}');
  unawaited(
    Analytics.logEvent(name: name, parameters: params),
  );
}

class Analytics {
  static void setUserId(String user) {
    analytics.setUserId(id: user);
  }

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) =>
      analytics.logEvent(
        name: name,
        parameters: parameters,
      );

  static Future<void> setCurrentScreen({
    required String screenName,
    String? screenClassOverride,
  }) =>
      analytics.setCurrentScreen(
        screenName: screenName,
        screenClassOverride: screenClassOverride ?? 'Flutter',
      );
}

// mixin Track on Widget{
//   void trackScreen(){
//     Analytics.logEvent(name: this.)
//   }
// }
