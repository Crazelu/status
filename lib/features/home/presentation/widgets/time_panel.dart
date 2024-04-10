import 'package:flutter/material.dart';
import 'package:status/features/home/data/models/event.dart';

class TimePanel extends StatefulWidget {
  const TimePanel({
    super.key,
    required this.from,
    required this.to,
  });

  final EventTime from;
  final EventTime to;

  @override
  State<TimePanel> createState() => _TimePanelState();
}

class _TimePanelState extends State<TimePanel> {
  final List<String> _timeSlots = [];

  void _createTimeSlots() {
    for (int i = widget.from.hour; i <= widget.to.hour; i++) {
      _timeSlots.add('${i / 12 <= 1 ? i : i % 12} ${i / 12 < 1 ? 'am' : 'pm'}');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(_createTimeSlots);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final time in _timeSlots) ...{
          const SizedBox(height: 20),
          Text(
            time,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 60),
        },
      ],
    );
  }
}
