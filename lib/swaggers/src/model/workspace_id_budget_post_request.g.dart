// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_budget_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdBudgetPostRequest extends WorkspaceIdBudgetPostRequest {
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? amount;
  @override
  final bool? isActive;

  factory _$WorkspaceIdBudgetPostRequest(
          [void Function(WorkspaceIdBudgetPostRequestBuilder)? updates]) =>
      (new WorkspaceIdBudgetPostRequestBuilder()..update(updates))._build();

  _$WorkspaceIdBudgetPostRequest._(
      {this.startDate, this.endDate, this.amount, this.isActive})
      : super._();

  @override
  WorkspaceIdBudgetPostRequest rebuild(
          void Function(WorkspaceIdBudgetPostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdBudgetPostRequestBuilder toBuilder() =>
      new WorkspaceIdBudgetPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdBudgetPostRequest &&
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
    return (newBuiltValueToStringHelper(r'WorkspaceIdBudgetPostRequest')
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('amount', amount)
          ..add('isActive', isActive))
        .toString();
  }
}

class WorkspaceIdBudgetPostRequestBuilder
    implements
        Builder<WorkspaceIdBudgetPostRequest,
            WorkspaceIdBudgetPostRequestBuilder> {
  _$WorkspaceIdBudgetPostRequest? _$v;

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

  WorkspaceIdBudgetPostRequestBuilder() {
    WorkspaceIdBudgetPostRequest._defaults(this);
  }

  WorkspaceIdBudgetPostRequestBuilder get _$this {
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
  void replace(WorkspaceIdBudgetPostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdBudgetPostRequest;
  }

  @override
  void update(void Function(WorkspaceIdBudgetPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdBudgetPostRequest build() => _build();

  _$WorkspaceIdBudgetPostRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdBudgetPostRequest._(
            startDate: startDate,
            endDate: endDate,
            amount: amount,
            isActive: isActive);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
