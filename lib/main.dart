import 'package:flutter/material.dart';
import 'package:instructor_dairy/ListTileCustom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    return MaterialApp(
      title: 'Дети океана',
      theme: ThemeData(
        dividerColor: Colors.white24,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white24),
        scaffoldBackgroundColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(color: Colors.blueGrey,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)
        ),
        textTheme: TextTheme(
            bodyMedium: bodyMediumTextStyle, labelSmall: labelSmallTextStyle),
      ),
      home: const MyHomePage(title: 'Дети океана'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bodyTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
          itemCount: 10, itemBuilder: (context, i) => ListTileCustom()),
    );
  }
}
