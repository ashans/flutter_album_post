import 'package:flutter/material.dart';

abstract class SettingsService with ChangeNotifier {
  set isDark(bool isDark);
  bool get isDark;
}