import 'package:flutter/material.dart';
import 'package:status/core/app/app.dart';
import 'package:status/core/dependencies/dependency_registry.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyRegistry.register();
  runApp(const StatusApp());
}
