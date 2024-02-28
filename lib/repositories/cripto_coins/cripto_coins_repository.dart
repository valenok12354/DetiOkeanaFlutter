import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instructor_dairy/repositories/cripto_coins/models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB&tsyms=USD"
    );
    final data = response.data as Map<String, dynamic>;
    final cryptoCoinsList = data.entries
        .map((e) => CryptoCoin(
        name: e.key,
        priceUsd: (e.value as Map<String, dynamic>)["USD"],
    ))
    .toList();
    return cryptoCoinsList;
  }
}