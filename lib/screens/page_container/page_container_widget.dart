import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/screens/daily_entry/daily_entry_screen.dart';
import 'package:mindful/screens/edit_daily_routine/edit_daily_routine_screen.dart';
import 'package:mindful/screens/routine_summary/routine_summary_screen.dart';
import 'package:mindful/screens/settings/settings_screen.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';
import 'package:mindful/util/extensions/text_theme_extension.dart';

import '../test_screen.dart';

class PageContainerWidget extends StatefulWidget {
  const PageContainerWidget({Key? key}) : super(key: key);

  @override
  _PageContainerWidgetState createState() => _PageContainerWidgetState();
}

class _PageContainerWidgetState extends State<PageContainerWidget> {
  final int itemCount = 3;
  int index = 1;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return tr('summary_screen_title');
      case 1:
        return DateTime.now().toTitle(context);
      case 2:
        return tr('edit_routine_title');
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      appBar: MainAppBar(
        title: getTitle(context, index),
        actions: [
          TestScreen.action(context),
          SettingsScreen.action(context),
        ],
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          RoutineSummaryScreen(),
          DailyEntryScreen(),
          EditRoutineScreen(),
        ],

        // itemCount: itemCount,
        // itemBuilder: (context, index) {
        //   switch (index) {
        //     case 0:
        //       return const RoutineSummaryScreen();
        //     case 1:
        //       return const DailyEntryScreen();
        //     case 2:
        //       return const EditRoutineScreen();
        //   }
        //   return Container();
        // },
      ),
      bottomNavigationBar: CustomBottomBar(
        index: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }
}

const navBarPadding = 16.0;

class CustomBottomBar extends StatelessWidget {
  final int index;
  final void Function(int) onTap;

  const CustomBottomBar({
    required this.index,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: const Icon(LineAwesomeIcons.calendar),
        label: tr('bottom_nav_item_dashboard'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(LineAwesomeIcons.check),
        label: tr('bottom_nav_item_check'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(LineAwesomeIcons.wrench),
        label: tr('bottom_nav_item_plan'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = context.primary();
    final passiveColor = context.onPrimary();

    return SafeArea(
      child: Stack(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: navBarPadding, right: navBarPadding, top: 0, bottom: 0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(Dimens.bottomNavBarRadius),
          //       ),
          //       // color: Colors.white.withOpacity(0.75),
          //       color: Colors.white.withOpacity(1),
          //     ),
          //     // child: SnakeNavigationBar.color(
          //     //   items: buildBottomNavBarItems(),
          //     // ),
          //     height: kBottomNavigationBarHeight,
          //
          //     child: ClipRRect(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(Dimens.bottomNavBarRadius),
          //       ),
          //       child: BackdropFilter(
          //         filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          //         child: Center(child: Container()),
          //       ),
          //     ),
          //   ),
          // ),
          SnakeNavigationBar.color(
            padding: EdgeInsets.only(
              left: navBarPadding,
              right: navBarPadding,
              bottom: MediaQuery.of(context).viewPadding.bottom > 20
                  ? 0
                  : Dimens.unit2,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(24),
              //   topLeft: Radius.circular(24),
              // ),
            ),
            elevation: 6,
            // shadowColor: Colors.white,
            // padding: const EdgeInsets.all(0),
            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Colors.white,
            currentIndex: index,
            onTap: onTap,
            snakeViewColor: activeColor,
            selectedItemColor: passiveColor,
            unselectedItemColor: activeColor,
            items: buildBottomNavBarItems(),
          ),
        ],
      ),
    );
  }
}

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  final String title;

  const MainAppBar({
    this.actions,
    required this.title,
    Key? key,
    // ignore: avoid_field_initializers_in_const_classes
  })  : preferredSize = const Size.fromHeight(56),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    const borderRadius = 24.0;
    return AppBar(
      actions: actions,
      elevation: 2,
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).colorScheme.primary,
      title: Text(title),
      titleSpacing: 32,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
        ),
      ),
    );
  }
}
