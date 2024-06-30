// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_budget_active_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdBudgetActiveGet200Response
    extends WorkspaceIdBudgetActiveGet200Response {
  @override
  final Budget? budget;
  @override
  final WorkspaceIdBudgetActiveGet200ResponseExpendableBudget? expendableBudget;

  factory _$WorkspaceIdBudgetActiveGet200Response(
          [void Function(WorkspaceIdBudgetActiveGet200ResponseBuilder)?
              updates]) =>
      (new WorkspaceIdBudgetActiveGet200ResponseBuilder()..update(updates))
          ._build();

  _$WorkspaceIdBudgetActiveGet200Response._(
      {this.budget, this.expendableBudget})
      : super._();

  @override
  WorkspaceIdBudgetActiveGet200Response rebuild(
          void Function(WorkspaceIdBudgetActiveGet200ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdBudgetActiveGet200ResponseBuilder toBuilder() =>
      new WorkspaceIdBudgetActiveGet200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdBudgetActiveGet200Response &&
        budget == other.budget &&
        expendableBudget == other.expendableBudget;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, budget.hashCode);
    _$hash = $jc(_$hash, expendableBudget.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdBudgetActiveGet200Response')
          ..add('budget', budget)
          ..add('expendableBudget', expendableBudget))
        .toString();
  }
}

class WorkspaceIdBudgetActiveGet200ResponseBuilder
    implements
        Builder<WorkspaceIdBudgetActiveGet200Response,
            WorkspaceIdBudgetActiveGet200ResponseBuilder> {
  _$WorkspaceIdBudgetActiveGet200Response? _$v;

  BudgetBuilder? _budget;
  BudgetBuilder get budget => _$this._budget ??= new BudgetBuilder();
  set budget(BudgetBuilder? budget) => _$this._budget = budget;

  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder?
      _expendableBudget;
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder
      get expendableBudget => _$this._expendableBudget ??=
          new WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder();
  set expendableBudget(
          WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder?
              expendableBudget) =>
      _$this._expendableBudget = expendableBudget;

  WorkspaceIdBudgetActiveGet200ResponseBuilder() {
    WorkspaceIdBudgetActiveGet200Response._defaults(this);
  }

  WorkspaceIdBudgetActiveGet200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budget = $v.budget?.toBuilder();
      _expendableBudget = $v.expendableBudget?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdBudgetActiveGet200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdBudgetActiveGet200Response;
  }

  @override
  void update(
      void Function(WorkspaceIdBudgetActiveGet200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdBudgetActiveGet200Response build() => _build();

  _$WorkspaceIdBudgetActiveGet200Response _build() {
    _$WorkspaceIdBudgetActiveGet200Response _$result;
    try {
      _$result = _$v ??
          new _$WorkspaceIdBudgetActiveGet200Response._(
              budget: _budget?.build(),
              expendableBudget: _expendableBudget?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'budget';
        _budget?.build();
        _$failedField = 'expendableBudget';
        _expendableBudget?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WorkspaceIdBudgetActiveGet200Response',
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
