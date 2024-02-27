
import 'package:flutter/material.dart';
import 'package:instructor_dairy/router/router.dart';
import 'package:instructor_dairy/theme/theme.dart';

class UsersApp extends StatelessWidget {
  const UsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дети океана',
      theme: darkTheme,
      routes: routes,
    );
  }
}