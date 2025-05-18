// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/crypto_coin.dart';

class ApiService {
  static const String _baseUrl = 'https://api.coingecko.com/api/v3';
  static const String _coinsMarket = 
      '/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  Future<List<CryptoCoin>> fetchCryptoData() async {
    final response = await http.get(Uri.parse('$_baseUrl$_coinsMarket'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CryptoCoin.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }

  Future<CryptoCoin> fetchCoinDetails(String coinId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/coins/$coinId?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false'),
    );

    if (response.statusCode == 200) {
      return CryptoCoin.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load coin details');
    }
  }
}