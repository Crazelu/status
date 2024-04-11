import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:status/features/home/data/models/event.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/vertical_events_stack.dart';

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
            return ValueListenableBuilder(
              valueListenable: context.read<HomeViewModel>().dates,
              builder: (context, dates, _) {
                if (dates.isEmpty) return const SizedBox.shrink();
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
                          child: VerticalEventsStack(
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
      },
    );
  }
}
