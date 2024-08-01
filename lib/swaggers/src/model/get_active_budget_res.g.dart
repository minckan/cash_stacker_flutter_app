// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_active_budget_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetActiveBudgetRes extends GetActiveBudgetRes {
  @override
  final Budget? budget;
  @override
  final ExpendableBudget? expendableBudget;

  factory _$GetActiveBudgetRes(
          [void Function(GetActiveBudgetResBuilder)? updates]) =>
      (new GetActiveBudgetResBuilder()..update(updates))._build();

  _$GetActiveBudgetRes._({this.budget, this.expendableBudget}) : super._();

  @override
  GetActiveBudgetRes rebuild(
          void Function(GetActiveBudgetResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetActiveBudgetResBuilder toBuilder() =>
      new GetActiveBudgetResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetActiveBudgetRes &&
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
    return (newBuiltValueToStringHelper(r'GetActiveBudgetRes')
          ..add('budget', budget)
          ..add('expendableBudget', expendableBudget))
        .toString();
  }
}

class GetActiveBudgetResBuilder
    implements Builder<GetActiveBudgetRes, GetActiveBudgetResBuilder> {
  _$GetActiveBudgetRes? _$v;

  BudgetBuilder? _budget;
  BudgetBuilder get budget => _$this._budget ??= new BudgetBuilder();
  set budget(BudgetBuilder? budget) => _$this._budget = budget;

  ExpendableBudgetBuilder? _expendableBudget;
  ExpendableBudgetBuilder get expendableBudget =>
      _$this._expendableBudget ??= new ExpendableBudgetBuilder();
  set expendableBudget(ExpendableBudgetBuilder? expendableBudget) =>
      _$this._expendableBudget = expendableBudget;

  GetActiveBudgetResBuilder() {
    GetActiveBudgetRes._defaults(this);
  }

  GetActiveBudgetResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budget = $v.budget?.toBuilder();
      _expendableBudget = $v.expendableBudget?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetActiveBudgetRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetActiveBudgetRes;
  }

  @override
  void update(void Function(GetActiveBudgetResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetActiveBudgetRes build() => _build();

  _$GetActiveBudgetRes _build() {
    _$GetActiveBudgetRes _$result;
    try {
      _$result = _$v ??
          new _$GetActiveBudgetRes._(
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
            r'GetActiveBudgetRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
