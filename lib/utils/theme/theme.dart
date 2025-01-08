import 'package:flutter/material.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/theme/custom_themes/appbar_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/chip_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/text_field_theme.dart';
import 'package:interior_coffee/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  //Light theme properties
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButton.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );

  //Dark theme properties
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: TColors.dark,
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
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
  );
}
