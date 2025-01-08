import 'package:flutter/material.dart';

class TCheckboxTheme{
  TCheckboxTheme._();

  //check box light theme properties
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)){
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states){
        if(states.contains(WidgetState.selected)){
          return Colors.brown;
        } else {
          return Colors.transparent;
        }
      }),
  );

  //check box dark theme properties
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)){
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states){
        if(states.contains(WidgetState.selected)){
          return Colors.brown;
        } else {
          return Colors.transparent;
        }
      }),
  );
}