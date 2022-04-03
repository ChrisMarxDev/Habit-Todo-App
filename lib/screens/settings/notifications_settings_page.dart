import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/repositories/local_notifications_repository.dart';
import 'package:mindful/screens/onboarding/onboarding_push_notifications_page.dart';
import 'package:mindful/util/snackbar_util.dart';

import 'base_settings_sub_page.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSettingsSubPage(
      title: tr('settings_tile_notifications_title'),
      child: Column(
        children: [
          const OnboardingPushNotifications(),
          const SizedBox(
            height: Dimens.unit2,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(deleteRed),
            ),
            onPressed: () {
              final notifications = di.get<LocalNotificationsRepository>();
              unawaited(notifications.cancelDailyNotification());
              showSnackBarText(
                context,
                tr('snackbar_removed_notifications'),
              );
            },
            child: Text(
              tr('notifications_remove'),
            ),
          ),
        ],
      ),
    );
  }
}
