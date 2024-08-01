// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_financial_tracker_transaction_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateFinancialTrackerTransactionReq
    extends UpdateFinancialTrackerTransactionReq {
  @override
  final int? categoryId;
  @override
  final double? amount;
  @override
  final String? transactionType;
  @override
  final String? description;
  @override
  final DateTime? transactionDate;

  factory _$UpdateFinancialTrackerTransactionReq(
          [void Function(UpdateFinancialTrackerTransactionReqBuilder)?
              updates]) =>
      (new UpdateFinancialTrackerTransactionReqBuilder()..update(updates))
          ._build();

  _$UpdateFinancialTrackerTransactionReq._(
      {this.categoryId,
      this.amount,
      this.transactionType,
      this.description,
      this.transactionDate})
      : super._();

  @override
  UpdateFinancialTrackerTransactionReq rebuild(
          void Function(UpdateFinancialTrackerTransactionReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateFinancialTrackerTransactionReqBuilder toBuilder() =>
      new UpdateFinancialTrackerTransactionReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateFinancialTrackerTransactionReq &&
        categoryId == other.categoryId &&
        amount == other.amount &&
        transactionType == other.transactionType &&
        description == other.description &&
        transactionDate == other.transactionDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateFinancialTrackerTransactionReq')
          ..add('categoryId', categoryId)
          ..add('amount', amount)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate))
        .toString();
  }
}

class UpdateFinancialTrackerTransactionReqBuilder
    implements
        Builder<UpdateFinancialTrackerTransactionReq,
            UpdateFinancialTrackerTransactionReqBuilder> {
  _$UpdateFinancialTrackerTransactionReq? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _transactionType;
  String? get transactionType => _$this._transactionType;
  set transactionType(String? transactionType) =>
      _$this._transactionType = transactionType;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  UpdateFinancialTrackerTransactionReqBuilder() {
    UpdateFinancialTrackerTransactionReq._defaults(this);
  }

  UpdateFinancialTrackerTransactionReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _amount = $v.amount;
      _transactionType = $v.transactionType;
      _description = $v.description;
      _transactionDate = $v.transactionDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateFinancialTrackerTransactionReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateFinancialTrackerTransactionReq;
  }

  @override
  void update(
      void Function(UpdateFinancialTrackerTransactionReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateFinancialTrackerTransactionReq build() => _build();

  _$UpdateFinancialTrackerTransactionReq _build() {
    final _$result = _$v ??
        new _$UpdateFinancialTrackerTransactionReq._(
            categoryId: categoryId,
            amount: amount,
            transactionType: transactionType,
            description: description,
            transactionDate: transactionDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
