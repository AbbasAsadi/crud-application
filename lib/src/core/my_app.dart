import 'package:crud/src/core/routes/app_routes.dart';
import 'package:crud/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CRUD article',
      theme: AppTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.routeConfig,
    );
  }
}
