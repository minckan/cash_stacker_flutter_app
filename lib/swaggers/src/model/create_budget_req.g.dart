// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_budget_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateBudgetReq extends CreateBudgetReq {
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? amount;
  @override
  final bool? isActive;

  factory _$CreateBudgetReq([void Function(CreateBudgetReqBuilder)? updates]) =>
      (new CreateBudgetReqBuilder()..update(updates))._build();

  _$CreateBudgetReq._(
      {this.startDate, this.endDate, this.amount, this.isActive})
      : super._();

  @override
  CreateBudgetReq rebuild(void Function(CreateBudgetReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateBudgetReqBuilder toBuilder() =>
      new CreateBudgetReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateBudgetReq &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        amount == other.amount &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateBudgetReq')
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('amount', amount)
          ..add('isActive', isActive))
        .toString();
  }
}

class CreateBudgetReqBuilder
    implements Builder<CreateBudgetReq, CreateBudgetReqBuilder> {
  _$CreateBudgetReq? _$v;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  CreateBudgetReqBuilder() {
    CreateBudgetReq._defaults(this);
  }

  CreateBudgetReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _amount = $v.amount;
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateBudgetReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateBudgetReq;
  }

  @override
  void update(void Function(CreateBudgetReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateBudgetReq build() => _build();

  _$CreateBudgetReq _build() {
    final _$result = _$v ??
        new _$CreateBudgetReq._(
            startDate: startDate,
            endDate: endDate,
            amount: amount,
            isActive: isActive);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
