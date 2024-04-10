import 'package:flutter/material.dart';
import 'package:status/features/home/data/models/event.dart';
import 'package:status/features/home/presentation/extensions/event_type_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  double get _height {
    final endTimeInHours = event.endTime.totalTimeInHours;
    double hours = endTimeInHours - event.startTime.totalTimeInHours;
    if (hours >= 3) {
      hours -= 0.15;
    }
    return hours * 110;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: MediaQuery.sizeOf(context).width * 0.118,
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: event.eventType.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            event.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          AutoSizeText(
            '${event.startTime} - ${event.endTime}',
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
