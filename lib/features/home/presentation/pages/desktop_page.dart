import 'package:flutter/material.dart';
import 'package:status/core/presentation/widgets/scroll_behavior.dart';
import 'package:status/features/home/data/models/event.dart';
import 'package:status/features/home/presentation/widgets/date_header.dart';
import 'package:status/features/home/presentation/widgets/time_dividers.dart';
import 'package:status/features/home/presentation/widgets/time_panel.dart';

const _from = 8;
const _to = 20;

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DateHeader(),
          Expanded(
            child: Material(
              color: const Color(0xFFF3F4F5),
              child: ScrollConfiguration(
                behavior: const StatusScrollBehavior(),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: 120 * (_to - _from).toDouble(),
                    child: const Stack(
                      children: [
                        Positioned(
                          left: 20,
                          child: TimePanel(
                            from: EventTime(hour: _from),
                            to: EventTime(hour: _to),
                          ),
                        ),
                        Positioned.fill(
                          left: 80,
                          child: TimeDividers(
                            from: EventTime(hour: _from),
                            to: EventTime(hour: _to),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
