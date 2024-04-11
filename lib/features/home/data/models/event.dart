import 'package:equatable/equatable.dart';

enum RecurringEventPattern { never, weekdays, always }

enum WeekDay {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7);

  const WeekDay(this.value);
  final int value;
}

class Event extends Equatable {
  const Event({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.eventType,
    this.weekdays = const [],
    this.recurringPattern = RecurringEventPattern.never,
    this.day,
    this.url,
    this.venue,
  }) : assert(
          day != null || weekdays != const [],
          'day or non empty weekdays must be provided',
        );

  factory Event.recurAlways({
    required String title,
    required EventTime startTime,
    required EventTime endTime,
    required EventType eventType,
    DateTime? day,
  }) {
    return Event(
      title: title,
      startTime: startTime,
      endTime: endTime,
      eventType: eventType,
      day: day,
      recurringPattern: RecurringEventPattern.always,
      weekdays: List.generate(7, (i) => i + 1),
    );
  }

  factory Event.recurOnWeekdays({
    required String title,
    required EventTime startTime,
    required EventTime endTime,
    required EventType eventType,
    DateTime? day,
  }) {
    return Event(
      title: title,
      startTime: startTime,
      endTime: endTime,
      eventType: eventType,
      day: day,
      recurringPattern: RecurringEventPattern.weekdays,
      weekdays: const [1, 2, 3, 4, 5],
    );
  }
  factory Event.recurOnSpecifcWeekdays({
    required String title,
    required EventTime startTime,
    required EventTime endTime,
    required EventType eventType,
    required List<WeekDay> weekdays,
    DateTime? day,
  }) {
    return Event(
      title: title,
      startTime: startTime,
      endTime: endTime,
      eventType: eventType,
      day: day,
      recurringPattern: RecurringEventPattern.weekdays,
      weekdays: weekdays.map((e) => e.value).toList(),
    );
  }

  factory Event.neverRecur({
    required String title,
    required EventTime startTime,
    required EventTime endTime,
    required EventType eventType,
    String? venue,
    String? eventLink,
    DateTime? day,
    WeekDay? weekday,
  }) {
    return Event(
      title: title,
      startTime: startTime,
      endTime: endTime,
      eventType: eventType,
      day: day,
      url: eventLink,
      venue: venue,
      recurringPattern: RecurringEventPattern.never,
      weekdays: [if (weekday != null) weekday.value],
    );
  }

  final String title;
  final DateTime? day;
  final List<int> weekdays;
  final EventTime startTime;
  final EventTime endTime;
  final EventType eventType;
  final RecurringEventPattern recurringPattern;
  final String? url;
  final String? venue;

  @override
  List<Object?> get props => [
        title,
        day,
        startTime,
        endTime,
        eventType,
        recurringPattern,
        weekdays,
        url,
        venue,
      ];
}

enum EventType {
  meeting,
  focusedWork,
  holiday,
  offSick,
  privateTime,
  scheduleMeeting,
}

class EventTime extends Equatable {
  const EventTime({
    required this.hour,
    this.minutes = 0,
  });

  final int hour;
  final int minutes;

  double get totalTimeInHours => hour + minutes / 60;

  @override
  List<Object?> get props => [
        hour,
        minutes,
      ];

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }
}
