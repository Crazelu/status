import 'package:flutter/widgets.dart';
import 'package:status/core/data/local_cache.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:status/core/presentation/viewmodel/base_view_model.dart';

class LocalizationManager extends BaseViewModel {
  LocalizationManager({required LocalCache cache}) : _cache = cache;

  final LocalCache _cache;
  static const _localeKey = '@@__@@Locale';

  final ValueNotifier<Locale> _currentLocale =
      ValueNotifier(const Locale('en'));
  ValueNotifier<Locale> get currentLocale => _currentLocale;

  final ValueNotifier<AppLocalizations?> _currentLocalizations =
      ValueNotifier(null);
  ValueNotifier<AppLocalizations?> get currentLocalizations =>
      _currentLocalizations;

  @override
  void initialize() {
    final languageCode = _cache.getFromCache<String?>(_localeKey) ?? 'en';
    final locale = Locale(languageCode);
    _currentLocale.value = locale;
    _currentLocalizations.value = lookupAppLocalizations(locale);
  }

  Future<void> changeLocale(Locale locale) {
    _currentLocalizations.value = lookupAppLocalizations(locale);
    _currentLocale.value = locale;
    return _cache.saveToCache(key: _localeKey, value: locale.languageCode);
  }

  @override
  void dispose() {
    _currentLocale.dispose();
    _currentLocalizations.dispose();
    super.dispose();
  }
}
