import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/bootstrap.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/logic/cubits/login/login_cubit.dart';
import 'package:mindful/screens/onboarding/onboarding_screens.dart';
import 'package:mindful/widgets/base_card.dart';
import 'package:mindful/widgets/color_palette_row.dart';
import 'package:mindful/widgets/custom_paint/animated_cross.dart';
import 'package:mindful/widgets/custom_paint/ripple_overlay.dart';
import 'package:mindful/widgets/dialogs/emoji_picker_dialog.dart';
import 'package:mindful/widgets/score_slider.dart';

import 'login/login_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();

  static Widget action(BuildContext context) {
    if (kAppFlavor == Flavor.develop) {
      return Padding(
        padding: const EdgeInsets.only(right: 56),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push<void>(
              MaterialPageRoute<dynamic>(
                builder: (context) => const TestScreen(),
              ),
            );
          },
          child: const Icon(Icons.bug_report),
        ),
      );
    } else {
      return Container();
    }
  }
}

class _TestScreenState extends State<TestScreen> {
  // bool checked = false;
  bool crossChecked = false;

  double value = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const ColorPaletteRow(
            palette: basePalette,
          ),
          // const ColorPaletteRow(
          //   palette: summerPalette,
          // ),
          // const ColorPaletteRow(
          //   palette: winterPalette,
          // ),
          const ColorPaletteRow(
            palette: blackPalette,
          ),
          // ColorPaletteRow(),

          ElevatedButton(
            onPressed: () => EmojiPickerDialog.show(context, (_) {}),
            child: const Text('EMOJI DIALOG'),
          ),

          ElevatedButton(
            onPressed: () => context.read<LoginCubit>().logout(),
            child: const Text('Logout'),
          ),

          const RippleOverlay(
            borderRadius: 24,
            child: BaseCard(
              color: Colors.red,
              borderRaidus: 24,
              child: SizedBox(
                height: 100,
                width: 100,
              ),
            ),
          ),

          Container(
            height: 200,
            color: getPalette(context).primary,
            child: ScoreSlider(
              color: getPalette(context).primary,
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ),

          Row(
            children: [
              Container(width: 78, color: Colors.red),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: getPalette(context).primaryGradient,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: AnimatedClippedCross(
                    value: crossChecked,
                    onCheck: (vale) {
                      setState(() {
                        crossChecked = vale;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            child: const Text('Login Screen'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) {
                    return const OnboardingScreens();
                  },
                ),
              );
            },
            child: const Text('Onboarding'),
          ),
          SizedBox(
            height: 250,
            width: 300,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                // Do something when emoji is tapped
              },
              config: Config(
                columns: 6,
                emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                bgColor: const Color(0xFFFFFFFF),
                indicatorColor: Theme.of(context).colorScheme.primary,
                iconColorSelected: Theme.of(context).colorScheme.primary,
                progressIndicatorColor: Theme.of(context).colorScheme.primary,
                buttonMode:
                    Platform.isIOS ? ButtonMode.CUPERTINO : ButtonMode.MATERIAL,
              ),
            ),
          )
        ],
      ),
    );
  }
}
