import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/watchlist/watchlist_bloc.dart';
import 'ui/watchlist_page.dart';

void main() {
  runApp(const Trade021App());
}

class Trade021App extends StatelessWidget {
  const Trade021App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '021 Trade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto', // Defaulting to Roboto, but could use Google Fonts
      ),
      home: BlocProvider(
        create: (context) => WatchlistBloc(),
        child: const WatchlistPage(),
      ),
    );
  }
}
