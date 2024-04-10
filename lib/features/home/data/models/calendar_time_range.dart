import 'package:equatable/equatable.dart';
import 'package:status/features/home/data/models/event.dart';

class CalendarTimeRange extends Equatable {
  const CalendarTimeRange({required this.start, required this.end});

  final EventTime start;
  final EventTime end;

  @override
  List<Object?> get props => [start, end];
}
