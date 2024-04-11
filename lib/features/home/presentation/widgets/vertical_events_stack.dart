import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:provider/provider.dart';
import 'package:status/core/dialog/dialog_routes.dart';
import 'package:status/features/home/data/models/date.dart';
import 'package:status/features/home/data/models/event.dart';
import 'package:status/features/home/presentation/dialogs/event_details_dialog.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/event_card.dart';

class VerticalEventsStack extends StatelessWidget {
  const VerticalEventsStack({
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
