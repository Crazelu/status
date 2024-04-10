import 'package:flutter/foundation.dart';
import 'package:status/core/localization/app_localizations.dart';
import 'package:status/core/presentation/viewmodel/base_view_model.dart';
import 'package:status/features/home/data/models/date.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({required this.locale});

  final AppLocalizations locale;

  final ValueNotifier<List<Date>> _dates = ValueNotifier([]);
  ValueNotifier<List<Date>> get dates => _dates;

  final ValueNotifier<Date?> _selectedDate = ValueNotifier(null);
  ValueNotifier<Date?> get selectedDate => _selectedDate;

  @override
  void initialize() {
    final result = <Date>[];
    final today = DateTime.now();

    for (int i = 0; i < today.weekday; i++) {
      result.add(
        Date.fromDatetime(
          date: today.subtract(Duration(days: today.weekday - i)),
          locale: locale,
        ),
      );
    }
    for (int i = today.weekday; i < 7; i++) {
      result.add(
        Date.fromDatetime(
          date: today.add(Duration(days: i - today.weekday)),
          locale: locale,
        ),
      );
    }

    _dates.value = result;
    _selectedDate.value = result.firstWhere(
      (e) => int.parse(e.day) == today.day,
    );
  }

  void updateSelectedDate(Date date) {
    _selectedDate.value = date;
  }

  @override
  void dispose() {
    _dates.dispose();
    _selectedDate.dispose();
  }
}
