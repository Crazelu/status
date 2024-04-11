import 'package:flutter/material.dart';
import 'package:status/core/presentation/themes/day_card_theme.dart';
import 'package:status/core/presentation/widgets/responsive_builder.dart';
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
      constraints: BoxConstraints(
        maxHeight: (92.0, 72.0).resolve,
        maxWidth: 148,
      ),
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            (16.0, 8.0).resolve,
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(
            (16.0, 8.0).resolve,
          ),
          hoverColor: hoverColor,
          splashColor: backgroundColor.withOpacity(.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (date.dayName, date.dayName.substring(0, 3)).resolve,
                style: TextStyle(
                  fontSize: (14.0, 12.0).resolve,
                  fontWeight: FontWeight.w500,
                  color: selected
                      ? theme.selectedSecondaryTextColor
                      : theme.unselectedSecondaryTextColor,
                ),
              ),
              SizedBox(height: (0.0, 4.0).resolve),
              Text(
                date.day,
                style: TextStyle(
                  fontSize: (28.0, 20.0).resolve,
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
