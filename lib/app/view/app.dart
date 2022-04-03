// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/bootstrap.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/cubits/brightness/brightness_cubit.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/screens/login/login_switcher.dart';
import 'package:mindful/screens/page_container/page_container_widget.dart';

import '../cubit_init.dart';
import 'context_init.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: const CubitInit(
        child: CustomMaterialApp(),
      ),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPaletteCubit, ColorPalette>(
      builder: (context, colorPalette) {
        return BlocBuilder<BrightnessCubit, ThemeMode>(
          builder: (context, brightness) {
            return MaterialApp(
              useInheritedMediaQuery: true,
              locale: kUseDevicePreview
                  ? DevicePreview.locale(context)
                  : context.locale,
              builder: DevicePreview.appBuilder,
              theme: themeData(dark: false, colorPalette: colorPalette),
              darkTheme: themeData(dark: true, colorPalette: colorPalette),
              themeMode: brightness,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              // home: const EditRoutineScreen(),
              home: ContextInit(
                child: LoginSwitcher(
                  loggedInBuilder: () {
                    return const PageContainerWidget();
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
