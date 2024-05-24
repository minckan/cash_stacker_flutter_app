import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';

class Asset {
  /// 자산 고유 아이디
  final String id;

  /// 자산 이름
  final String assetName;

  /// asset 카테고리
  final CategoryModel assetCategory;

  /// 매수 자산 통화
  final Currency? buyingCurrency;

  /// 최초 매수일
  final DateTime initialPurchaseDate;

  /// 자산 거래 내역
  final List<AssetTransaction> transactions;

  /// 자산 현재가 update 가능
  final double currentPrice;

  Asset({
    required this.id,
    required this.assetName,
    required this.assetCategory,
    required this.buyingCurrency,
    required this.initialPurchaseDate,
    required this.transactions,
    required this.currentPrice,
  });

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

  /// 전체 투자 수량 대비 현재 금액 평가 총액
  double get totalEvaluation {
    return currentPrice * totalQuantity;
  }

  /// 실투자 원금 대비 현재평가 총액 손익손실률
  double get profitLossRate {
    final totalPurchase = totalPurchaseAmount;
    final totalEval = totalEvaluation;
    return totalPurchase > 0
        ? ((totalEval - totalPurchase) / totalPurchase) * 100
        : 0;
  }

  /// 평단가
  double get averagePrice {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.price);
    return totalPurchasePrice / transactions.length;
  }

  /// 현재가 수정
  Asset copyWith({
    double? currentPrice,
  }) {
    return Asset(
      id: id,
      assetName: assetName,
      assetCategory: assetCategory,
      buyingCurrency: buyingCurrency,
      initialPurchaseDate: initialPurchaseDate,
      transactions: transactions,
      currentPrice: currentPrice ?? this.currentPrice,
    );
  }

  factory Asset.fromJson(Map<String, dynamic> json) {
    var transactionsJson = json['transactions'] as List<dynamic>;
    List<AssetTransaction> transactionsList = transactionsJson
        .map((transactionJson) => AssetTransaction.fromJson(transactionJson))
        .toList();

    return Asset(
      id: json['id'],
      assetName: json['assetName'],
      assetCategory: CategoryModel.fromJson(json['assetCategory']),
      buyingCurrency: json['buyingCurrency'] != null
          ? Currency.fromJson(json['buyingCurrency'])
          : null,
      initialPurchaseDate: DateTime.parse(json['initialPurchaseDate']),
      transactions: transactionsList,
      currentPrice: json['currentPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'assetName': assetName,
      'assetCategory': assetCategory.toJson(),
      'buyingCurrency': buyingCurrency?.toJson(),
      'initialPurchaseDate': initialPurchaseDate.toIso8601String(),
      'transactions':
          transactions.map((transaction) => transaction.toJson()).toList(),
      'currentPrice': currentPrice,
    };
  }
}
