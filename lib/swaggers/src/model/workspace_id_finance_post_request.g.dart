// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_finance_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdFinancePostRequest extends WorkspaceIdFinancePostRequest {
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

  factory _$WorkspaceIdFinancePostRequest(
          [void Function(WorkspaceIdFinancePostRequestBuilder)? updates]) =>
      (new WorkspaceIdFinancePostRequestBuilder()..update(updates))._build();

  _$WorkspaceIdFinancePostRequest._(
      {this.categoryId,
      this.amount,
      this.transactionType,
      this.description,
      this.transactionDate,
      this.paymentMethod})
      : super._();

  @override
  WorkspaceIdFinancePostRequest rebuild(
          void Function(WorkspaceIdFinancePostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdFinancePostRequestBuilder toBuilder() =>
      new WorkspaceIdFinancePostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdFinancePostRequest &&
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
    return (newBuiltValueToStringHelper(r'WorkspaceIdFinancePostRequest')
          ..add('categoryId', categoryId)
          ..add('amount', amount)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate)
          ..add('paymentMethod', paymentMethod))
        .toString();
  }
}

class WorkspaceIdFinancePostRequestBuilder
    implements
        Builder<WorkspaceIdFinancePostRequest,
            WorkspaceIdFinancePostRequestBuilder> {
  _$WorkspaceIdFinancePostRequest? _$v;

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

  WorkspaceIdFinancePostRequestBuilder() {
    WorkspaceIdFinancePostRequest._defaults(this);
  }

  WorkspaceIdFinancePostRequestBuilder get _$this {
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
  void replace(WorkspaceIdFinancePostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdFinancePostRequest;
  }

  @override
  void update(void Function(WorkspaceIdFinancePostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdFinancePostRequest build() => _build();

  _$WorkspaceIdFinancePostRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdFinancePostRequest._(
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
