import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/core/presentation/widgets/scroll_behavior.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/date_header.dart';
import 'package:status/features/home/presentation/widgets/events_grid.dart';
import 'package:status/features/home/presentation/widgets/time_dividers.dart';
import 'package:status/features/home/presentation/widgets/time_panel.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timeRange = context.read<HomeViewModel>().timeRange.value;

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
                    height: 120 *
                        (timeRange.end.hour - timeRange.start.hour).toDouble(),
                    child: const Stack(
                      children: [
                        Positioned(
                          left: 20,
                          child: TimePanel(),
                        ),
                        Positioned.fill(
                          left: 80,
                          child: TimeDividers(),
                        ),
                        Positioned.fill(
                          left: 80,
                          child: EventsGrid(),
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
