import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/watchlist/presentation/blocs/watchlist/watchlist_bloc.dart';
import 'features/watchlist/presentation/pages/watchlist_page.dart';

void main() {
  runApp(const TradeApp());
}

class TradeApp extends StatelessWidget {
  const TradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '021 Trade',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (context) => WatchlistBloc(),
        child: const WatchlistPage(),
      ),
    );
  }
}
