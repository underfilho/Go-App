import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFonts extends ThemeExtension<AppFonts> {
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle bodyTextTitle;
  final TextStyle bodyText;
  final TextStyle caption;
  final TextStyle label;
  final TextStyle accentText;
  final TextStyle alertText;

  AppFonts._({
    required this.title,
    required this.subtitle,
    required this.bodyTextTitle,
    required this.bodyText,
    required this.caption,
    required this.label,
    required this.accentText,
    required this.alertText,
  });

  AppFonts.fromAppColors(AppColors appColors)
      : this._(
          title: TextStyle(
              fontSize: 20,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.normal,
              color: appColors.onBackgroundColor),
          subtitle: TextStyle(
              fontSize: 10,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.normal,
              color: appColors.onBackgroundColor),
          bodyTextTitle: TextStyle(
              fontSize: 24,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.normal,
              color: appColors.onBackgroundColor),
          bodyText: TextStyle(
              fontSize: 24,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.normal,
              color: appColors.onBackgroundColor),
          caption: TextStyle(
              fontSize: 14,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.w600,
              color: appColors.containerColor),
          label: TextStyle(
              fontSize: 10,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.bold,
              color: appColors.onBackgroundColor),
          accentText: TextStyle(
              fontSize: 10,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.normal,
              color: appColors.accentColor),
          alertText: TextStyle(
              fontSize: 10,
              fontFamily: 'Titillium',
              fontWeight: FontWeight.bold,
              color: appColors.alertColor),
        );

  @override
  AppFonts copyWith({
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? bodyTextTitle,
    TextStyle? bodyText,
    TextStyle? caption,
    TextStyle? label,
    TextStyle? accentText,
    TextStyle? alertText,
  }) {
    return AppFonts._(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      bodyTextTitle: bodyTextTitle ?? this.bodyTextTitle,
      bodyText: bodyText ?? this.bodyText,
      caption: caption ?? this.caption,
      label: label ?? this.label,
      accentText: accentText ?? this.accentText,
      alertText: alertText ?? this.alertText,
    );
  }

  @override
  AppFonts lerp(ThemeExtension<AppFonts>? other, double t) {
    if (other is! AppFonts) return this;

    return other;
  }

  static AppFonts? of(BuildContext context) =>
      Theme.of(context).extension<AppFonts>();
}
