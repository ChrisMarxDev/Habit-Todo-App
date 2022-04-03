// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../logic/repositories/firebase_storage_repository.dart' as _i7;
import '../logic/repositories/firestore_manager.dart' as _i14;
import '../logic/repositories/local_notifications_repository.dart' as _i15;
import '../logic/repositories/purchases_repository.dart' as _i9;
import '../logic/repositories/remote_config_manager.dart' as _i10;
import '../logic/repositories/shared_preferences_repository.dart' as _i12;
import '../logic/repositories/user_repository.dart' as _i13;
import 'register_module.dart' as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.factory<_i4.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i5.FirebaseRemoteConfig>(() => registerModule.remoteConfig);
  gh.factory<_i6.FirebaseStorage>(() => registerModule.firebaseStorage);
  gh.factory<_i7.FirebaseStorageRepository>(
      () => _i7.FirebaseStorageRepository(storage: get<_i6.FirebaseStorage>()));
  gh.factory<_i8.FlutterLocalNotificationsPlugin>(
      () => registerModule.flutterLocalNotificationsPlugin);
  gh.factory<_i9.PurchasesRepository>(() => registerModule.initPlatformState);
  gh.factory<_i10.RemoteConfigManager>(() =>
      _i10.RemoteConfigManager(remoteConfig: get<_i5.FirebaseRemoteConfig>()));
  await gh.factoryAsync<_i11.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i12.SharedPreferencesRepository>(
      () => _i12.SharedPreferencesRepository(get<_i11.SharedPreferences>()));
  gh.factory<_i13.AuthRepository>(() => _i13.AuthRepository(
      sharedPreferencesRepository: get<_i12.SharedPreferencesRepository>(),
      firebaseAuth: get<_i3.FirebaseAuth>()));
  gh.factory<_i14.FirestoreManager>(() => _i14.FirestoreManager(
      sharedPref: get<_i12.SharedPreferencesRepository>(),
      firestore: get<_i4.FirebaseFirestore>()));
  gh.factory<_i15.LocalNotificationsRepository>(() =>
      _i15.LocalNotificationsRepository(
          get<_i8.FlutterLocalNotificationsPlugin>(),
          get<_i12.SharedPreferencesRepository>()));
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {}
