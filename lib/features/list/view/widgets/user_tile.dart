import 'package:flutter/material.dart';
import 'package:instructor_dairy/repositories/cripto_coins/models/crypto_coin.dart';

class ListTileCustomWidget extends StatelessWidget {
  const ListTileCustomWidget({super.key, required this.coin});
  final CryptoCoin coin;
  Widget build(BuildContext context) {
    var bodyTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Image.network(coin.imageUrl),
      /// можно запихать сюда картинки
      // SvgPicture.asset(
      //   "assets/goggles.svg",
      //   height: 35,
      //   width: 35,
      // ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          /// объявление роутинга экран юзера
            "/user",
            /// в аргументах можно передавать между экрамнами
            arguments: coin.name
        );
      },
      title: Text(
        coin.name,
        style: bodyTheme.bodyMedium,
      ),
      subtitle: Text(
        coin.priceUsd.toString(),
        style: bodyTheme.labelMedium,
      ),
    );
  }
}
