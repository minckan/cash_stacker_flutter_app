// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_budget_active_get200_response_expendable_budget.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget
    extends WorkspaceIdBudgetActiveGet200ResponseExpendableBudget {
  @override
  final num? expendableBudget;
  @override
  final num? percentage;

  factory _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget(
          [void Function(
                  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder)?
              updates]) =>
      (new WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder()
            ..update(updates))
          ._build();

  _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget._(
      {this.expendableBudget, this.percentage})
      : super._();

  @override
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudget rebuild(
          void Function(
                  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder toBuilder() =>
      new WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdBudgetActiveGet200ResponseExpendableBudget &&
        expendableBudget == other.expendableBudget &&
        percentage == other.percentage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expendableBudget.hashCode);
    _$hash = $jc(_$hash, percentage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdBudgetActiveGet200ResponseExpendableBudget')
          ..add('expendableBudget', expendableBudget)
          ..add('percentage', percentage))
        .toString();
  }
}

class WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder
    implements
        Builder<WorkspaceIdBudgetActiveGet200ResponseExpendableBudget,
            WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder> {
  _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget? _$v;

  num? _expendableBudget;
  num? get expendableBudget => _$this._expendableBudget;
  set expendableBudget(num? expendableBudget) =>
      _$this._expendableBudget = expendableBudget;

  num? _percentage;
  num? get percentage => _$this._percentage;
  set percentage(num? percentage) => _$this._percentage = percentage;

  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder() {
    WorkspaceIdBudgetActiveGet200ResponseExpendableBudget._defaults(this);
  }

  WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expendableBudget = $v.expendableBudget;
      _percentage = $v.percentage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdBudgetActiveGet200ResponseExpendableBudget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget;
  }

  @override
  void update(
      void Function(
              WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudget build() => _build();

  _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget _build() {
    final _$result = _$v ??
        new _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget._(
            expendableBudget: expendableBudget, percentage: percentage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
