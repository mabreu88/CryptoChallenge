// lib/repositories/crypto_repository.dart
import 'package:cryptochallenge/models/crypto_coin.dart';
import 'package:cryptochallenge/services/api_service.dart';
import 'package:cryptochallenge/services/connectivity_service.dart';

class CryptoRepository {
  final ApiService apiService;
  final ConnectivityService connectivityService;

  CryptoRepository({
    required this.apiService,
    required this.connectivityService,
  });

  Future<List<CryptoCoin>> fetchCryptoData() async {
    if (await connectivityService.isConnected()) {
      return await apiService.fetchCryptoData();
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<CryptoCoin> fetchCoinDetails(String coinId) async {
    if (await connectivityService.isConnected()) {
      return await apiService.fetchCoinDetails(coinId);
    } else {
      throw Exception('No internet connection');
    }
  }
}