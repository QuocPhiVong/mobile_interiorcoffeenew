import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/theme/custom_themes/appbar_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/chip_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/text_field_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/text_theme.dart';
import 'package:interior_coffee/utils/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: TColors.dark,
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        primaryColor: TColors.primary,
        textTheme: TTextTheme.darkTextTheme,
        chipTheme: TChipTheme.darkChipTheme,
        appBarTheme: TAppBarTheme.darkAppBarTheme,
        checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
        bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
        elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
        outlinedButtonTheme: TOutlinedButton.darkOutlinedButtonTheme,
        inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
      ),
      home: Scaffold(
          backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
