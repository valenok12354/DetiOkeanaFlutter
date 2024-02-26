import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key, required this.title});
  final String title;
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10,
          itemBuilder: (context, i) => ListTileCustomWidget()),
    );
  }
}