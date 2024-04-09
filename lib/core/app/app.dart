import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:status/core/navigation/navigation_listener.dart';
import 'package:status/core/dialog/dialog_generator.dart';
import 'package:status/core/dialog/dialog_handler.dart';
import 'package:status/core/routes/route_generator.dart';
import 'package:status/core/routes/routes.dart';
import 'package:status/core/presentation/widgets/footer.dart';
import 'package:status/core/presentation/widgets/responsive_builder.dart';

class StatusApp extends StatefulWidget {
  const StatusApp({super.key});

  @override
  State<StatusApp> createState() => _StatusAppState();
}

class _StatusAppState extends State<StatusApp> {
  late final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return DialogManager(
      dialogKey: GetIt.I<DialogHandler>().dialogKey,
      navigatorKey: _navigatorKey,
      onGenerateDialog: DialogGenerator.onGenerateDialog,
      child: MaterialApp(
        scrollBehavior: const _StatusScrollBehavior(),
        title: 'Status',
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: Routes.splashScreen,
        navigatorKey: _navigatorKey,
        builder: (_, child) => NavigationListener(
          navigatorKey: _navigatorKey,
          child: Stack(
            children: [
              child!,
              if (kIsWeb)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: (10.0, 5.0).resolve,
                      right: (20.0, 20.0).resolve,
                    ),
                    child: const Footer(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

/// Removes glowing scroll indicator on Android
class _StatusScrollBehavior extends ScrollBehavior {
  const _StatusScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
