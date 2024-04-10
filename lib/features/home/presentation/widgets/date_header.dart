import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/day_card.dart';

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
          Align(
            alignment: Alignment.centerLeft,
            child: ValueListenableBuilder(
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
          ),
          const SizedBox(height: 24),
          ListenableBuilder(
            listenable: Listenable.merge([
              viewModel.dates,
              viewModel.selectedDate,
            ]),
            builder: (context, _) {
              final dates = viewModel.dates.value;
              final selectedDate = viewModel.selectedDate.value;

              return Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.calendar(),
                  ),
                  const Spacer(),
                  for (final item in dates.indexed) ...{
                    Expanded(
                      flex: 3,
                      child: DayCard(
                        date: item.$2,
                        selected: item.$2 == selectedDate,
                        onPressed: () {
                          viewModel.updateSelectedDate(item.$2);
                        },
                      ),
                    ),
                    if (item.$1 != dates.length - 1) const SizedBox(width: 12),
                  },
                ],
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
