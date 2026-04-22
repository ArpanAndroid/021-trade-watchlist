# 021 Trade - Watchlist Stock Swapping

A Flutter application demonstrating a stock watchlist with reorderable functionality implemented using the **BLoC (Business Logic Component)** pattern.

**GitHub Repository**: [https://github.com/ArpanAndroid/021-trade-watchlist](https://github.com/ArpanAndroid/021-trade-watchlist)

## Features

- **Stock Watchlist**: Displays a list of stocks with symbols, names, current prices, and price changes.
- **Dynamic Reordering**: Users can swap stock positions by dragging and dropping them within the list.
- **BLoC Architecture**: Uses the `flutter_bloc` package for predictable state management.
- **Premium UI**: Dark-themed, modern interface with smooth transitions and visual feedback during reordering.

## Project Structure

The project follows a clean, modular structure:

```text
lib/
├── blocs/
│   └── watchlist/
│       ├── watchlist_bloc.dart    # Manages state transitions and reorder logic
│       ├── watchlist_event.dart   # Defines UI events (Load, Reorder)
│       └── watchlist_state.dart   # Defines UI states (Initial, Loading, Loaded, Error)
├── models/
│   └── stock.dart                 # Stock data model with Equatable for value comparison
├── ui/
│   ├── widgets/
│   │   └── stock_card.dart        # Reusable component for displaying individual stocks
│   └── watchlist_page.dart        # Main screen containing the ReorderableListView
└── main.dart                      # Entry point, theme configuration, and BLoC provision
```

## BLoC Implementation Detail

### Events
- `LoadWatchlist`: Triggered when the app starts to populate the list with sample data.
- `ReorderStock`: Triggered when a user finishes dragging a stock to a new position. It carries the `oldIndex` and `newIndex`.

### State
- `WatchlistLoaded`: Contains the current list of `Stock` objects. When a reorder event occurs, the BLoC calculates the new list order and emits a new `WatchlistLoaded` state, causing the UI to rebuild efficiently.

### Reorder Logic
```dart
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
```

## Getting Started

1.  **Clone the repository** (if applicable).
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the application**:
    ```bash
    flutter run
    ```

## Approach

- **State Management**: Chose BLoC to ensure the UI remains a pure reflection of the state. This makes the swapping logic testable and decoupled from the view.
- **UI/UX**: Implemented `ReorderableListView.builder` for native performance. Added a custom `proxyDecorator` to provide visual elevation when a card is being dragged, enhancing the "premium" feel.
- **Data Integrity**: Used `List<Stock>.from()` to ensure immutability is respected before modifying the list in the BLoC.

---
**Author**: Antigravity (AI Assistant)
**Contact**: anand@021.trade
