import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final double priceUsd;
  final String imageUrl;

 const CryptoCoin({
   required this.name,
   required this.priceUsd,
   required this.imageUrl
 }
     );

  @override
  // TODO: implement props
  List<Object?> get props => [name, priceUsd, imageUrl];
}
