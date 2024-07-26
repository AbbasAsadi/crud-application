import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeRepositories()async {
  if (appFlavor == 'mock') {
    // locator.registerLazySingleton<HomeSource>(() => HomeMockSource());
  }else {
    // locator.registerLazySingleton<HomeSource>(() => HomeRemoteSource());
  }

  /// Home Repository
  // locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(locator<HomeSource>()));

}