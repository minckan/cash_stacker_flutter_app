// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssetInfo extends AssetInfo {
  @override
  final String? name;
  @override
  final num? amount;
  @override
  final num? ratio;
  @override
  final Date? initialPurchaseDate;
  @override
  final num? buyingExchangeRate;
  @override
  final num? totalBuyingAmountKrw;
  @override
  final num? buyingSinglePriceKrw;
  @override
  final num? currentSinglePriceKrw;
  @override
  final num? totalEvaluationAmountKrw;
  @override
  final num? profitLossRateKrw;
  @override
  final num? totalCurrentAmountKrw;
  @override
  final num? totalBuyingAmountForeign;
  @override
  final num? buyingSinglePriceForeign;
  @override
  final num? currentSinglePriceForeign;
  @override
  final num? totalEvaluationAmountForeign;
  @override
  final num? profitLossRateForeign;
  @override
  final num? totalCurrentAmountForeign;

  factory _$AssetInfo([void Function(AssetInfoBuilder)? updates]) =>
      (new AssetInfoBuilder()..update(updates))._build();

  _$AssetInfo._(
      {this.name,
      this.amount,
      this.ratio,
      this.initialPurchaseDate,
      this.buyingExchangeRate,
      this.totalBuyingAmountKrw,
      this.buyingSinglePriceKrw,
      this.currentSinglePriceKrw,
      this.totalEvaluationAmountKrw,
      this.profitLossRateKrw,
      this.totalCurrentAmountKrw,
      this.totalBuyingAmountForeign,
      this.buyingSinglePriceForeign,
      this.currentSinglePriceForeign,
      this.totalEvaluationAmountForeign,
      this.profitLossRateForeign,
      this.totalCurrentAmountForeign})
      : super._();

  @override
  AssetInfo rebuild(void Function(AssetInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetInfoBuilder toBuilder() => new AssetInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetInfo &&
        name == other.name &&
        amount == other.amount &&
        ratio == other.ratio &&
        initialPurchaseDate == other.initialPurchaseDate &&
        buyingExchangeRate == other.buyingExchangeRate &&
        totalBuyingAmountKrw == other.totalBuyingAmountKrw &&
        buyingSinglePriceKrw == other.buyingSinglePriceKrw &&
        currentSinglePriceKrw == other.currentSinglePriceKrw &&
        totalEvaluationAmountKrw == other.totalEvaluationAmountKrw &&
        profitLossRateKrw == other.profitLossRateKrw &&
        totalCurrentAmountKrw == other.totalCurrentAmountKrw &&
        totalBuyingAmountForeign == other.totalBuyingAmountForeign &&
        buyingSinglePriceForeign == other.buyingSinglePriceForeign &&
        currentSinglePriceForeign == other.currentSinglePriceForeign &&
        totalEvaluationAmountForeign == other.totalEvaluationAmountForeign &&
        profitLossRateForeign == other.profitLossRateForeign &&
        totalCurrentAmountForeign == other.totalCurrentAmountForeign;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, ratio.hashCode);
    _$hash = $jc(_$hash, initialPurchaseDate.hashCode);
    _$hash = $jc(_$hash, buyingExchangeRate.hashCode);
    _$hash = $jc(_$hash, totalBuyingAmountKrw.hashCode);
    _$hash = $jc(_$hash, buyingSinglePriceKrw.hashCode);
    _$hash = $jc(_$hash, currentSinglePriceKrw.hashCode);
    _$hash = $jc(_$hash, totalEvaluationAmountKrw.hashCode);
    _$hash = $jc(_$hash, profitLossRateKrw.hashCode);
    _$hash = $jc(_$hash, totalCurrentAmountKrw.hashCode);
    _$hash = $jc(_$hash, totalBuyingAmountForeign.hashCode);
    _$hash = $jc(_$hash, buyingSinglePriceForeign.hashCode);
    _$hash = $jc(_$hash, currentSinglePriceForeign.hashCode);
    _$hash = $jc(_$hash, totalEvaluationAmountForeign.hashCode);
    _$hash = $jc(_$hash, profitLossRateForeign.hashCode);
    _$hash = $jc(_$hash, totalCurrentAmountForeign.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetInfo')
          ..add('name', name)
          ..add('amount', amount)
          ..add('ratio', ratio)
          ..add('initialPurchaseDate', initialPurchaseDate)
          ..add('buyingExchangeRate', buyingExchangeRate)
          ..add('totalBuyingAmountKrw', totalBuyingAmountKrw)
          ..add('buyingSinglePriceKrw', buyingSinglePriceKrw)
          ..add('currentSinglePriceKrw', currentSinglePriceKrw)
          ..add('totalEvaluationAmountKrw', totalEvaluationAmountKrw)
          ..add('profitLossRateKrw', profitLossRateKrw)
          ..add('totalCurrentAmountKrw', totalCurrentAmountKrw)
          ..add('totalBuyingAmountForeign', totalBuyingAmountForeign)
          ..add('buyingSinglePriceForeign', buyingSinglePriceForeign)
          ..add('currentSinglePriceForeign', currentSinglePriceForeign)
          ..add('totalEvaluationAmountForeign', totalEvaluationAmountForeign)
          ..add('profitLossRateForeign', profitLossRateForeign)
          ..add('totalCurrentAmountForeign', totalCurrentAmountForeign))
        .toString();
  }
}

class AssetInfoBuilder implements Builder<AssetInfo, AssetInfoBuilder> {
  _$AssetInfo? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  num? _ratio;
  num? get ratio => _$this._ratio;
  set ratio(num? ratio) => _$this._ratio = ratio;

  Date? _initialPurchaseDate;
  Date? get initialPurchaseDate => _$this._initialPurchaseDate;
  set initialPurchaseDate(Date? initialPurchaseDate) =>
      _$this._initialPurchaseDate = initialPurchaseDate;

  num? _buyingExchangeRate;
  num? get buyingExchangeRate => _$this._buyingExchangeRate;
  set buyingExchangeRate(num? buyingExchangeRate) =>
      _$this._buyingExchangeRate = buyingExchangeRate;

  num? _totalBuyingAmountKrw;
  num? get totalBuyingAmountKrw => _$this._totalBuyingAmountKrw;
  set totalBuyingAmountKrw(num? totalBuyingAmountKrw) =>
      _$this._totalBuyingAmountKrw = totalBuyingAmountKrw;

  num? _buyingSinglePriceKrw;
  num? get buyingSinglePriceKrw => _$this._buyingSinglePriceKrw;
  set buyingSinglePriceKrw(num? buyingSinglePriceKrw) =>
      _$this._buyingSinglePriceKrw = buyingSinglePriceKrw;

  num? _currentSinglePriceKrw;
  num? get currentSinglePriceKrw => _$this._currentSinglePriceKrw;
  set currentSinglePriceKrw(num? currentSinglePriceKrw) =>
      _$this._currentSinglePriceKrw = currentSinglePriceKrw;

  num? _totalEvaluationAmountKrw;
  num? get totalEvaluationAmountKrw => _$this._totalEvaluationAmountKrw;
  set totalEvaluationAmountKrw(num? totalEvaluationAmountKrw) =>
      _$this._totalEvaluationAmountKrw = totalEvaluationAmountKrw;

  num? _profitLossRateKrw;
  num? get profitLossRateKrw => _$this._profitLossRateKrw;
  set profitLossRateKrw(num? profitLossRateKrw) =>
      _$this._profitLossRateKrw = profitLossRateKrw;

  num? _totalCurrentAmountKrw;
  num? get totalCurrentAmountKrw => _$this._totalCurrentAmountKrw;
  set totalCurrentAmountKrw(num? totalCurrentAmountKrw) =>
      _$this._totalCurrentAmountKrw = totalCurrentAmountKrw;

  num? _totalBuyingAmountForeign;
  num? get totalBuyingAmountForeign => _$this._totalBuyingAmountForeign;
  set totalBuyingAmountForeign(num? totalBuyingAmountForeign) =>
      _$this._totalBuyingAmountForeign = totalBuyingAmountForeign;

  num? _buyingSinglePriceForeign;
  num? get buyingSinglePriceForeign => _$this._buyingSinglePriceForeign;
  set buyingSinglePriceForeign(num? buyingSinglePriceForeign) =>
      _$this._buyingSinglePriceForeign = buyingSinglePriceForeign;

  num? _currentSinglePriceForeign;
  num? get currentSinglePriceForeign => _$this._currentSinglePriceForeign;
  set currentSinglePriceForeign(num? currentSinglePriceForeign) =>
      _$this._currentSinglePriceForeign = currentSinglePriceForeign;

  num? _totalEvaluationAmountForeign;
  num? get totalEvaluationAmountForeign => _$this._totalEvaluationAmountForeign;
  set totalEvaluationAmountForeign(num? totalEvaluationAmountForeign) =>
      _$this._totalEvaluationAmountForeign = totalEvaluationAmountForeign;

  num? _profitLossRateForeign;
  num? get profitLossRateForeign => _$this._profitLossRateForeign;
  set profitLossRateForeign(num? profitLossRateForeign) =>
      _$this._profitLossRateForeign = profitLossRateForeign;

  num? _totalCurrentAmountForeign;
  num? get totalCurrentAmountForeign => _$this._totalCurrentAmountForeign;
  set totalCurrentAmountForeign(num? totalCurrentAmountForeign) =>
      _$this._totalCurrentAmountForeign = totalCurrentAmountForeign;

  AssetInfoBuilder() {
    AssetInfo._defaults(this);
  }

  AssetInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _amount = $v.amount;
      _ratio = $v.ratio;
      _initialPurchaseDate = $v.initialPurchaseDate;
      _buyingExchangeRate = $v.buyingExchangeRate;
      _totalBuyingAmountKrw = $v.totalBuyingAmountKrw;
      _buyingSinglePriceKrw = $v.buyingSinglePriceKrw;
      _currentSinglePriceKrw = $v.currentSinglePriceKrw;
      _totalEvaluationAmountKrw = $v.totalEvaluationAmountKrw;
      _profitLossRateKrw = $v.profitLossRateKrw;
      _totalCurrentAmountKrw = $v.totalCurrentAmountKrw;
      _totalBuyingAmountForeign = $v.totalBuyingAmountForeign;
      _buyingSinglePriceForeign = $v.buyingSinglePriceForeign;
      _currentSinglePriceForeign = $v.currentSinglePriceForeign;
      _totalEvaluationAmountForeign = $v.totalEvaluationAmountForeign;
      _profitLossRateForeign = $v.profitLossRateForeign;
      _totalCurrentAmountForeign = $v.totalCurrentAmountForeign;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetInfo;
  }

  @override
  void update(void Function(AssetInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetInfo build() => _build();

  _$AssetInfo _build() {
    final _$result = _$v ??
        new _$AssetInfo._(
            name: name,
            amount: amount,
            ratio: ratio,
            initialPurchaseDate: initialPurchaseDate,
            buyingExchangeRate: buyingExchangeRate,
            totalBuyingAmountKrw: totalBuyingAmountKrw,
            buyingSinglePriceKrw: buyingSinglePriceKrw,
            currentSinglePriceKrw: currentSinglePriceKrw,
            totalEvaluationAmountKrw: totalEvaluationAmountKrw,
            profitLossRateKrw: profitLossRateKrw,
            totalCurrentAmountKrw: totalCurrentAmountKrw,
            totalBuyingAmountForeign: totalBuyingAmountForeign,
            buyingSinglePriceForeign: buyingSinglePriceForeign,
            currentSinglePriceForeign: currentSinglePriceForeign,
            totalEvaluationAmountForeign: totalEvaluationAmountForeign,
            profitLossRateForeign: profitLossRateForeign,
            totalCurrentAmountForeign: totalCurrentAmountForeign);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
