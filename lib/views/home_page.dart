// lib/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cryptochallenge/blocs/crypto_bloc.dart';
import 'package:cryptochallenge/widgets/coin_card.dart';
import 'package:cryptochallenge/widgets/error_widget.dart';
import 'package:cryptochallenge/widgets/loading_widget.dart';
import 'package:cryptochallenge/views/coin_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<CryptoBloc>().add(RefreshCryptoData());
            },
          ),
        ],
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          if (state is CryptoInitial || state is CryptoLoading) {
            return const LoadingWidget();
          } else if (state is CryptoError) {
            return CustomErrorWidget(message: state.message);
          } else if (state is CryptoLoaded) {
            return SmartRefresher(
              enablePullDown: true,
              header: const WaterDropHeader(),
              onRefresh: () {
                context.read<CryptoBloc>().add(RefreshCryptoData());
              },
              controller: RefreshController(),
              child: ListView.builder(
                itemCount: state.coins.length,
                itemBuilder: (context, index) {
                  final coin = state.coins[index];
                  return CoinCard(
                    coin: coin,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoinDetailPage(coinId: coin.id),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const CustomErrorWidget(message: 'Unknown state');
          }
        },
      ),
    );
  }
}