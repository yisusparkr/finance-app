import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  Currency({
    required this.symbol,
    required this.timestamp,
    required this.close,
  });

    String symbol;
    List<int> timestamp;
    List<double> close;

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        symbol: json["symbol"],
        timestamp: List<int>.from(json["timestamp"].map((x) => x)),
        close: List<double>.from(json["close"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "timestamp": List<dynamic>.from(timestamp.map((x) => x)),
        "close": List<dynamic>.from(close.map((x) => x)),
    };
}
