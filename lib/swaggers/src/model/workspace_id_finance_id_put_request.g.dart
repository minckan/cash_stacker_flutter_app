// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_finance_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdFinanceIdPutRequest extends WorkspaceIdFinanceIdPutRequest {
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

  factory _$WorkspaceIdFinanceIdPutRequest(
          [void Function(WorkspaceIdFinanceIdPutRequestBuilder)? updates]) =>
      (new WorkspaceIdFinanceIdPutRequestBuilder()..update(updates))._build();

  _$WorkspaceIdFinanceIdPutRequest._(
      {this.categoryId,
      this.amount,
      this.transactionType,
      this.description,
      this.transactionDate})
      : super._();

  @override
  WorkspaceIdFinanceIdPutRequest rebuild(
          void Function(WorkspaceIdFinanceIdPutRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdFinanceIdPutRequestBuilder toBuilder() =>
      new WorkspaceIdFinanceIdPutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdFinanceIdPutRequest &&
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
    return (newBuiltValueToStringHelper(r'WorkspaceIdFinanceIdPutRequest')
          ..add('categoryId', categoryId)
          ..add('amount', amount)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate))
        .toString();
  }
}

class WorkspaceIdFinanceIdPutRequestBuilder
    implements
        Builder<WorkspaceIdFinanceIdPutRequest,
            WorkspaceIdFinanceIdPutRequestBuilder> {
  _$WorkspaceIdFinanceIdPutRequest? _$v;

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

  WorkspaceIdFinanceIdPutRequestBuilder() {
    WorkspaceIdFinanceIdPutRequest._defaults(this);
  }

  WorkspaceIdFinanceIdPutRequestBuilder get _$this {
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
  void replace(WorkspaceIdFinanceIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdFinanceIdPutRequest;
  }

  @override
  void update(void Function(WorkspaceIdFinanceIdPutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdFinanceIdPutRequest build() => _build();

  _$WorkspaceIdFinanceIdPutRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdFinanceIdPutRequest._(
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
