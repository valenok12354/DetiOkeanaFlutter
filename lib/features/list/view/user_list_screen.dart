import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instructor_dairy/repositories/cripto_coins/abstact_coins_repo.dart';
import '../../../repositories/cripto_coins/models/crypto_coin.dart';
import 'widgets/widgets.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key, required this.title});
  final String title;
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    /// во время инициализации грузим запрос
    loadCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (_cryptoCoinsList == null)
          ? Center(child: const CircularProgressIndicator())
          : ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: _cryptoCoinsList!.length,
          itemBuilder: (context, i) =>
              ListTileCustomWidget(coin: _cryptoCoinsList![i])
      ),
    );
  }
  /// дергаем метод
  Future<void> loadCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepo>().getCoinsList();
    setState(() {});
  }
}