import 'package:flutter/widgets.dart';
import 'package:status/features/home/data/models/event.dart';

extension EventTypeExt on EventType {
  Color get color => switch (this) {
        EventType.meeting => const Color(0xFFB7D9FE),
        EventType.focusedWork => const Color(0xFFA5EEBE),
        EventType.offSick => const Color(0xFFECA5D0),
        EventType.holiday => const Color(0xFFFAD283),
        EventType.privateTime => const Color(0xFFFFFFFF),
      };
}
