import 'package:flutter/widgets.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:status/features/home/data/models/event.dart';

const _transparent = Color(0x00000000);

extension EventTypeExt on EventType {
  Color get color => switch (this) {
        EventType.meeting => const Color(0xFFB7D9FE),
        EventType.focusedWork => const Color(0xFFA5EEBE),
        EventType.offSick => const Color(0xFFECA5D0),
        EventType.holiday => const Color(0xFFFAD283),
        EventType.privateTime => const Color(0xFFFFFFFF),
        _ => _transparent,
      };

  Color get cardColor => switch (this) {
        EventType.meeting => const Color(0xFFB7D9FE),
        EventType.focusedWork => const Color(0xFFA5EEBE),
        EventType.offSick => const Color(0xFFECA5D0),
        EventType.holiday => const Color(0xFFFAD283),
        EventType.privateTime => const Color(0xFFE5F1FF),
        _ => const Color(0xFF262626),
      };

  String getDescription(AppLocalizations locale) {
    return switch (this) {
      EventType.meeting => locale.meeting,
      EventType.focusedWork => locale.focusedWork,
      EventType.offSick => locale.offSick,
      EventType.holiday => locale.holiday,
      EventType.privateTime => locale.personalSchedule,
      _ => '',
    };
  }
}
