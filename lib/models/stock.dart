import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final double price;
  final double change;
  final double changePercentage;

  const Stock({
    required this.id,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  @override
  List<Object?> get props => [id, symbol, name, price, change, changePercentage];
}
