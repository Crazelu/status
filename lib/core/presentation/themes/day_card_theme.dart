import 'package:flutter/material.dart';

class DayCardTheme extends ThemeExtension<DayCardTheme> {
  const DayCardTheme({
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.selectedSecondaryTextColor,
    required this.unselectedSecondaryTextColor,
    required this.selectedPrimaryTextColor,
    required this.unselectedPrimaryTextColor,
  });

  factory DayCardTheme.defaultTheme() {
    return const DayCardTheme(
      selectedBackgroundColor: Color(0xFF262626),
      unselectedBackgroundColor: Color(0xFFF5F6F7),
      selectedSecondaryTextColor: Color(0xFFFFFFFF),
      unselectedSecondaryTextColor: Color(0xFF7C7C7D),
      selectedPrimaryTextColor: Color(0xFFFFFFFF),
      unselectedPrimaryTextColor: Color(0xFF202020),
    );
  }

  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedSecondaryTextColor;
  final Color unselectedSecondaryTextColor;
  final Color selectedPrimaryTextColor;
  final Color unselectedPrimaryTextColor;

  @override
  ThemeExtension<DayCardTheme> copyWith() => this;

  @override
  ThemeExtension<DayCardTheme> lerp(
    covariant ThemeExtension<ThemeExtension>? other,
    double t,
  ) =>
      this;
}
