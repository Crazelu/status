import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:provider/provider.dart';
import 'package:status/core/dialog/dialog_routes.dart';
import 'package:status/features/home/data/models/date.dart';
import 'package:status/features/home/data/models/event.dart';
import 'package:status/features/home/presentation/dialogs/event_details_dialog.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/event_card.dart';

class EventsGrid extends StatefulWidget {
  const EventsGrid({super.key});

  @override
  State<EventsGrid> createState() => _EventsGridState();
}

class _EventsGridState extends State<EventsGrid> {
  List<Event> _events = [];
  List<List<Event>> _eventsPerDay = List.generate(7, (_) => []);

  void _getEventsPerDay(List<Event> events) {
    if (_events == events) return;
    _events = events;
    _eventsPerDay = List.generate(7, (_) => []);

    final selectedWeekday = context.read<HomeViewModel>().selectedWeekday.value;

    for (final event in events) {
      if (selectedWeekday != null) {
        if (event.weekdays.contains(selectedWeekday)) {
          _eventsPerDay[selectedWeekday - 1].add(event);
        }
        continue;
      }
      if (event.recurringPattern != RecurringEventPattern.never) {
        for (final weekday in event.weekdays) {
          _eventsPerDay[weekday - 1].add(event);
        }
      } else {
        final weekday =
            (event.weekdays.firstOrNull ?? event.day!.weekday).toInt();
        _eventsPerDay[weekday - 1].add(event);
      }
    }
    // move sunday events to beginning of list
    final sundayEvents = _eventsPerDay.removeLast();
    _eventsPerDay.insert(0, sundayEvents);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.sizeOf(context).width;

    return ValueListenableBuilder(
      valueListenable: context.read<HomeViewModel>().events,
      builder: (context, events, _) {
        Future.microtask(() => _getEventsPerDay(events));
        return LayoutBuilder(
          builder: (context, constraints) {
            final dates = context.read<HomeViewModel>().dates.value;
            return ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: windowWidth,
                minHeight: constraints.maxHeight,
              ),
              child: Stack(
                children: [
                  for (final events in _eventsPerDay.indexed)
                    Positioned.fill(
                      left: (events.$1 * windowWidth * 0.132) +
                          windowWidth * 0.012,
                      child: EventsColumn(
                        events: events.$2,
                        date: dates[events.$1],
                      ),
                    )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class EventsColumn extends StatelessWidget {
  const EventsColumn({
    super.key,
    required this.events,
    required this.date,
  });

  final List<Event> events;
  final Date date;

  double _calculateDistance(EventTime end, EventTime start,
      [bool adjust = false]) {
    final endTimeHour = end.totalTimeInHours;
    double hours = endTimeHour - start.totalTimeInHours;

    if (endTimeHour >= 12) {
      hours -= adjust ? 0.45 : 0.35;
    }

    return hours * 110;
  }

  @override
  Widget build(BuildContext context) {
    final range = context.read<HomeViewModel>().timeRange.value;

    return Stack(
      children: [
        for (final item in events.indexed) ...{
          Positioned(
            top: _calculateDistance(
                    item.$2.startTime, range.start, item.$1 == 0) +
                (item.$1 == 0 ? 20 : 12),
            child: EventCard(
              event: item.$2,
              onPressed: () {
                DialogManager.of(context).showDialog(
                  routeName: DialogRoutes.eventDetails,
                  arguments: EventDetailsDialogMessage(
                    event: item.$2,
                    date: date,
                  ),
                );
              },
            ),
          ),
        }
      ],
    );
  }
}
