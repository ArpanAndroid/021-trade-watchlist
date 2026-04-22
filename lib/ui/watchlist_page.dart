import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/watchlist/watchlist_bloc.dart';
import '../../blocs/watchlist/watchlist_event.dart';
import '../../blocs/watchlist/watchlist_state.dart';
import 'widgets/stock_card.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Watchlist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistInitial) {
            context.read<WatchlistBloc>().add(LoadWatchlist());
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchlistLoaded) {
            return ReorderableListView.builder(
              itemCount: state.stocks.length,
              itemBuilder: (context, index) {
                final stock = state.stocks[index];
                return StockCard(
                  key: ValueKey(stock.id),
                  stock: stock,
                );
              },
              onReorder: (oldIndex, newIndex) {
                context.read<WatchlistBloc>().add(ReorderStock(oldIndex, newIndex));
              },
              proxyDecorator: (child, index, animation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) {
                    final double animValue = Curves.easeInOut.transform(animation.value);
                    final double elevation = lerpDouble(0, 6, animValue)!;
                    return Material(
                      elevation: elevation,
                      color: Colors.transparent,
                      child: child,
                    );
                  },
                  child: child,
                );
              },
            );
          } else if (state is WatchlistError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  double? lerpDouble(num? a, num? b, double t) {
    if (a == null && b == null) return null;
    a ??= 0;
    b ??= 0;
    return a + (b - a) * t;
  }
}
