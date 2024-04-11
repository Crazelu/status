import 'package:provider/provider.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:status/core/localization/localization_manager.dart';

extension AppLocaleExtension on BuildContext {
  AppLocalizations get locale =>
      lookupAppLocalizations(read<LocalizationManager>().currentLocale.value);
}
