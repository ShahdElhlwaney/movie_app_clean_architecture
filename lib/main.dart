import 'package:flutter/material.dart';
import 'package:movies_app/core/Services/service_locator.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

import 'core/utils/app_string.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.nameApp,
      theme:ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MainMoviesScreen(),
    );
  }
}




