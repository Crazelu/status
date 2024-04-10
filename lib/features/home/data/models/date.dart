import 'package:equatable/equatable.dart';
import 'package:status/core/localization/app_localizations.dart';

class Date extends Equatable {
  const Date({
    required this.dayName,
    required this.day,
    required this.month,
    required this.year,
    required this.ordinalDay,
    required this.weekday,
  });

  factory Date.fromDatetime({
    required DateTime date,
    required AppLocalizations locale,
  }) {
    return Date(
      dayName: _getNameForDay(date.weekday, locale),
      day: date.day.toString().padLeft(2, '0'),
      month: _getMonth(date.month, locale),
      year: date.year.toString(),
      ordinalDay: _getOrdinalDate(date.day, locale),
      weekday: date.weekday,
    );
  }

  final String dayName;
  final String day;
  final String month;
  final String year;
  final String ordinalDay;
  final int weekday;

  String get formattedDate => '$dayName, $ordinalDay $month, $year';
  String get formattedDateWithoutYear => '$dayName, $ordinalDay $month';

  static String _getMonth(int month, AppLocalizations locale) {
    return switch (month) {
      1 => locale.january,
      2 => locale.february,
      3 => locale.march,
      4 => locale.april,
      5 => locale.may,
      6 => locale.june,
      7 => locale.july,
      8 => locale.august,
      9 => locale.september,
      10 => locale.october,
      11 => locale.november,
      12 => locale.december,
      _ => '',
    };
  }

  static String _getNameForDay(int weekday, AppLocalizations locale) {
    return switch (weekday) {
      7 => locale.sunday,
      1 => locale.monday,
      2 => locale.tuesday,
      3 => locale.wednesday,
      4 => locale.thursday,
      5 => locale.friday,
      6 => locale.saturday,
      _ => '',
    };
  }

  static String _getOrdinalDate(int day, AppLocalizations locale) {
    return switch (day) {
      1 => locale.first,
      2 => locale.second,
      3 => locale.third,
      4 => locale.fourth,
      5 => locale.fifth,
      6 => locale.sixth,
      7 => locale.seventh,
      8 => locale.eighth,
      9 => locale.ninth,
      10 => locale.tenth,
      11 => locale.eleventh,
      12 => locale.twelfth,
      13 => locale.thirteenth,
      14 => locale.fourteenth,
      15 => locale.fifteenth,
      16 => locale.sixteenth,
      17 => locale.seventeenth,
      18 => locale.eighteenth,
      19 => locale.nineteenth,
      20 => locale.twentieth,
      21 => locale.twentyFirst,
      22 => locale.twentySecond,
      23 => locale.twentyThird,
      24 => locale.twentyFourth,
      25 => locale.twentyFifth,
      26 => locale.twentySixth,
      27 => locale.twentySeventh,
      28 => locale.twentyEighth,
      29 => locale.twentyNinth,
      30 => locale.thirtieth,
      31 => locale.thirtyFirst,
      _ => '',
    };
  }

  @override
  List<Object?> get props => [
        dayName,
        day,
        month,
        year,
        ordinalDay,
        weekday,
      ];
}
