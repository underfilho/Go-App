import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color primaryDarkColor;
  final Color ratingColor;
  final Color backgroundColor;
  final Color containerColor;
  final Color onBackgroundColor;
  final Color alertColor;
  final Color accentColor;
  final Color fieldColor;

  AppColors({
    required this.primaryColor,
    required this.primaryDarkColor,
    required this.ratingColor,
    required this.backgroundColor,
    required this.containerColor,
    required this.onBackgroundColor,
    required this.alertColor,
    required this.accentColor,
    required this.fieldColor,
  });

  AppColors.standard()
      : primaryColor = const Color(0xffd11621),
        primaryDarkColor = const Color(0xffb6000c),
        ratingColor = const Color(0xffffb300),
        backgroundColor = const Color(0xfff8f9fb),
        containerColor = Colors.white,
        onBackgroundColor = const Color(0xff414244),
        alertColor = Colors.red,
        accentColor = const Color(0xff51a58b),
        fieldColor = const Color(0xffa2a2a2);

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? primaryDarkColor,
    Color? ratingColor,
    Color? backgroundColor,
    Color? containerColor,
    Color? onBackgroundColor,
    Color? alertColor,
    Color? accentColor,
    Color? fieldColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryDarkColor: primaryDarkColor ?? this.primaryDarkColor,
      ratingColor: ratingColor ?? this.ratingColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      containerColor: containerColor ?? this.containerColor,
      onBackgroundColor: onBackgroundColor ?? this.onBackgroundColor,
      alertColor: alertColor ?? this.alertColor,
      accentColor: accentColor ?? this.accentColor,
      fieldColor: fieldColor ?? this.fieldColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryDarkColor:
          Color.lerp(primaryDarkColor, other.primaryDarkColor, t)!,
      ratingColor: Color.lerp(ratingColor, other.ratingColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      containerColor: Color.lerp(containerColor, other.containerColor, t)!,
      onBackgroundColor:
          Color.lerp(onBackgroundColor, other.onBackgroundColor, t)!,
      alertColor: Color.lerp(alertColor, other.alertColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      fieldColor: Color.lerp(fieldColor, other.fieldColor, t)!,
    );
  }

  static AppColors? of(context) => Theme.of(context).extension<AppColors>();
}
