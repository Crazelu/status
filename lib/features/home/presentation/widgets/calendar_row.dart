import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:status/core/presentation/widgets/responsive_builder.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:status/features/home/presentation/widgets/day_card.dart';

class CalendarRow extends StatelessWidget {
  const CalendarRow({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();

    return ListenableBuilder(
      listenable: Listenable.merge([
        viewModel.dates,
        viewModel.selectedDate,
      ]),
      builder: (context, _) {
        final dates = viewModel.dates.value;
        final selectedDate = viewModel.selectedDate.value;

        return Row(
          children: [
            InkWell(
              onTap: viewModel.resetSelectedWeekday,
              child: PhosphorIcon(
                PhosphorIcons.calendarBlank(),
                size: (24.0, 20.0).resolve,
              ),
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
              if (item.$1 != dates.length - 1)
                SizedBox(width: (12.0, 8.0).resolve),
            },
          ],
        );
      },
    );
  }
}
