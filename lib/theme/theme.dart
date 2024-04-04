import 'package:flutter/material.dart';

var labelSmallTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.6),
  fontWeight: FontWeight.w700,
  fontSize: 14,
);
const bodyMediumTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 20,
);

final darkTheme = ThemeData(
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white24),
  scaffoldBackgroundColor: Colors.blueGrey,
  appBarTheme: const AppBarTheme(
      color: Colors.blueGrey,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700
      )
  ),
  textTheme: TextTheme(
      bodyMedium: bodyMediumTextStyle,
      labelSmall: labelSmallTextStyle
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: Colors.cyan
  )
);