// lib/models/crypto_coin.dart
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCap;
  final int marketCapRank;

  const CryptoCoin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.marketCapRank,
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price']?.toDouble() ?? 0.0,
      priceChange24h: json['price_change_24h']?.toDouble() ?? 0.0,
      priceChangePercentage24h: json['price_change_percentage_24h']?.toDouble() ?? 0.0,
      marketCap: json['market_cap']?.toDouble() ?? 0.0,
      marketCapRank: json['market_cap_rank'] ?? 0,
    );
  }

  @override
  List<Object> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        priceChange24h,
        priceChangePercentage24h,
        marketCap,
        marketCapRank,
      ];
}