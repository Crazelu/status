import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StatusScrollBehavior extends MaterialScrollBehavior {
  const StatusScrollBehavior();
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
