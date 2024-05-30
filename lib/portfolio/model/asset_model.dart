import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';

class Asset {
  /// 자산 고유 아이디
  final String id;

  /// 자산 이름
  final String name;

  /// asset 카테고리
  final CategoryModel category;

  /// 매수 자산 통화
  final Currency? currency;

  /// 최초 매수일
  final DateTime initialPurchaseDate;

  /// 자산 거래 내역
  final List<AssetTransaction> transactions;

  /// 자산 현재가 update 가능
  final double inputCurrentPrice;

  Asset({
    required this.id,
    required this.name,
    required this.category,
    required this.currency,
    required this.initialPurchaseDate,
    required this.transactions,
    required this.inputCurrentPrice,
  });

  bool get _isKrwAsset {
    if (currency == null || currency!.currencyCode == "KRW") {
      return true;
    } else {
      return false;
    }
  }

  /// 매수 이력 리스트
  List<AssetTransaction> get purchaseTransactions {
    return transactions
        .where((transaction) => transaction.type == AssetTransactionType.buy)
        .toList();
  }

  /// 매도 이력 리스트
  List<AssetTransaction> get sellingTransactions {
    return transactions
        .where((transaction) => transaction.type == AssetTransactionType.sell)
        .toList();
  }

  /// 전체 투자 금액 (실제 투자 원금 총액)
  double get totalPurchaseAmount {
    return purchaseTransactions.fold(0,
        (sum, transaction) => sum + (transaction.price * transaction.quantity));
  }

  /// 전체 투자 수량
  double get totalQuantity {
    return purchaseTransactions.fold(
        0, (sum, transaction) => sum + transaction.quantity);
  }

  /// 평균 매입가 (원화)
  double get averageKrwPrice {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.krwPrice);
    return totalPurchasePrice / transactions.length;
  }

  /// 평균 매입가 (외화)
  double get averagePrice {
    if (_isKrwAsset) {
      return 0;
    } else {
      final totalPurchasePrice = purchaseTransactions.fold(
          0.0, (sum, transaction) => sum + transaction.price);
      return totalPurchasePrice / transactions.length;
    }
  }

  /// 현재가(외화)
  double get currentPrice {
    if (_isKrwAsset) {
      return 0.0;
    } else {
      return inputCurrentPrice;
    }
  }

  /// 현재 평가액(원화)
  // double get totalKrwEvaluation {
  //   return currentKrwPrice * totalQuantity;
  // }

  /// 현재 평가액(외화)
  double get totalEvaluation {
    if (_isKrwAsset) {
      return 0;
    } else {
      return currentPrice * totalQuantity;
    }
  }

  /// 원화 환산 수익률
  // double get krwProfitLossRate {
  //   final totalPurchase = totalPurchaseAmount;
  //   final totalEval = totalKrwEvaluation;
  //   return totalPurchase > 0
  //       ? ((totalEval - totalPurchase) / totalPurchase) * 100
  //       : 0;
  // }

  /// 외화 수익률
  double get profitLossRate {
    if (_isKrwAsset) {
      return 0;
    } else {
      final totalPurchase = totalPurchaseAmount;
      final totalEval = totalEvaluation;
      return totalPurchase > 0
          ? ((totalEval - totalPurchase) / totalPurchase) * 100
          : 0;
    }
  }

  /// 현재가 수정
  Asset copyWith({
    double? inputCurrentPrice,
  }) {
    return Asset(
      id: id,
      name: name,
      category: category,
      currency: currency,
      initialPurchaseDate: initialPurchaseDate,
      transactions: transactions,
      inputCurrentPrice: inputCurrentPrice ?? this.inputCurrentPrice,
    );
  }

  factory Asset.fromJson(Map<String, dynamic> json) {
    var transactionsJson = json['transactions'] as List<dynamic>;
    List<AssetTransaction> transactionsList = transactionsJson
        .map((transactionJson) => AssetTransaction.fromJson(transactionJson))
        .toList();

    return Asset(
      id: json['id'],
      name: json['name'],
      category: CategoryModel.fromJson(json['category']),
      currency:
          json['currency'] != null ? Currency.fromJson(json['currency']) : null,
      initialPurchaseDate: DateTime.parse(json['initialPurchaseDate']),
      transactions: transactionsList,
      inputCurrentPrice: json['inputCurrentPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category.toJson(),
      'currency': currency?.toJson(),
      'initialPurchaseDate': initialPurchaseDate.toIso8601String(),
      'transactions':
          transactions.map((transaction) => transaction.toJson()).toList(),
      'inputCurrentPrice': inputCurrentPrice,
    };
  }
}
