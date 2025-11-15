import 'package:flutter/material.dart';
import 'app_colors.dart';

final themeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: 'Poppins',
  
  // 🎨 Cores básicas
  primaryColor: AppColors.primaryDark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  canvasColor: AppColors.backgroundDark,
  dividerColor: AppColors.borderDark,

  // 🌕 AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceDark,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimaryDark,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
  ),

  // 📝 Textos
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.textPrimaryDark),
    displayMedium: TextStyle(color: AppColors.textPrimaryDark),
    bodyLarge: TextStyle(color: AppColors.textPrimaryDark, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondaryDark, fontSize: 14),
    labelSmall: TextStyle(color: AppColors.textHintDark),
  ),

  // 🧱 Cards e superfícies
  cardTheme: const CardThemeData(
    color: AppColors.surfaceDark,
    elevation: 0,
    margin: EdgeInsets.all(8),
    surfaceTintColor: Colors.transparent,
  ),

  // ⬆️ Superfície elevada (por exemplo, bottom sheets)
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.surfaceDark,
    surfaceTintColor: Colors.transparent,
  ),

  // 🔘 Botões
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryDark),
      foregroundColor: WidgetStateProperty.all(AppColors.textPrimaryDark),
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
      backgroundColor: WidgetStateProperty.all(AppColors.secondaryDark),
      foregroundColor: WidgetStateProperty.all(AppColors.textPrimaryDark),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.primaryDark),
    ),
  ),

  // ✏️ Inputs
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceElevatedDark,
    hintStyle: const TextStyle(color: AppColors.textHintDark),
    labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 1.6),
    ),
  ),

  // 🔄 Switch, checkbox, radio
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentDark
          : AppColors.borderDark,
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentDark.withValues(alpha: 0.4)
          : AppColors.borderDark.withValues(alpha: 0.4),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: AppColors.borderDark, width: 1.4),
    fillColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentDark
          : Colors.transparent,
    ),
    checkColor: WidgetStateProperty.all(AppColors.backgroundDark),
  ),

  // 📎 ListTiles
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.textSecondaryDark,
    textColor: AppColors.textPrimaryDark,
    tileColor: Colors.transparent,
  ),

  // 🧭 NavigationBar / BottomNavigation
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceDark,
    elevation: 1,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: AppColors.textSecondaryDark),
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => IconThemeData(
        color: states.contains(WidgetState.selected)
            ? AppColors.accentDark
            : AppColors.textSecondaryDark,
      ),
    ),
  ),

  // 🔘 Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accentDark,
    foregroundColor: AppColors.textPrimaryDark,
  ),

  // 🧭 Drawer
  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.surfaceDark),

  // 📌 Tooltip
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.surfaceElevatedDark,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: TextStyle(color: AppColors.textPrimaryDark),
  ),

  // 🎚 Sliders
  sliderTheme: const SliderThemeData(
    thumbColor: AppColors.accentDark,
    activeTrackColor: AppColors.accentDark,
    inactiveTrackColor: AppColors.borderDark,
  ),
);
