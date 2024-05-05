import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/src/domain/services/setting_service.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsService = Provider.of<SettingsService>(context);
    final isDarkTheme = settingsService.isDark;
    return IconButton(
      icon: Icon(
        isDarkTheme ? Icons.light_mode : Icons.dark_mode,
        color: isDarkTheme ? Colors.white : Colors.black,
      ),
      onPressed: () {
        settingsService.isDark = !isDarkTheme;
      },
    );
  }
}