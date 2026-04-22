import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/stock.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    on<LoadWatchlist>(_onLoadWatchlist);
    on<ReorderStock>(_onReorderStock);
  }

  void _onLoadWatchlist(LoadWatchlist event, Emitter<WatchlistState> emit) {
    emit(WatchlistLoading());
    // Sample data
    final stocks = [
      const Stock(id: '1', symbol: 'RELIANCE', name: 'Reliance Industries', price: 2950.50, change: 15.20, changePercentage: 0.52),
      const Stock(id: '2', symbol: 'TCS', name: 'Tata Consultancy Services', price: 3840.00, change: -12.45, changePercentage: -0.32),
      const Stock(id: '3', symbol: 'HDFCBANK', name: 'HDFC Bank Limited', price: 1530.20, change: 5.75, changePercentage: 0.38),
      const Stock(id: '4', symbol: 'INFY', name: 'Infosys Limited', price: 1420.80, change: -8.90, changePercentage: -0.62),
      const Stock(id: '5', symbol: 'ICICIBANK', name: 'ICICI Bank Limited', price: 1080.45, change: 12.30, changePercentage: 1.15),
      const Stock(id: '6', symbol: 'BHARTIARTL', name: 'Bharti Airtel Limited', price: 1210.00, change: 2.50, changePercentage: 0.21),
      const Stock(id: '7', symbol: 'SBI', name: 'State Bank of India', price: 760.30, change: -1.20, changePercentage: -0.16),
    ];
    emit(WatchlistLoaded(stocks));
  }

  void _onReorderStock(ReorderStock event, Emitter<WatchlistState> emit) {
    if (state is WatchlistLoaded) {
      final stocks = List<Stock>.from((state as WatchlistLoaded).stocks);
      int newIndex = event.newIndex;
      if (event.oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Stock item = stocks.removeAt(event.oldIndex);
      stocks.insert(newIndex, item);
      emit(WatchlistLoaded(stocks));
    }
  }
}
