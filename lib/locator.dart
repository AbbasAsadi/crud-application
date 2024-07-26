import 'package:crud/src/modules/home/_model/data_source/home_mock_source.dart';
import 'package:crud/src/modules/home/_model/data_source/home_remote_source.dart';
import 'package:crud/src/modules/home/_model/data_source/home_source.dart';
import 'package:crud/src/modules/home/_model/repository/home_repository.dart';
import 'package:crud/src/modules/home/_model/repository/home_repository_impl.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeRepositories()async {
  if (appFlavor == 'mock') {
    locator.registerLazySingleton<HomeSource>(() => HomeMockSource());
  }else {
    locator.registerLazySingleton<HomeSource>(() => HomeRemoteSource());
  }

  /// Home Repository
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(locator<HomeSource>()));

}