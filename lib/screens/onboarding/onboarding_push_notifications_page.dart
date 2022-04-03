import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindful/app/assets.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/logic/repositories/local_notifications_repository.dart';
import 'package:mindful/util/analytics.dart';
import 'package:mindful/util/snackbar_util.dart';

class OnboardingPushNotifications extends StatefulWidget {
  const OnboardingPushNotifications({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingPushNotifications> createState() =>
      _OnboardingPushNotificationsState();
}

class _OnboardingPushNotificationsState
    extends State<OnboardingPushNotifications> {
  DateTime alarmTime = DateTime(2020, 1, 1, 20, 15);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(notificationsIllu),
        SizedBox(
          height: 156,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: Theme.of(context).textTheme.headline4,
              ),
            ),
            child: CupertinoDatePicker(
              minuteInterval: 15,
              use24hFormat: context.locale.languageCode != 'en',
              initialDateTime: alarmTime,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (value) {
                setState(() {
                  logEvent('onboarding_select_alarm_time', {
                    'hour': value.hour,
                    'minute': value.minute,
                  });
                  alarmTime = value;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              logEvent('onboarding_set_alarm_permission');
              final notifications = di.get<LocalNotificationsRepository>();
              final isGranted = await notifications.checkPermission(null);
              logEvent(
                'onboarding_set_alarm_permission_result',
                {'permission': isGranted},
              );
              if (isGranted) {
                await notifications.scheduleDailyAlarm(
                  time: TimeOfDay.fromDateTime(alarmTime),
                  title: tr('daily_alarm_notification_title'),
                  body: tr('daily_alarm_notification_body'),
                );
                // ignore: use_build_context_synchronously
                showSnackBarText(
                  context,
                  tr('snackbar_enabled_notifications'),
                );

                logEvent('onboarding_set_alarm_scheduled', {
                  'hour': alarmTime.hour,
                  'minute': alarmTime.minute,
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                tr('notifications_set_alarm'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
