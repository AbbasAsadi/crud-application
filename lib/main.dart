import 'package:crud/locator.dart';
import 'package:crud/src/core/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize Repositories
  await initializeRepositories();

  /// set supported device orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}
