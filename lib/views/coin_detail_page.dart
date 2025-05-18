// lib/views/coin_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptochallenge/blocs/crypto_bloc.dart';
import 'package:cryptochallenge/models/crypto_coin.dart';
import 'package:cryptochallenge/widgets/error_widget.dart';
import 'package:cryptochallenge/widgets/loading_widget.dart';
import 'package:intl/intl.dart';

class CoinDetailPage extends StatelessWidget {
  final String coinId;

  const CoinDetailPage({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    context.read<CryptoBloc>().add(FetchCoinDetails(coinId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Details'),
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          if (state is CryptoLoading) {
            return const LoadingWidget();
          } else if (state is CryptoError) {
            return CustomErrorWidget(message: state.message);
          } else if (state is CoinDetailLoaded) {
            return _buildDetailPage(context, state.coin);
          } else {
            return const CustomErrorWidget(message: 'Unknown state');
          }
        },
      ),
    );
  }

  Widget _buildDetailPage(BuildContext context, CryptoCoin coin) {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(coin.image, height: 50, width: 50),
              const SizedBox(width: 16),
              Text(
                coin.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: 8),
              Text(
                coin.symbol.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Price Information',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          _buildDetailRow(
            context,
            'Current Price',
            formatter.format(coin.currentPrice),
          ),
          _buildDetailRow(
            context,
            '24h Change',
            '${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
            isPositive: coin.priceChangePercentage24h >= 0,
          ),
          _buildDetailRow(
            context,
            '24h High',
            formatter.format(coin.currentPrice + coin.priceChange24h),
          ),
          _buildDetailRow(
            context,
            '24h Low',
            formatter.format(coin.currentPrice - coin.priceChange24h),
          ),
          const SizedBox(height: 24),
          Text(
            'Market Data',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          _buildDetailRow(
            context,
            'Market Cap',
            formatter.format(coin.marketCap),
          ),
          _buildDetailRow(
            context,
            'Market Cap Rank',
            '#${coin.marketCapRank}',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool? isPositive,
  }) {
    Color? valueColor;
    if (isPositive != null) {
      valueColor = isPositive ? Colors.green : Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: valueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}