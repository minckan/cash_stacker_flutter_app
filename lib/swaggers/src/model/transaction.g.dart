// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Transaction extends Transaction {
  @override
  final int? transactionId;
  @override
  final TransactionCategory? category;
  @override
  final String? workspaceId;
  @override
  final double? amount;
  @override
  final String? transactionType;
  @override
  final String? paymentMethod;
  @override
  final String? description;
  @override
  final DateTime? transactionDate;
  @override
  final DateTime? createdAt;

  factory _$Transaction([void Function(TransactionBuilder)? updates]) =>
      (new TransactionBuilder()..update(updates))._build();

  _$Transaction._(
      {this.transactionId,
      this.category,
      this.workspaceId,
      this.amount,
      this.transactionType,
      this.paymentMethod,
      this.description,
      this.transactionDate,
      this.createdAt})
      : super._();

  @override
  Transaction rebuild(void Function(TransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionBuilder toBuilder() => new TransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
        transactionId == other.transactionId &&
        category == other.category &&
        workspaceId == other.workspaceId &&
        amount == other.amount &&
        transactionType == other.transactionType &&
        paymentMethod == other.paymentMethod &&
        description == other.description &&
        transactionDate == other.transactionDate &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Transaction')
          ..add('transactionId', transactionId)
          ..add('category', category)
          ..add('workspaceId', workspaceId)
          ..add('amount', amount)
          ..add('transactionType', transactionType)
          ..add('paymentMethod', paymentMethod)
          ..add('description', description)
          ..add('transactionDate', transactionDate)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class TransactionBuilder implements Builder<Transaction, TransactionBuilder> {
  _$Transaction? _$v;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  TransactionCategoryBuilder? _category;
  TransactionCategoryBuilder get category =>
      _$this._category ??= new TransactionCategoryBuilder();
  set category(TransactionCategoryBuilder? category) =>
      _$this._category = category;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _transactionType;
  String? get transactionType => _$this._transactionType;
  set transactionType(String? transactionType) =>
      _$this._transactionType = transactionType;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  TransactionBuilder() {
    Transaction._defaults(this);
  }

  TransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _category = $v.category?.toBuilder();
      _workspaceId = $v.workspaceId;
      _amount = $v.amount;
      _transactionType = $v.transactionType;
      _paymentMethod = $v.paymentMethod;
      _description = $v.description;
      _transactionDate = $v.transactionDate;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transaction build() => _build();

  _$Transaction _build() {
    _$Transaction _$result;
    try {
      _$result = _$v ??
          new _$Transaction._(
              transactionId: transactionId,
              category: _category?.build(),
              workspaceId: workspaceId,
              amount: amount,
              transactionType: transactionType,
              paymentMethod: paymentMethod,
              description: description,
              transactionDate: transactionDate,
              createdAt: createdAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Transaction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
