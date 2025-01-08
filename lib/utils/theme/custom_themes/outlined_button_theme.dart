import 'package:flutter/material.dart';

class TOutlinedButton{
  TOutlinedButton._();

  //light outlined button theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: BorderSide(color : Colors.brown),
      textStyle: TextStyle(fontSize: 16, color : Colors.black, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    )
  );

  //dark outlined button theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: BorderSide(color : Colors.brown.shade200),
      textStyle: TextStyle(fontSize: 16, color : Colors.white, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    )
  );
}