import '../../domain/entities/stock.dart';

class StockModel extends Stock {
  const StockModel({
    required super.id,
    required super.symbol,
    required super.name,
    required super.price,
    required super.change,
    required super.changePercentage,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      changePercentage: (json['changePercentage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'price': price,
      'change': change,
      'changePercentage': changePercentage,
    };
  }
  
  factory StockModel.fromEntity(Stock stock) {
    return StockModel(
      id: stock.id,
      symbol: stock.symbol,
      name: stock.name,
      price: stock.price,
      change: stock.change,
      changePercentage: stock.changePercentage,
    );
  }
}
