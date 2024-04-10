import 'package:equatable/equatable.dart';

class Event extends Equatable {
  const Event({
    required this.title,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.eventType,
  });

  final String title;
  final DateTime day;
  final EventTime startTime;
  final EventTime endTime;
  final EventType eventType;

  @override
  List<Object?> get props => [
        title,
        day,
        startTime,
        endTime,
        eventType,
      ];
}

enum EventType {
  meeting,
  focusedWork,
  holiday,
  offSick,
  privateTime,
}

class EventTime extends Equatable {
  const EventTime({
    required this.hour,
    this.minutes = 0,
  });

  final int hour;
  final int minutes;

  @override
  List<Object?> get props => [
        hour,
        minutes,
      ];

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}${minutes.toString().padLeft(2, '0')}';
  }
}
