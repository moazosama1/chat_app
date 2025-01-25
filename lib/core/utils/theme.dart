import 'package:flutter/material.dart';
import 'package:test_firebase/core/utils/color_app.dart';

class ThemeModeInApp {
  ColorApp colorApp = ColorApp();
  static ThemeData themelight = ThemeData(
    scaffoldBackgroundColor: ColorApp.primaryColorWhiteInLightTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.white,
      surface: ColorApp.white,
      primary: ColorApp.primaryColorWhiteInLightTheme,
      onPrimary: ColorApp.textColorInLightTheme,
      secondary: ColorApp.blue,
      onSecondary: ColorApp.primaryColorWhiteInLightTheme,
    ),
  );
}
