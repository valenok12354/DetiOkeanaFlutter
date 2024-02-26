import 'package:flutter/material.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({super.key});
  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  String? userName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, "You must provide smth");
    userName = args as String;
    setState(() {
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userName ?? "...")),
    );
  }
}