import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/logic/cubits/login/login_cubit.dart';
import 'package:mindful/logic/cubits/premium_subscription/premium_subscription_cubit.dart';
import 'package:mindful/screens/onboarding/onboarding_screens.dart';
import 'package:mindful/widgets/misc/loading_widget.dart';

import '../../util/logging.dart';
import '../edit_daily_routine/edit_routine_cubit.dart';

class LoginSwitcher extends StatelessWidget {
  final Widget Function() loggedInBuilder;

  const LoginSwitcher({
    required this.loggedInBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.when(
          loading: () {},
          loggedIn: (user) async {
            // sometimes the keyboard still sticks out
            FocusScope.of(context).unfocus();
            unawaited(
              context
                  .read<PremiumSubscriptionCubit>()
                  .refreshSubscriptionState(),
            );
            // Save the entries after logging in, to actually persist the entries that were done while onboarding
            // needs to wait because a user id is needed to properly save them
            // await context
            //     .read<EditRoutineCubit>()
            //     .saveEntries(dontDebounce: true);

            // init only after logged in successfully, to prevent loading errors
            unawaited(context.read<EditRoutineCubit>().init());
            // ignore: use_build_context_synchronously

            // TODO improve logic and save in shared preferences
            // enabled notifications after onboarding
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          loggedOut: () {
            context.read<PremiumSubscriptionCubit>().refreshSubscriptionState();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      },
      builder: (context, state) {
        logger.i('New logged in state building: $state');
        return state.map(
          loading: (value) => const LoadingWidget(),
          loggedIn: (value) => loggedInBuilder(),
          loggedOut: (value) => const OnboardingScreens(),
          // loggedOut: (value) => const OnboardingScreens(),
        );
      },
    );
  }
}
