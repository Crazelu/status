import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:status/core/app/app.dart';
import 'package:status/core/data/local_cache.dart';
import 'package:status/core/dialog/dialog_handler.dart';
import 'package:status/core/localization/localization_manager.dart';
import 'package:status/core/navigation/navigation_bus.dart';
import 'package:status/core/localization/app_localizations_en.dart';
import 'package:status/pages.dart';

import 'mocks.mocks.dart';
import 'shared.dart';

void main() {
  setUpAll(
    () {
      GetIt.I.registerSingleton<DialogHandler>(
        MockDialogHandler(),
      );
      GetIt.I.registerSingleton<NavigationBus>(
        MockNavigationBus(),
      );
      GetIt.I.registerSingleton<LocalCache>(
        MockLocalCache(),
      );
    },
  );
  testWidgets('StatusApp test', (WidgetTester tester) async {
    when(GetIt.I<DialogHandler>().dialogKey).thenReturn(GlobalKey());
    when(GetIt.I<LocalCache>().getFromCache(LocalizationManager.localeKey))
        .thenReturn(null);

    emulateDesktopScreenSize(tester);

    await tester.pumpWidget(const StatusApp());

    final locale = AppLocalizationsEn();

    expect(find.byType(HomePage), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(locale.wednesday), findsOneWidget);
  });
}
