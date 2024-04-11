import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:googleapis/calendar/v3.dart' as v3;
import 'package:status/core/environment.dart';
import 'package:status/core/io/api_client.dart';
import 'package:status/core/utils/logger.dart';
import 'package:googleapis_auth/auth_browser.dart';

class CalendarRepository {
  final _logger = LoggerFactory.getLogger(CalendarRepository);

  Future<void> getEventsWithDio() async {
    final response = await GetIt.I<ApiClient>().dio.get(
          'https://www.googleapis.com/calendar/v3/calendars/primary/events&key=${Environment.apiKey}',
        );

    _logger.info(prettifyJson(response.data));
  }

  Future<List<v3.Event>> getEvents() async {
    try {
      _logger.info(Environment.apiKey);
      final client = clientViaApiKey(Environment.apiKey);
      final calendarApi = v3.CalendarApi(client);

      final calendars = await calendarApi.calendarList.list();
      _logger.info(calendars.items?.map((e) => e.id).toString() ?? '');

      final response = await calendarApi.events.list('primary');
      return response.items ?? [];
    } on v3.DetailedApiRequestError catch (e) {
      _logger.error(prettifyJson(e.jsonResponse ?? {}));
    } catch (e) {
      _logger.error('getEvents Failed', error: e);
    }
    return [];
  }

  static const decoder = JsonDecoder();
  static const encoder = JsonEncoder.withIndent('  ');

  String prettifyJson(Object input) {
    if (input is! String) {
      input = json.encode(input);
    }

    var object = decoder.convert(input);
    var prettyString = encoder.convert(object);
    return prettyString;
  }
}
