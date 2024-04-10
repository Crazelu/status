import 'package:flutter/widgets.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:status/features/home/data/models/event.dart';

extension EventTypeExt on EventType {
  Color get color => switch (this) {
        EventType.meeting => const Color(0xFFB7D9FE),
        EventType.focusedWork => const Color(0xFFFAD283),
        EventType.offSick => const Color(0xFFFFFFFF),
        EventType.holiday => const Color(0xFFA5EEBE),
        EventType.privateTime => const Color(0xFFECA5D0),
      };

  String getDescription(AppLocalizations locale) {
    return switch (this) {
      EventType.meeting => locale.meeting,
      EventType.focusedWork => locale.focusedWork,
      EventType.offSick => locale.offSick,
      EventType.holiday => locale.holiday,
      EventType.privateTime => locale.personalSchedule,
    };
  }
}
