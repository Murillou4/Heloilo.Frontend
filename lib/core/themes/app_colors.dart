import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Core brand colors
  static const Color primaryLight = Color(0xFFC98A9E); // Rosa Névoa Profunda
  static const Color secondaryLight = Color(0xFF6E5A7A); // Púrpura Chá-Seco
  static const Color tertiaryLight = Color(0xFF7F9A8B); // Verde Sálvia Cinzento
  static const Color accentLight = Color(0xFFC5A36A); // Dourado Areia Quente

  // Backgrounds
  static const Color backgroundLight = Color(
    0xFFF3F1EF,
  ); // Cinza Algodão Suave (quase branco)
  static const Color surfaceLight = Color(0xFFFFFFFF); // Cards claros
  static const Color surfaceElevatedLight = Color(
    0xFFF7F6F5,
  ); // Painéis levemente elevados

  // Borders
  static const Color borderLight = Color(0xFFD6D2CF); // Cinza claro elegante

  // Text
  static const Color textPrimaryLight = Color(
    0xFF2F3A47,
  ); // Azul Neblina Noturna (puxando pra contraste suave)
  static const Color textSecondaryLight = Color(
    0xFF6E5A7A,
  ); // Púrpura seco (menos peso)
  static const Color textHintLight = Color(
    0xFF9C8F99,
  ); // Rosado acinzentado sutil

  // 🌙 DARK THEME — Contraste suave, sem gritaria

  static const Color primaryDark = Color(
    0xFFC98A9E,
  ); // Mantém identidade mesmo no dark
  static const Color secondaryDark = Color(0xFF6E5A7A); // Profundidade
  static const Color tertiaryDark = Color(0xFF7F9A8B); // Equilíbrio
  static const Color accentDark = Color(0xFFC5A36A); // Detalhes dourados sutis

  // Backgrounds
  static const Color backgroundDark = Color(0xFF2F3A47); // Azul Neblina Noturna
  static const Color surfaceDark = Color(0xFF3A4654); // Escuro elevado
  static const Color surfaceElevatedDark = Color(
    0xFF455263,
  ); // Mais contraste para hierarquia

  // Borders
  static const Color borderDark = Color(0xFF596574);

  // Text
  static const Color textPrimaryDark = Color(0xFFF3F1EF); // Claro premium
  static const Color textSecondaryDark = Color(0xFFC8C2C0); // Neutro suave
  static const Color textHintDark = Color(0xFF9EA4A8);

  // Common semantic colors
  static const Color error = Color(0xFFE57373);
  static const Color warning = Color(0xFFFFB74D);
  static const Color success = Color(0xFF81C784);
  static const Color info = Color(0xFF64B5F6);
}
