import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/repositories/purchases_repository.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  FirebaseFirestore get firestore => FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();

  PurchasesRepository get initPlatformState =>
      PurchasesRepository()..initPlatformState();

  // FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

  FirebaseRemoteConfig get remoteConfig {
    return FirebaseRemoteConfig.instance;
  }
}
