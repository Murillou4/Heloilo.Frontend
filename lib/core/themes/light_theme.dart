import 'package:flutter/material.dart';
import 'app_colors.dart';

final themeLight = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: 'Poppins',

  // 🎨 Cores básicas
  primaryColor: AppColors.primaryLight,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  canvasColor: AppColors.backgroundLight,
  dividerColor: AppColors.borderLight,

  // ☀️ AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceLight,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimaryLight,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryLight),
  ),

  // 📝 Textos
  textTheme: const TextTheme(

    displayLarge: TextStyle(color: AppColors.textPrimaryLight),
    displayMedium: TextStyle(color: AppColors.textPrimaryLight),
    bodyLarge: TextStyle(color: AppColors.textPrimaryLight, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondaryLight, fontSize: 14),
    labelSmall: TextStyle(color: AppColors.textHintLight),
  ),

  // 🧱 Cards e superfícies
  cardTheme: const CardThemeData(
    color: AppColors.surfaceLight,
    elevation: 0,
    margin: EdgeInsets.all(8),
    surfaceTintColor: Colors.transparent,
  ),

  // ⬆️ Superfície elevada (ex: bottom sheet)
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.surfaceLight,
    surfaceTintColor: Colors.transparent,
  ),

  // 🔘 Botões
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryLight),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.secondaryLight),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.primaryLight),
    ),
  ),

  // ✏️ Inputs
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceElevatedLight,
    hintStyle: const TextStyle(color: AppColors.textHintLight),
    labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderLight),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderLight),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.6),
    ),
  ),

  // 🔄 Switch, checkbox, radio
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentLight
          : AppColors.borderLight,
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentLight.withValues(alpha: 0.4)
          : AppColors.borderLight.withValues(alpha: 0.4),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: AppColors.borderLight, width: 1.4),
    fillColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentLight
          : Colors.transparent,
    ),
    checkColor: WidgetStateProperty.all(Colors.white),
  ),

  // 📎 ListTiles
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.textSecondaryLight,
    textColor: AppColors.textPrimaryLight,
    tileColor: Colors.transparent,
  ),

  // 🧭 NavigationBar / BottomNavigation
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceLight,
    elevation: 1,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: AppColors.textSecondaryLight),
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => IconThemeData(
        color: states.contains(WidgetState.selected)
            ? AppColors.accentLight
            : AppColors.textSecondaryLight,
      ),
    ),
  ),

  // 🔘 Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accentLight,
    foregroundColor: Colors.white,
  ),

  // 🧭 Drawer
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.surfaceLight,
  ),

  // 📌 Tooltip
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.surfaceElevatedLight,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: TextStyle(color: AppColors.textPrimaryLight),
  ),

  // 🎚 Sliders
  sliderTheme: const SliderThemeData(
    thumbColor: AppColors.accentLight,
    activeTrackColor: AppColors.accentLight,
    inactiveTrackColor: AppColors.borderLight,
  ),

  
);
