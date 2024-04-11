import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/core/presentation/widgets/localization_toggle.dart';
import 'package:status/core/presentation/widgets/scroll_behavior.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/calendar_row.dart';
import 'package:status/features/home/presentation/widgets/time_dividers.dart';
import 'package:status/features/home/presentation/widgets/time_panel.dart';
import 'package:status/features/home/presentation/widgets/vertical_events_stack.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    final timeRange = viewModel.timeRange.value;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: ValueListenableBuilder(
          valueListenable: viewModel.selectedDate,
          builder: (context, selectedDate, _) {
            return Text(
              selectedDate?.formattedDate ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: LocalizationToggle(),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(12),
            child: CalendarRow(),
          ),
          const SizedBox(height: 8),
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
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 20,
                          child: TimePanel(),
                        ),
                        const Positioned.fill(
                          left: 80,
                          child: TimeDividers(),
                        ),
                        Positioned.fill(
                          left: 80,
                          child: ValueListenableBuilder(
                            valueListenable: viewModel.selectedDate,
                            builder: (context, selectedDate, _) {
                              if (selectedDate == null) {
                                return const SizedBox.shrink();
                              }
                              return VerticalEventsStack(
                                events: viewModel.getEventsForWeekDay(
                                  selectedDate.weekday,
                                ),
                                date: selectedDate,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
