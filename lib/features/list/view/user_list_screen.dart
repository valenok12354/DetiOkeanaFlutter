import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:instructor_dairy/features/bloc/list_bloc.dart';
import 'package:instructor_dairy/features/list/view/single_user/single_user_screen.dart';
import 'package:instructor_dairy/features/list/view/widgets/user_tile.dart';
import 'package:instructor_dairy/repositories/cripto_coins/abstact_coins_repo.dart';
import '../../../repositories/cripto_coins/models/crypto_coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/models/user_model.dart';
import '../../authentication/models/user_repository.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key, required this.title});
  final String title;
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  final cryptoBloc = ListBloc(GetIt.I<AbstractCoinsRepo>());

  @override
  void initState() {
    /// во время инициализации грузим запрос
    // loadCoins();
    // cryptoBloc.add(LoadList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
      cryptoBloc.add(LoadList(completer: completer));
        completer.future;
      },
      child: BlocBuilder<ListBloc, ListState>(
        bloc: cryptoBloc,
        builder: (context, state) {
          if (state is ListLoaded) {
           return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.coinsList.length,
                  itemBuilder: (context, i) =>
                       ListTileCustomWidget(coin: state.coinsList![i]),
              );
          }
          if (state is ListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.exception.toString() ?? "Error"),
                  SizedBox(height: 30),
                  OutlinedButton(
                      onPressed: (){
                        cryptoBloc.add(LoadList());
                      },
                      child: Text("Попробуйте снова")
                  )
                ],
              )
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Добавить пользователя"),
        onPressed: () {
          Navigator.of(context).pushNamed(
              /// объявление роутинга экран юзера
              "/user",
              /// в аргументах можно передавать между экрамнами
              arguments: ""
          );
      },
      ),
    );
  }
}