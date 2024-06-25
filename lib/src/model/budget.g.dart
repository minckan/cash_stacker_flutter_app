// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Budget extends Budget {
  @override
  final int? budgetId;
  @override
  final String? workspaceId;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? amount;
  @override
  final DateTime? createdAt;
  @override
  final bool? isActive;

  factory _$Budget([void Function(BudgetBuilder)? updates]) =>
      (new BudgetBuilder()..update(updates))._build();

  _$Budget._(
      {this.budgetId,
      this.workspaceId,
      this.startDate,
      this.endDate,
      this.amount,
      this.createdAt,
      this.isActive})
      : super._();

  @override
  Budget rebuild(void Function(BudgetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BudgetBuilder toBuilder() => new BudgetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Budget &&
        budgetId == other.budgetId &&
        workspaceId == other.workspaceId &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, budgetId.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Budget')
          ..add('budgetId', budgetId)
          ..add('workspaceId', workspaceId)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('isActive', isActive))
        .toString();
  }
}

class BudgetBuilder implements Builder<Budget, BudgetBuilder> {
  _$Budget? _$v;

  int? _budgetId;
  int? get budgetId => _$this._budgetId;
  set budgetId(int? budgetId) => _$this._budgetId = budgetId;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  BudgetBuilder() {
    Budget._defaults(this);
  }

  BudgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budgetId = $v.budgetId;
      _workspaceId = $v.workspaceId;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Budget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Budget;
  }

  @override
  void update(void Function(BudgetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Budget build() => _build();

  _$Budget _build() {
    final _$result = _$v ??
        new _$Budget._(
            budgetId: budgetId,
            workspaceId: workspaceId,
            startDate: startDate,
            endDate: endDate,
            amount: amount,
            createdAt: createdAt,
            isActive: isActive);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
