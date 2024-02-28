import 'package:flutter/material.dart';
import 'package:instructor_dairy/repositories/cripto_coins/cripto_coins_repository.dart';
import '../../../repositories/cripto_coins/models/crypto_coin.dart';
import 'widgets/widgets.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key, required this.title});
  final String title;
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  List<CryptoCoin>?  _cryptoCoinsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (_cryptoCoinsList == null)
        ? const SizedBox()
      : ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: _cryptoCoinsList!.length,
          itemBuilder: (context, i) => ListTileCustomWidget(userName: _cryptoCoinsList![i].name,)
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
          onPressed:() async {
         _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
         setState(() {});
        }
        ),

    );
  }
}