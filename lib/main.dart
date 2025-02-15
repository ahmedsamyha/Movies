import 'package:flutter/material.dart';

import 'core/utility/theme_data/app_theme.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(title: Text('Hello'),),
      ),
    );
  }
}
