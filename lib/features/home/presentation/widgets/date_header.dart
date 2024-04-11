import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/core/presentation/widgets/localization_toggle.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/calendar_row.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: viewModel.selectedDate,
                builder: (context, selectedDate, _) {
                  return Text(
                    selectedDate?.formattedDate ?? '',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  );
                },
              ),
              const Spacer(),
              const LocalizationToggle(),
            ],
          ),
          const SizedBox(height: 24),
          const CalendarRow(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
