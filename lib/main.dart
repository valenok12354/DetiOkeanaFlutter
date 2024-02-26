import 'package:flutter/material.dart';
import 'package:instructor_dairy/router/router.dart';
import 'package:instructor_dairy/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дети океана',
      theme: darkTheme,
      routes: routes,
    );
  }
}
