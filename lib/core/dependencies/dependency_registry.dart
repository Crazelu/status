import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status/core/data/secure_storage.dart';
import 'package:status/core/data/local_cache.dart';
import 'package:status/core/navigation/navigation_bus.dart';
import 'package:status/core/dialog/dialog_handler.dart';
import 'package:status/core/io/api_client.dart';
import 'package:status/core/io/logging_interceptor.dart';
import 'package:status/core/environment.dart';

class DependencyRegistry {
  DependencyRegistry._();

  static Future<void> register() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton(sharedPreferences);

    // Local storage
    GetIt.I.registerLazySingleton<SecureStorage>(
      () => SecureStorageImpl(),
    );

    GetIt.I.registerLazySingleton<LocalCache>(
      () => LocalCacheImpl(
        sharedPreferences: GetIt.I(),
        storage: GetIt.I(),
      ),
    );

    // Navigation
    GetIt.I.registerLazySingleton<NavigationBus>(() => NavigationBusImpl());

    // Dialog
    GetIt.I.registerLazySingleton<DialogHandler>(() => DialogHandlerImpl());

    // API
    GetIt.I.registerLazySingleton<ApiClient>(
      () => ApiClient(
        baseUrl: Environment.baseUrl,
        interceptors: [LoggingInterceptor()],
      ),
    );
  }
}
