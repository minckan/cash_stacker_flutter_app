// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_finance_monthly_month_key_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response
    extends WorkspaceIdFinanceMonthlyMonthKeyGet200Response {
  @override
  final num? netTotal;
  @override
  final num? expense;
  @override
  final num? income;
  @override
  final BuiltList<Transaction>? transactions;

  factory _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response(
          [void Function(
                  WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder)?
              updates]) =>
      (new WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder()
            ..update(updates))
          ._build();

  _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response._(
      {this.netTotal, this.expense, this.income, this.transactions})
      : super._();

  @override
  WorkspaceIdFinanceMonthlyMonthKeyGet200Response rebuild(
          void Function(WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder toBuilder() =>
      new WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdFinanceMonthlyMonthKeyGet200Response &&
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
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdFinanceMonthlyMonthKeyGet200Response')
          ..add('netTotal', netTotal)
          ..add('expense', expense)
          ..add('income', income)
          ..add('transactions', transactions))
        .toString();
  }
}

class WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder
    implements
        Builder<WorkspaceIdFinanceMonthlyMonthKeyGet200Response,
            WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder> {
  _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response? _$v;

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

  WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder() {
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response._defaults(this);
  }

  WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder get _$this {
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
  void replace(WorkspaceIdFinanceMonthlyMonthKeyGet200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response;
  }

  @override
  void update(
      void Function(WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdFinanceMonthlyMonthKeyGet200Response build() => _build();

  _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response _build() {
    _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response _$result;
    try {
      _$result = _$v ??
          new _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response._(
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
            r'WorkspaceIdFinanceMonthlyMonthKeyGet200Response',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
