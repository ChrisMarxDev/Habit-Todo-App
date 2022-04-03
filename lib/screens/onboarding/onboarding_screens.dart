import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mindful/app/assets.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/screens/login/login_screen.dart';
import 'package:mindful/util/analytics.dart';
import 'package:mindful/widgets/misc/logo_widget.dart';

import '../../util/logging.dart';
import '../edit_daily_routine/edit_routine_cubit.dart';
import 'onboarding_push_notifications_page.dart';
import 'onboarding_select_routines_page.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final List<RoutineElementDescription> selectedEntries = [];

  bool showLoginScreen = false;

  @override
  Widget build(BuildContext context) {
    final listPagesViewModel = [
      PageViewModel(
        title: tr('onboarding_welcome_title'),
        body: tr('onboarding_welcome_body'),
        image: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: LogoWidget(),
          ),
        ),
      ),
      PageViewModel(
        title: tr('onboarding_exponential_growth_title'),
        body: tr('onboarding_exponential_growth_description'),
        image: SvgPicture.asset(growthFlatIllu),
      ),
      // PageViewModel(
      //   title: tr('onboarding_welcome_title'),
      //   body: tr('onboarding_welcome_body'),
      //   image: const Center(
      //     child: Padding(
      //       padding: EdgeInsets.all(24),
      //       child: LogoWidget(),
      //     ),
      //   ),
      // ),
      PageViewModel(
        title: tr('onboarding_welcome_title'),
        bodyWidget: OnboardingSelectRoutines(
          selectedEntries: selectedEntries,
          toggleEntry: (selected, entry) {
            setState(() {
              if (selected) {
                selectedEntries.add(entry);
              } else {
                selectedEntries
                    .removeWhere((element) => element.entryId == entry.entryId);
              }
            });
          },
        ),
        // useScrollView: false,
        // image: const Center(
        //   child: Padding(
        //     padding: EdgeInsets.all(24.0),
        //     child: LogoWidget(),
        //   ),
        // ),
      ),
      PageViewModel(
        title: tr('onboarding_notifications_title'),
        useScrollView: false,
        bodyWidget: const OnboardingPushNotifications(),
      ),
    ];

    return showLoginScreen
        ? const LoginScreen()
        : Scaffold(
            body: SafeArea(
              child: IntroductionScreen(
                pages: listPagesViewModel,
                onDone: () {
                  logEvent(
                    'onboarding_done',
                  );
                  _goToLoginScreen();
                },
                onSkip: () {
                  logEvent(
                    'onboarding_skip',
                  );
                  _goToLoginScreen();
                },
                onChange: (page) {
                  logEvent('onboarding_page_change', {'page': page});
                  logger.i('changed onboarding page $page');
                  // if()
                },
                showSkipButton: true,
                skip: Text(
                  tr(
                    'onboarding_skip',
                  ),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).disabledColor,
                      ),
                ),
                next: const Icon(
                  Icons.navigate_next,
                ),
                done: Text(
                  tr('onboarding_done'),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                dotsDecorator: DotsDecorator(
                  size: const Size.square(10),
                  activeSize: const Size(20, 10),
                  activeColor: getPalette(context).primary,
                  color: Colors.black26,
                  spacing: const EdgeInsets.symmetric(horizontal: 3),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          );
  }

  void _goToLoginScreen() {
    context.read<EditRoutineCubit>().addMultipleEntries(selectedEntries);
    setState(() {
      showLoginScreen = true;
    });
    // Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    //     builder: (context) {
    //       return const LoginScreen();
    //     },
    //   ),
    // );
  }
}
