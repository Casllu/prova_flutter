 
import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext{
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLigth => Theme.of(this).primaryColorLight;
  TextTheme get textTheme => Theme.of(this).textTheme;
}