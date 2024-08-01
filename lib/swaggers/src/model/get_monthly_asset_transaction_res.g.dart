// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_monthly_asset_transaction_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetMonthlyAssetTransactionRes extends GetMonthlyAssetTransactionRes {
  @override
  final num? netTotal;
  @override
  final num? expense;
  @override
  final num? income;
  @override
  final BuiltList<Transaction>? transactions;

  factory _$GetMonthlyAssetTransactionRes(
          [void Function(GetMonthlyAssetTransactionResBuilder)? updates]) =>
      (new GetMonthlyAssetTransactionResBuilder()..update(updates))._build();

  _$GetMonthlyAssetTransactionRes._(
      {this.netTotal, this.expense, this.income, this.transactions})
      : super._();

  @override
  GetMonthlyAssetTransactionRes rebuild(
          void Function(GetMonthlyAssetTransactionResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMonthlyAssetTransactionResBuilder toBuilder() =>
      new GetMonthlyAssetTransactionResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMonthlyAssetTransactionRes &&
        netTotal == other.netTotal &&
        expense == other.expense &&
        income == other.income &&
        transactions == other.transactions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, netTotal.hashCode);
    _$hash = $jc(_$hash, expense.hashCode);
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jc(_$hash, transactions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetMonthlyAssetTransactionRes')
          ..add('netTotal', netTotal)
          ..add('expense', expense)
          ..add('income', income)
          ..add('transactions', transactions))
        .toString();
  }
}

class GetMonthlyAssetTransactionResBuilder
    implements
        Builder<GetMonthlyAssetTransactionRes,
            GetMonthlyAssetTransactionResBuilder> {
  _$GetMonthlyAssetTransactionRes? _$v;

  num? _netTotal;
  num? get netTotal => _$this._netTotal;
  set netTotal(num? netTotal) => _$this._netTotal = netTotal;

  num? _expense;
  num? get expense => _$this._expense;
  set expense(num? expense) => _$this._expense = expense;

  num? _income;
  num? get income => _$this._income;
  set income(num? income) => _$this._income = income;

  ListBuilder<Transaction>? _transactions;
  ListBuilder<Transaction> get transactions =>
      _$this._transactions ??= new ListBuilder<Transaction>();
  set transactions(ListBuilder<Transaction>? transactions) =>
      _$this._transactions = transactions;

  GetMonthlyAssetTransactionResBuilder() {
    GetMonthlyAssetTransactionRes._defaults(this);
  }

  GetMonthlyAssetTransactionResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _netTotal = $v.netTotal;
      _expense = $v.expense;
      _income = $v.income;
      _transactions = $v.transactions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetMonthlyAssetTransactionRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMonthlyAssetTransactionRes;
  }

  @override
  void update(void Function(GetMonthlyAssetTransactionResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMonthlyAssetTransactionRes build() => _build();

  _$GetMonthlyAssetTransactionRes _build() {
    _$GetMonthlyAssetTransactionRes _$result;
    try {
      _$result = _$v ??
          new _$GetMonthlyAssetTransactionRes._(
              netTotal: netTotal,
              expense: expense,
              income: income,
              transactions: _transactions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transactions';
        _transactions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetMonthlyAssetTransactionRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
