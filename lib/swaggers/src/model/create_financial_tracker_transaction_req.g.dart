// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_financial_tracker_transaction_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateFinancialTrackerTransactionReq
    extends CreateFinancialTrackerTransactionReq {
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
  @override
  final String? paymentMethod;

  factory _$CreateFinancialTrackerTransactionReq(
          [void Function(CreateFinancialTrackerTransactionReqBuilder)?
              updates]) =>
      (new CreateFinancialTrackerTransactionReqBuilder()..update(updates))
          ._build();

  _$CreateFinancialTrackerTransactionReq._(
      {this.categoryId,
      this.amount,
      this.transactionType,
      this.description,
      this.transactionDate,
      this.paymentMethod})
      : super._();

  @override
  CreateFinancialTrackerTransactionReq rebuild(
          void Function(CreateFinancialTrackerTransactionReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateFinancialTrackerTransactionReqBuilder toBuilder() =>
      new CreateFinancialTrackerTransactionReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateFinancialTrackerTransactionReq &&
        categoryId == other.categoryId &&
        amount == other.amount &&
        transactionType == other.transactionType &&
        description == other.description &&
        transactionDate == other.transactionDate &&
        paymentMethod == other.paymentMethod;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateFinancialTrackerTransactionReq')
          ..add('categoryId', categoryId)
          ..add('amount', amount)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate)
          ..add('paymentMethod', paymentMethod))
        .toString();
  }
}

class CreateFinancialTrackerTransactionReqBuilder
    implements
        Builder<CreateFinancialTrackerTransactionReq,
            CreateFinancialTrackerTransactionReqBuilder> {
  _$CreateFinancialTrackerTransactionReq? _$v;

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

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  CreateFinancialTrackerTransactionReqBuilder() {
    CreateFinancialTrackerTransactionReq._defaults(this);
  }

  CreateFinancialTrackerTransactionReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _amount = $v.amount;
      _transactionType = $v.transactionType;
      _description = $v.description;
      _transactionDate = $v.transactionDate;
      _paymentMethod = $v.paymentMethod;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateFinancialTrackerTransactionReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateFinancialTrackerTransactionReq;
  }

  @override
  void update(
      void Function(CreateFinancialTrackerTransactionReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateFinancialTrackerTransactionReq build() => _build();

  _$CreateFinancialTrackerTransactionReq _build() {
    final _$result = _$v ??
        new _$CreateFinancialTrackerTransactionReq._(
            categoryId: categoryId,
            amount: amount,
            transactionType: transactionType,
            description: description,
            transactionDate: transactionDate,
            paymentMethod: paymentMethod);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
