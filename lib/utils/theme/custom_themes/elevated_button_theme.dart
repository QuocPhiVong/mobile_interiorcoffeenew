import 'package:flutter/material.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  //light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.brown,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.brown),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(fontSize: 16, color : Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );


  //dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.brown,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.brown),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(fontSize: 16, color : Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );
}