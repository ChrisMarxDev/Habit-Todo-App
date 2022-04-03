import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/cubits/brightness/brightness_cubit.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/logic/cubits/login/login_cubit.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';
import 'package:mindful/screens/legals/base_legal_screen.dart';
import 'package:mindful/screens/settings/notifications_settings_page.dart';
import 'package:mindful/screens/settings/settings_tile.dart';
import 'package:mindful/widgets/color_palette_row.dart';
import 'package:mindful/widgets/image_option_button.dart';

import 'cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static Widget action(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute<dynamic>(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
        child: const Icon(Icons.settings),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: const SettingsBuilder(),
    );
  }
}

class SettingsBuilder extends StatelessWidget {
  const SettingsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return const SettingsView();
        },
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        // foregroundColor: getPalette(context).primary,
        title: Text(
          tr('settings_title'),
          // style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: Dimens.unit2,
          right: Dimens.unit2,
          top: Dimens.unit3,
        ),
        children: [
          SettingsTile(
            title: tr('settings_tile_notifications_title'),
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (context) {
                    return const NotificationsSettingsPage();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: Dimens.unit2,
          ),
          SettingsTitleTile(
            title: tr('color_palette_style_title'),
          ),
          Column(
            children: colorPalettes.values
                .map((value) => ColorPaletteRowSelector(palette: value))
                .toList(),
          ),
          // const BrightnessSelector(),
          const SizedBox(
            height: Dimens.unit4,
          ),
          Text(tr('contact_us')),
          const SizedBox(
            height: Dimens.unit4,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push<void>(
                BaseLegalScreen.route(
                  tr('about_us_title'),
                  tr('about_us_body'),
                ),
              );
            },
            child: Text(tr('about_us_title')),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push<void>(
                BaseLegalScreen.route(
                  tr('privacy_title'),
                  tr('privacy_body'),
                ),
              );
            },
            child: Text(tr('privacy_title')),
          ),
          const SizedBox(
            height: Dimens.unit4,
          ),
          TextButton(
            onPressed: () => context.read<LoginCubit>().logout(),
            child: Text(
              tr('settings_logout'),
              style: const TextStyle(color: deleteRed),
            ),
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                ClipboardData(
                  text: di.get<SharedPreferencesRepository>().getUserId(),
                ),
              );
            },
            child: Center(
              child: Text(
                di.get<SharedPreferencesRepository>().getUserId(),
                style: const TextStyle(fontSize: 10, color: summaryGrey),
              ),
            ),
          ),
          const SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}

class BrightnessSelector extends StatelessWidget {
  const BrightnessSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Column(
        children: [
          SettingsTitleTile(
            title: tr('brightness_title'),
          ),
          const SizedBox(
            height: Dimens.unit2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconImageOptionButton(
                onPressed: () => _changeBrightness(context, ThemeMode.light),
                description: 'Light',
                iconData: LineAwesomeIcons.sun,
              ),
              IconImageOptionButton(
                onPressed: () => _changeBrightness(context, ThemeMode.dark),
                description: 'Dark',
                iconData: LineAwesomeIcons.moon,
              ),
              IconImageOptionButton(
                onPressed: () => _changeBrightness(context, ThemeMode.system),
                description: 'System',
                iconData: LineAwesomeIcons.wrench,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changeBrightness(BuildContext context, ThemeMode mode) =>
      context.read<BrightnessCubit>().changeBrightness(mode);
}

class SettingsTitleTile extends StatelessWidget {
  final String title;

  const SettingsTitleTile({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.unit2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
