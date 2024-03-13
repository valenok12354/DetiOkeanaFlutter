import 'models/crypto_coin.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList();
}