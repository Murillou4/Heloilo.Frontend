// 🌀 ThemeNotifier usando Riverpod
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/constants/local_data_keys.dart';
import 'package:heloilo/core/services/local_data_service.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final theme = LocalDataService.getString(LocalDataKeys.theme);

    if (theme != null) {
      return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    // Tema inicial pode vir de storage
    return ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    LocalDataService.setString(LocalDataKeys.theme, state.name);
  }

  void setLight() => state = ThemeMode.light;
  void setDark() => state = ThemeMode.dark;
}

// 🔗 Provider
final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  () => ThemeNotifier(),
);
