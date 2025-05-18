part of 'crypto_bloc.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}
class FetchCryptoData extends CryptoEvent {}

class RefreshCryptoData extends CryptoEvent {}

class FetchCoinDetails extends CryptoEvent {
  final String coinId;

  const FetchCoinDetails(this.coinId);

  @override
  List<Object> get props => [coinId];
}