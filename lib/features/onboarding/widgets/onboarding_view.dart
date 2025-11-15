import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const OnboardingView({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 80)),
          const SizedBox(height: 48.0),
          Text(
            title,
            style: textStyles.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            subtitle,
            style: textStyles.bodyLarge?.copyWith(
              height: 1.5, // Espaçamento entre linhas
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
