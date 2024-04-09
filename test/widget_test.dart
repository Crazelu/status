import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:status/core/app/app.dart';
import 'package:status/core/dialog/dialog_handler.dart';
import 'package:status/core/navigation/navigation_bus.dart';
import 'package:status/core/localization/app_localizations_en.dart';
import 'package:status/screens.dart';

import 'mocks.mocks.dart';

void main() {
  setUpAll(
    () {
      GetIt.I.registerSingleton<DialogHandler>(
        MockDialogHandler(),
      );
      GetIt.I.registerSingleton<NavigationBus>(
        MockNavigationBus(),
      );
    },
  );
  testWidgets('StatusApp test', (WidgetTester tester) async {
    when(GetIt.I<DialogHandler>().dialogKey).thenReturn(GlobalKey());

    await tester.pumpWidget(const StatusApp());

    final locale = AppLocalizationsEn();

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Ella!'), findsOneWidget);
    expect(find.text('Language: ${locale.language}'), findsOneWidget);
  });
}
