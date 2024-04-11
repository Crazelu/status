import 'package:flutter/foundation.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:status/core/presentation/viewmodel/base_view_model.dart';
import 'package:status/features/home/data/models/calendar_time_range.dart';
import 'package:status/features/home/data/models/date.dart';
import 'package:status/features/home/data/models/event.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({required this.locale});

  final AppLocalizations locale;

  final List<Event> _dummyEvents = [
    Event.neverRecur(
      title: 'Standup',
      startTime: const EventTime(hour: 9),
      endTime: const EventTime(hour: 9, minutes: 30),
      eventType: EventType.meeting,
      weekday: WeekDay.monday,
    ),
    Event.recurOnSpecifcWeekdays(
      title: 'Standup',
      startTime: const EventTime(hour: 8, minutes: 30),
      endTime: const EventTime(hour: 9),
      eventType: EventType.meeting,
      weekdays: const [
        WeekDay.tuesday,
        WeekDay.wednesday,
        WeekDay.thursday,
        WeekDay.friday,
      ],
    ),
    Event.recurOnWeekdays(
      title: 'Global Team Sync',
      startTime: const EventTime(hour: 9, minutes: 30),
      endTime: const EventTime(hour: 10),
      eventType: EventType.meeting,
    ),
    Event.recurOnWeekdays(
      title: 'Focused Work',
      startTime: const EventTime(hour: 11),
      endTime: const EventTime(hour: 13, minutes: 30),
      eventType: EventType.focusedWork,
    ),
    Event.recurOnWeekdays(
      title: 'Lunch Break',
      startTime: const EventTime(hour: 13, minutes: 30),
      endTime: const EventTime(hour: 14, minutes: 15),
      eventType: EventType.privateTime,
    ),
    Event.recurOnWeekdays(
      title: 'Focused Work',
      startTime: const EventTime(hour: 14, minutes: 15),
      endTime: const EventTime(hour: 16, minutes: 00),
      eventType: EventType.focusedWork,
    ),
    Event.recurOnWeekdays(
      title: 'Workout',
      startTime: const EventTime(hour: 6, minutes: 30),
      endTime: const EventTime(hour: 8),
      eventType: EventType.privateTime,
    ),
    Event.neverRecur(
      title: 'Workout',
      startTime: const EventTime(hour: 7),
      endTime: const EventTime(hour: 10),
      eventType: EventType.privateTime,
      weekday: WeekDay.saturday,
    ),
    Event.neverRecur(
      title: 'End of Week Sync',
      startTime: const EventTime(hour: 16, minutes: 30),
      endTime: const EventTime(hour: 17),
      eventType: EventType.meeting,
      weekday: WeekDay.friday,
    ),
    Event.neverRecur(
      title: 'Touchstone Scrum',
      startTime: const EventTime(hour: 17, minutes: 30),
      endTime: const EventTime(hour: 18),
      eventType: EventType.meeting,
      weekday: WeekDay.wednesday,
    ),
    Event.neverRecur(
      title: 'Schedule a Meeting',
      startTime: const EventTime(hour: 16, minutes: 30),
      endTime: const EventTime(hour: 17),
      eventType: EventType.scheduleMeeting,
      weekday: WeekDay.saturday,
      eventLink: 'https://calendly.com/crazelu/meet-with-lucky-a',
      venue: 'Google Meet',
    ),
    Event.neverRecur(
      title: 'Schedule a Meeting',
      startTime: const EventTime(hour: 17, minutes: 30),
      endTime: const EventTime(hour: 18),
      eventType: EventType.scheduleMeeting,
      weekday: WeekDay.sunday,
      eventLink: 'https://calendly.com/crazelu/meet-with-lucky-a',
      venue: 'Google Meet',
    ),
    Event.neverRecur(
      title: 'Schedule a Meeting',
      startTime: const EventTime(hour: 18, minutes: 15),
      endTime: const EventTime(hour: 18, minutes: 45),
      eventType: EventType.scheduleMeeting,
      weekday: WeekDay.sunday,
      eventLink: 'https://calendly.com/crazelu/meet-with-lucky-a',
      venue: 'Google Meet',
    ),
  ];

  static const _range = CalendarTimeRange(
    start: EventTime(hour: 6),
    end: EventTime(hour: 20),
  );

  late final ValueNotifier<CalendarTimeRange> _timeRange =
      ValueNotifier(_range);
  ValueNotifier<CalendarTimeRange> get timeRange => _timeRange;

  final ValueNotifier<List<Date>> _dates = ValueNotifier([]);
  ValueNotifier<List<Date>> get dates => _dates;

  final ValueNotifier<Date?> _selectedDate = ValueNotifier(null);
  ValueNotifier<Date?> get selectedDate => _selectedDate;

  late final ValueNotifier<List<Event>> _events = ValueNotifier([]);
  ValueNotifier<List<Event>> get events => _events;

  late final ValueNotifier<int?> _selectedWeekday = ValueNotifier(null);
  ValueNotifier<int?> get selectedWeekday => _selectedWeekday;

  @override
  void initialize() {
    final result = <Date>[];
    final today = DateTime.now();

    for (int i = 0; i < today.weekday; i++) {
      result.add(
        Date.fromDatetime(
          date: today.subtract(Duration(days: today.weekday - i)),
          locale: locale,
        ),
      );
    }
    for (int i = today.weekday; i < 7; i++) {
      result.add(
        Date.fromDatetime(
          date: today.add(Duration(days: i - today.weekday)),
          locale: locale,
        ),
      );
    }

    _dates.value = result;
    _selectedDate.value = result.firstWhere(
      (e) => int.parse(e.day) == today.day,
    );

    _sortAndSetEvents(_dummyEvents);
  }

  void _sortAndSetEvents(List<Event> events) {
    events.sort(
      (a, b) => a.startTime.totalTimeInHours.compareTo(
        b.startTime.totalTimeInHours,
      ),
    );
    _events.value = events;
  }

  void updateSelectedDate(Date date) {
    _selectedDate.value = date;
    final events = _dummyEvents.where(
      (e) =>
          e.weekdays.contains(date.weekday) || e.day?.weekday == date.weekday,
    );
    _sortAndSetEvents(events.toList());
    _selectedWeekday.value = date.weekday;
  }

  void resetSelectedWeekday() {
    _selectedWeekday.value = null;
    _sortAndSetEvents(_dummyEvents);
    _selectedDate.value = _dates.value.firstWhere(
      (e) => int.parse(e.day) == DateTime.now().day,
    );
  }

  @override
  void dispose() {
    _dates.dispose();
    _selectedDate.dispose();
    _events.dispose();
    _timeRange.dispose();
    _selectedWeekday.dispose();
  }
}
