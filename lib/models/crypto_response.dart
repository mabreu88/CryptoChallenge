import 'package:cryptochallenge/models/crypto_coin.dart';
import 'package:equatable/equatable.dart';

class CryptoResponse extends Equatable {
  final List<CryptoCoin> coins;
  final String status;

  const CryptoResponse({
    required this.coins,
    required this.status,
  });

  @override
  List<Object?> get props => [coins, status];

  factory CryptoResponse.fromJson(Map<String, dynamic> json) {
    return CryptoResponse(
      coins: (json['coins'] as List)
          .map((coin) => CryptoCoin.fromJson(coin))
          .toList(),
      status: json['status'],
    );
  }
}