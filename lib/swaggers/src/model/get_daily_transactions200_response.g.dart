// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_daily_transactions200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetDailyTransactions200Response
    extends GetDailyTransactions200Response {
  @override
  final num? netTotal;
  @override
  final num? expense;
  @override
  final num? income;
  @override
  final BuiltList<Transaction>? transactions;

  factory _$GetDailyTransactions200Response(
          [void Function(GetDailyTransactions200ResponseBuilder)? updates]) =>
      (new GetDailyTransactions200ResponseBuilder()..update(updates))._build();

  _$GetDailyTransactions200Response._(
      {this.netTotal, this.expense, this.income, this.transactions})
      : super._();

  @override
  GetDailyTransactions200Response rebuild(
          void Function(GetDailyTransactions200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetDailyTransactions200ResponseBuilder toBuilder() =>
      new GetDailyTransactions200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetDailyTransactions200Response &&
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
    return (newBuiltValueToStringHelper(r'GetDailyTransactions200Response')
          ..add('netTotal', netTotal)
          ..add('expense', expense)
          ..add('income', income)
          ..add('transactions', transactions))
        .toString();
  }
}

class GetDailyTransactions200ResponseBuilder
    implements
        Builder<GetDailyTransactions200Response,
            GetDailyTransactions200ResponseBuilder> {
  _$GetDailyTransactions200Response? _$v;

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

  GetDailyTransactions200ResponseBuilder() {
    GetDailyTransactions200Response._defaults(this);
  }

  GetDailyTransactions200ResponseBuilder get _$this {
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
  void replace(GetDailyTransactions200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetDailyTransactions200Response;
  }

  @override
  void update(void Function(GetDailyTransactions200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetDailyTransactions200Response build() => _build();

  _$GetDailyTransactions200Response _build() {
    _$GetDailyTransactions200Response _$result;
    try {
      _$result = _$v ??
          new _$GetDailyTransactions200Response._(
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
            r'GetDailyTransactions200Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
