import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../../../authentication/models/user_model.dart';
import '../../../authentication/models/user_repository.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({super.key});
  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  String? userName;
  final textEditControllerName = TextEditingController();
  final textEditControllerSurname = TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   textEditController.addListener(getNametoAppBar);
  // }
  // void getNametoAppBar() {
  //   final text = textEditController.text;
  //   print(text);
  // }
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
      appBar: AppBar(title: Text(textEditControllerName.text + "  " + textEditControllerSurname.text)),
     body:  Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: textEditControllerName,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Имя",
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: textEditControllerSurname,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Фамилия",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]
    )
    ),
      floatingActionButton: FloatingActionButton.extended (
        label: Text("Добавить ученика"),
        onPressed: () {
          setState(() {
            textEditControllerName.text;
            textEditControllerSurname.text;
            final user = UserModel(name:  textEditControllerName.text, surname: textEditControllerSurname.text);
            createHardCoreUser(user);
          });
        },
      ),
    );
  }
}

final userRepo = Get.put(UserRepository());
Future<void> createHardCoreUser(UserModel user) async {
  await userRepo.createUser(user);
}