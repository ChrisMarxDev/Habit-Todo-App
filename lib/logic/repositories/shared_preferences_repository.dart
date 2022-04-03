import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyUserId = 'com.innofully.christophermarx.mindful.userid';
const String notificationPermissionGrantedKey =
    'com.innofully.christophermarx.mindful.notification_permission_granted';
const String keyBrightness = 'com.innofully.christophermarx.mindful.brightness';
const String keyColorPalette =
    'com.innofully.christophermarx.mindful.keyColorPalette';

@injectable
@singleton
class SharedPreferencesRepository {
  final SharedPreferences _sp;

  SharedPreferencesRepository(SharedPreferences sharedPreferences)
      : _sp = sharedPreferences;

  String _stringGet(String key, {String defaultValue = ''}) =>
      _sp.getString(key) ?? defaultValue;

  Future<bool> _stringSet(String key, String value) async =>
      _sp.setString(key, value);

  int _intGet(String key, {int defaultValue = 0}) =>
      _sp.getInt(key) ?? defaultValue;

  Future<bool> _intSet(String key, int value) async => _sp.setInt(key, value);

  bool _boolGet(String key, {bool defaultValue = false}) =>
      _sp.getBool(key) ?? defaultValue;

  Future<bool> _boolSet(String key, bool value) async =>
      _sp.setBool(key, value);

  //_________________________________________________________________

  String getUserId() => _stringGet(keyUserId);

  Future<bool> setUserId(String value) => _stringSet(keyUserId, value);

  Future<bool> clearUserId() => _sp.remove(keyUserId);

  ThemeMode getBrightness() =>
      ThemeMode.values[_intGet(keyBrightness, defaultValue: 1)];

  Future<bool> setBrightness(ThemeMode value) =>
      _intSet(keyBrightness, value.index);

  ColorPalette? getActivePalette() => colorPalettes[
      _stringGet(keyColorPalette, defaultValue: basePalette.name)];

  Future<bool> setActivePalette(ColorPalette value) =>
      _stringSet(keyColorPalette, value.name);

  bool hasNotificationPermissionGranted() =>
      _boolGet(notificationPermissionGrantedKey);

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setNotificationPermissionGranted(bool value) =>
      _boolSet(notificationPermissionGrantedKey, value);
}
