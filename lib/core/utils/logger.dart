import 'dart:developer' as dev;

bool _showLogs = false;

class LoggerFactory {
  LoggerFactory._();

  static AppLogger getLogger([Object? scope]) => _Logger(scope?.toString());
}

abstract class AppLogger {
  AppLogger._();

  static void configure({required bool showLogs}) {
    _showLogs = showLogs;
  }

  void debug(Object? e) {}

  void error(Object? e) {}

  void severe(Object? e) {}
}

class _Logger implements AppLogger {
  _Logger([this.scope]);

  final String? scope;

  void _log(Object? e) {
    if (_showLogs) {
      if (scope != null) {
        dev.log('$scope: $e');
      } else {
        dev.log('$e');
      }
    }
  }

  @override
  void debug(Object? e) => _log(e);

  @override
  void error(Object? e) => _log(e);

  @override
  void severe(Object? e) => _log(e);
}
