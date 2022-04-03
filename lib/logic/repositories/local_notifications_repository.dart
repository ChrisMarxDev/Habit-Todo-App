import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';
import 'package:mindful/util/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

const androidIconDrawable = 'ic_launch_image';
const androidNotificationChannelId = 'HealAdvisor';
const androidNotificationChannelName = 'HealAdvisor';
const androidNotificationChannelDescription = 'HealAdvisor';
const dailyReminderId = 123;

@injectable
@singleton
class LocalNotificationsRepository {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final SharedPreferencesRepository sharedPreferencesRepository;
  bool isInitialized = false;

  LocalNotificationsRepository(
    this.flutterLocalNotificationsPlugin,
    this.sharedPreferencesRepository,
  );

  Future<void> init(SelectNotificationCallback onTapNotification) async {
    logger.i('LocalNotificationsRepository init');

    if (sharedPreferencesRepository.hasNotificationPermissionGranted() &&
        !isInitialized) {
      final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      const initializationSettingsAndroid =
          AndroidInitializationSettings(androidIconDrawable);
      const initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );
      const initializationSettingsMacOS = MacOSInitializationSettings();
      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS,
      );
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: onTapNotification,
      );
      await _configureLocalTimeZone();
      isInitialized = true;
    }
  }

// initialize timezones
  static Future<void> _configureLocalTimeZone() async {
    // if (kIsWeb || Platform.isLinux) {
    //   return;
    // }
    tz.initializeTimeZones();
    // final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    // tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    logger.i(
      'LocalNotificationsRepository onDidReceiveLocalNotification, $id, $title, $body, $body',
    );
  }

// check and ask for permission
  Future<bool> checkPermission(Future<bool> Function()? showDialog) async {
    if (!sharedPreferencesRepository.hasNotificationPermissionGranted()) {
      final permission = await Permission.notification.request();
      if (permission.isPermanentlyDenied && showDialog != null) {
        await showDialog.call();
      }
      final isGranted = await Permission.notification.isGranted;
      if (isGranted) {
        await sharedPreferencesRepository
            .setNotificationPermissionGranted(true);
        await init((payload) {});
      }
      return isGranted;
    } else {
      return true;
    }
  }

  Future<void> scheduleDailyAlarm({
    required TimeOfDay time,
    required String title,
    required String body,
  }) async {
    final now = DateTime.now();
    return _zonedScheduleNotification(
      id: dailyReminderId,
      dateTime: DateTime(now.year, now.month, now.day, time.hour, time.minute),
      title: title,
      body: body,
    );
  }

  Future<void> _zonedScheduleNotification({
    required int id,
    required DateTime dateTime,
    required String title,
    String body = '',
    String? payload,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _getTzDateFromDateTime(dateTime),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannelId,
          androidNotificationChannelName,
          icon: androidIconDrawable,
          channelDescription: androidNotificationChannelDescription,
        ),
      ),
      androidAllowWhileIdle: true,
      payload: payload,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelDailyNotification() {
    return flutterLocalNotificationsPlugin.cancel(dailyReminderId);
  }

  tz.TZDateTime _getTzDateFromDateTime(DateTime dateTime) {
    final scheduledDate = tz.TZDateTime.from(
      dateTime,
      tz.local,
    );
    if (scheduledDate.isBefore(DateTime.now())) {
      scheduledDate.add(const Duration(days: 1));
    }
    logger.i(
      'Time for scheduled push notification ${scheduledDate.toIso8601String()}',
    );
    return scheduledDate;
  }

  Future<void> getScheduledAlarms() async {
    final pending =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    if (pending.isNotEmpty) {
      // final daily = pending.first;
      // flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    }
  }
}
