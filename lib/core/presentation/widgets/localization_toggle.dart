import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:status/core/localization/localization_manager.dart';
import 'package:status/core/presentation/themes/day_card_theme.dart';
import 'package:status/core/presentation/widgets/responsive_builder.dart';
import "package:universal_html/html.dart" as html;

class LocalizationToggle extends StatelessWidget {
  const LocalizationToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final locale in AppLocalizations.supportedLocales)
          _LocaleCard(key: ValueKey(locale), locale: locale)
      ],
    );
  }
}

class _LocaleCard extends StatelessWidget {
  const _LocaleCard({super.key, required this.locale});

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DayCardTheme>()!;
    final localizationManager = context.read<LocalizationManager>();

    return ValueListenableBuilder(
      valueListenable: localizationManager.currentLocale,
      builder: (context, currentLocale, _) {
        final selected = currentLocale == locale;

        return Padding(
          padding: EdgeInsets.only(right: (2.0, 4.0).resolve),
          child: SizedBox(
            height: 32,
            width: 32,
            child: Material(
              color: selected
                  ? theme.selectedBackgroundColor
                  : theme.unselectedBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  if (locale == currentLocale) return;
                  localizationManager.changeLocale(locale);
                  html.window.location.reload();
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    locale.languageCode.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: selected
                          ? theme.selectedPrimaryTextColor
                          : theme.unselectedPrimaryTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
