import 'package:flutter/material.dart';
import 'package:status/core/presentation/themes/day_card_theme.dart';
import 'package:status/features/home/data/models/date.dart';

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.date,
    this.selected = false,
    this.onPressed,
  });

  final Date date;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DayCardTheme>()!;

    final backgroundColor = selected
        ? theme.selectedBackgroundColor
        : theme.unselectedBackgroundColor;

    final hoverColor = selected ? Colors.grey.shade800 : Colors.grey.shade200;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 92,
        maxWidth: 148,
      ),
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          hoverColor: hoverColor,
          splashColor: backgroundColor.withOpacity(.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.dayName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: selected
                      ? theme.selectedSecondaryTextColor
                      : theme.unselectedSecondaryTextColor,
                ),
              ),
              Text(
                date.day,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: selected
                      ? theme.selectedPrimaryTextColor
                      : theme.unselectedPrimaryTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
