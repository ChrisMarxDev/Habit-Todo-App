import 'package:flutter/material.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';

// ThemeData theme({required bool isDark}) => isDark ? darkTheme : lightTheme;

const white = Color(0xFFFAFAFA);
const whiteText = white;
const whiteBackground = Color(0xFFF2f2f2);

const black = Color(0xFF110F0F);
const blackBackground = Color(0xFF232323);
const blackText = black;

const deleteRed = Color(0xFFC70000);
const deactivateGrey = Colors.grey;

const summaryGrey = Color(0xFFd2d2d2);
const summaryNotScheduled = weakGrey;
const weakGrey = Color(0xFFe2e2e2);
const chartGrey = Color(0xFFa2a2a2);

const darkSecondaryBackground = Color(0xFF0e0e0e);

ThemeData themeData({required bool dark, required ColorPalette colorPalette}) {
  final primaryColor = colorPalette.primary;
  final secondaryColor = colorPalette.secondary;

  // final primaryColorDark = primaryColor;
  // final secondaryColorDark = secondaryColor;

  const onPrimary = Colors.white;
  // const onSecondary = Colors.white;

  final textTheme = textThemeGenerator(dark: dark, mainColor: primaryColor);
  return ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      splashColor: primaryColor,
    ),
    colorScheme: dark
        ? ColorScheme.dark(
            primary: primaryColor,
            onPrimary: onPrimary,
            secondary: secondaryColor,
            onSecondary: Colors.white,
            background: black,
          )
        : ColorScheme.light(
            primary: primaryColor,
            secondary: secondaryColor,
            onSecondary: Colors.white,
            background: white,
          ),
    appBarTheme: AppBarTheme(color: primaryColor),
    fontFamily: 'Poppins',
    // inputDecorationTheme: ,
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: dark ? darkSecondaryBackground : white,
    ),
    disabledColor: Colors.grey,
    textTheme: textTheme,
    dialogTheme: dialogTheme(
      dark: dark,
      textTheme: textTheme,
      secondaryColor: secondaryColor,
    ),
    // dividerTheme: const DividerThemeData(color: ),
    scaffoldBackgroundColor: dark ? blackBackground : whiteBackground,
    cardColor: dark ? blackBackground : whiteBackground,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          textTheme.headline5!.copyWith(color: primaryColor),
        ),
// not used for text
        foregroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(56),
            ),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(primaryColor),
        textStyle: MaterialStateProperty.all(
          textTheme.headline5!.copyWith(color: whiteText),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(56),
            ),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(whiteText),
        textStyle: MaterialStateProperty.all(
          textTheme.headline6!.copyWith(color: whiteText, fontSize: 16),
        ),
        backgroundColor: MaterialStateProperty.all(
          primaryColor,
        ),
      ),
    ),
// colorScheme: ColorScheme(),
  );
}

DialogTheme dialogTheme({
  required bool dark,
  required TextTheme textTheme,
  required Color secondaryColor,
}) =>
    DialogTheme(
      backgroundColor: dark ? blackBackground : white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: secondaryColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      titleTextStyle: textTheme.headline3,
      contentTextStyle: textTheme.bodyText1,
    );

TextTheme textThemeGenerator({required bool dark, Color? mainColor}) {
  // final mainTextColor = dark ? whiteText : blackText;
  final mainTextColor = dark ? whiteText : (mainColor ?? whiteText);
  return TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 36,
      fontFamily: 'Poppins',
      color: mainTextColor,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 32,
      fontFamily: 'Poppins',
      color: mainTextColor,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 28,
      fontFamily: 'Poppins',
      color: mainTextColor,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: mainTextColor,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: mainTextColor,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: mainTextColor,
    ),
    subtitle1: TextStyle(color: mainTextColor),
    subtitle2: TextStyle(color: mainTextColor),
    bodyText1: TextStyle(fontSize: 18, color: mainTextColor),
    bodyText2: TextStyle(fontSize: 14, color: mainTextColor),
    // caption: TextStyle(color: mainTextColor),
    // button: TextStyle(color: mainTextColor),
    // overline: TextStyle(color: mainTextColor),
  );
}

class Dimens {
  static const double unit = 8;
  static const double unit2 = 16;
  static const double unit3 = 24;
  static const double unit4 = 32;
  static const double unit6 = 48;
  static const double unit8 = 64;
  static const double borderRadiusInput = 32;
  static const double borderRadiusInputCard = 24;
  static const double defaultIconSize = 32;
  static const double badgeIconSize = 32;
  static const double actionBarHeight = 64;
  static const double selectorButtonSize = 48;
  static const double checkBoxSize = 64;
  static const double checkBoxSizeBig = 96;
  static const double badgeWidth = 72;
  static const double actionBarBottomPadding = 64;
  static const double taskSelectorSize = 56;
  static const double onboardingSelectorRoutineSize = 92;

  static const double bottomNavBarRadius = 20;
}

class Animations {
  static const Duration baseDuration = Duration(milliseconds: 350);
  static const Duration quickAnimation = Duration(milliseconds: 240);
  static const Duration waitDuration = Duration(milliseconds: 160);

  static const Curve baseCurve = Curves.easeIn;
}
