import 'package:flutter/material.dart';

// light color
const Color kcLightBlue = Color(0xff00d5ea);
const Color kcBlue = Color(0xff0066fd);
const Color kcBlue88 = Color(0x880066fd);
const Color kcWhite = Color(0xffffffff);
// dark colors
const Color kcAppbar = Color(0xff191919);
const Color kcBackground = Color(0xff0d0d0d);
const Color kcGrey = Color(0xffd8d8d8);
const Color kcLightBlack = Color.fromARGB(255, 61, 61, 61);

// share
const Color kcBlack = Color(0xff000000);
const Color kcRed = Color(0xffdc2626);
const Color kcAmber = Color(0xffd97706);
const Color kcTeal = Colors.teal;
const Color kcGreen = Color(0xff16a34a);
const Color kcDivider = Color(0xffe5e5e5);
const Color kcGrey500 = Colors.grey;

// get theme
ThemeData theme(BuildContext context) => Theme.of(context);


class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'futura',
        scaffoldBackgroundColor: kcWhite,
        useMaterial3: true,
        primaryColor: kcLightBlue,
        primarySwatch: _lightMaterialColor,
        dialogTheme: const DialogTheme(surfaceTintColor: kcWhite),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _lightMaterialColor,
          accentColor: kcLightBlue,
          backgroundColor: kcWhite,
          brightness: Brightness.light,
        ),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(kcBlue.withOpacity(0.1)),
        )),
        highlightColor: Colors.transparent,
        brightness: Brightness.light,
        indicatorColor: kcBlue,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: kcLightBlue,
        ),
      );


  // for primary material color
  static const MaterialColor _lightMaterialColor = MaterialColor(
    0xff00d5ea,
    <int, Color>{
      50: kcLightBlue,
      100: kcLightBlue,
      200: kcLightBlue,
      300: kcLightBlue,
      400: kcLightBlue,
      500: kcLightBlue,
      600: kcLightBlue,
      700: kcLightBlue,
      800: kcLightBlue,
      900: kcLightBlue,
    },
  );
}
