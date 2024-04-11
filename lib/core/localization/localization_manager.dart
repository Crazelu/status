import 'package:flutter/widgets.dart';
import 'package:status/core/data/local_cache.dart';
import 'package:status/core/presentation/viewmodel/base_view_model.dart';

class LocalizationManager extends BaseViewModel {
  LocalizationManager({required LocalCache cache}) : _cache = cache;

  final LocalCache _cache;
  static const localeKey = '@@__@@Locale';
  static const _defaultLocaleLanguageCode = 'en';

  final ValueNotifier<Locale> _currentLocale = ValueNotifier(
    const Locale(_defaultLocaleLanguageCode),
  );
  ValueNotifier<Locale> get currentLocale => _currentLocale;

  @override
  void initialize() {
    final languageCode =
        _cache.getFromCache<String?>(localeKey) ?? _defaultLocaleLanguageCode;
    _currentLocale.value = Locale(languageCode);
  }

  Future<void> changeLocale(Locale locale) {
    _currentLocale.value = locale;
    return _cache.saveToCache(key: localeKey, value: locale.languageCode);
  }

  @override
  void dispose() {
    _currentLocale.dispose();
    super.dispose();
  }
}
