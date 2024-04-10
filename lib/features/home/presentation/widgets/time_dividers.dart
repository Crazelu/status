import 'package:flutter/material.dart';
import 'package:status/features/home/data/models/event.dart';

class TimeDividers extends StatelessWidget {
  const TimeDividers({
    super.key,
    required this.from,
    required this.to,
  });

  final EventTime from;
  final EventTime to;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < (to.hour - from.hour) + 1; i++) ...[
          Padding(
            padding: EdgeInsets.only(
              top: i == 0 ? 30 : 104,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFE8E9EA),
            ),
          ),
        ],
      ],
    );
  }
}
