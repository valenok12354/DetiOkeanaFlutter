import 'package:dio/dio.dart';
import 'exportCoins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepo {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD"
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
        .map((e) {
          final usdData = (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
          final price = usdData["PRICE"];
          final imageUrl = usdData["IMAGEURL"];
      return CryptoCoin(
        name: e.key,
        priceUsd: price,
        imageUrl: "https://www.cryptocompare.com" + imageUrl,
      );
    }
    )
    .toList();
    return cryptoCoinsList;
  }
}