// lib/blocs/crypto_state.dart
part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoState {}

class CryptoLoading extends CryptoState {}

class CryptoLoaded extends CryptoState {
  final List<CryptoCoin> coins;

  const CryptoLoaded(this.coins);

  @override
  List<Object> get props => [coins];
}

class CoinDetailLoaded extends CryptoState {
  final CryptoCoin coin;

  const CoinDetailLoaded(this.coin);

  @override
  List<Object> get props => [coin];
}

class CryptoError extends CryptoState {
  final String message;

  const CryptoError(this.message);

  @override
  List<Object> get props => [message];
}