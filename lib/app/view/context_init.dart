// initializes all dependencies that need a context to act, e.g. push notification interception
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/logic/repositories/local_notifications_repository.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';
import 'package:mindful/screens/edit_daily_routine/edit_routine_cubit.dart';
import 'package:mindful/util/logging.dart';

class ContextInit extends StatefulWidget {
  final Widget child;

  const ContextInit({required this.child, Key? key}) : super(key: key);

  @override
  State<ContextInit> createState() => _ContextInitState();
}

class _ContextInitState extends State<ContextInit> {
  @override
  void initState() {
    unawaited(
      di.get<LocalNotificationsRepository>().init(
        (payload) {
          logger.i(
            '📩 Received local notification with payload: $payload',
          );
        },
      ),
    );
    final sharedPref = di.get<SharedPreferencesRepository>();
    if (sharedPref.getUserId().isNotEmpty) {
      context.read<EditRoutineCubit>().init();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
