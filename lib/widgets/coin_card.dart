// lib/widgets/coin_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cryptochallenge/models/crypto_coin.dart';

class CoinCard extends StatelessWidget {
  final CryptoCoin coin;
  final VoidCallback onTap;

  const CoinCard({
    super.key,
    required this.coin,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final isPositive = coin.priceChangePercentage24h >= 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(coin.image, width: 40, height: 40),
        title: Text(coin.name),
        subtitle: Text(coin.symbol.toUpperCase()),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              formatter.format(coin.currentPrice),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${isPositive ? '+' : ''}${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
              style: TextStyle(
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}