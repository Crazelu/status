import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';

class TimeDividers extends StatelessWidget {
  const TimeDividers({super.key});

  @override
  Widget build(BuildContext context) {
    final range = context.read<HomeViewModel>().timeRange.value;

    return Column(
      children: [
        for (int i = 0; i < (range.end.hour - range.start.hour) + 1; i++) ...[
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
