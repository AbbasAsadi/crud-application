import 'package:flutter/material.dart';
extension ContextBaseExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
