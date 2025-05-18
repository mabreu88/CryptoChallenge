// lib/blocs/crypto_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cryptochallenge/models/crypto_coin.dart';
import 'package:cryptochallenge/repositories/crypto_repository.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository cryptoRepository;

  CryptoBloc({required this.cryptoRepository}) : super(CryptoInitial()) {
    on<FetchCryptoData>(_onFetchCryptoData);
    on<RefreshCryptoData>(_onRefreshCryptoData);
    on<FetchCoinDetails>(_onFetchCoinDetails);
  }

  FutureOr<void> _onFetchCryptoData(
    FetchCryptoData event,
    Emitter<CryptoState> emit,
  ) async {
    emit(CryptoLoading());
    try {
      final coins = await cryptoRepository.fetchCryptoData();
      emit(CryptoLoaded(coins));
    } catch (e) {
      emit(CryptoError(e.toString()));
    }
  }

  FutureOr<void> _onRefreshCryptoData(
    RefreshCryptoData event,
    Emitter<CryptoState> emit,
  ) async {
    try {
      final coins = await cryptoRepository.fetchCryptoData();
      emit(CryptoLoaded(coins));
    } catch (e) {
      emit(CryptoError(e.toString()));
    }
  }

  FutureOr<void> _onFetchCoinDetails(
    FetchCoinDetails event,
    Emitter<CryptoState> emit,
  ) async {
    emit(CryptoLoading());
    try {
      final coin = await cryptoRepository.fetchCoinDetails(event.coinId);
      emit(CoinDetailLoaded(coin));
    } catch (e) {
      emit(CryptoError(e.toString()));
    }
  }
}