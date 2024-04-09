import 'package:status/core/localization/app_localizations.dart';
import 'package:status/core/localization/app_localizations_en.dart';
import 'package:flutter/material.dart';

extension AppLocaleExtension on BuildContext {
  AppLocalizations get locale =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}
