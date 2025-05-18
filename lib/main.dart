// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptochallenge/blocs/crypto_bloc.dart';
import 'package:cryptochallenge/repositories/crypto_repository.dart';
import 'package:cryptochallenge/services/api_service.dart';
import 'package:cryptochallenge/services/connectivity_service.dart';
import 'package:cryptochallenge/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(
        apiService: ApiService(),
        connectivityService: ConnectivityService(),
      ),
      child: BlocProvider(
        create: (context) => CryptoBloc(
          cryptoRepository: RepositoryProvider.of<CryptoRepository>(context),
        )..add(FetchCryptoData()),
        child: MaterialApp(
          title: 'Crypto Challenge',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}