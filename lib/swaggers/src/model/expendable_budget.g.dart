// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expendable_budget.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExpendableBudget extends ExpendableBudget {
  @override
  final num? expendableBudget;
  @override
  final num? percentage;

  factory _$ExpendableBudget(
          [void Function(ExpendableBudgetBuilder)? updates]) =>
      (new ExpendableBudgetBuilder()..update(updates))._build();

  _$ExpendableBudget._({this.expendableBudget, this.percentage}) : super._();

  @override
  ExpendableBudget rebuild(void Function(ExpendableBudgetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpendableBudgetBuilder toBuilder() =>
      new ExpendableBudgetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpendableBudget &&
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
    return (newBuiltValueToStringHelper(r'ExpendableBudget')
          ..add('expendableBudget', expendableBudget)
          ..add('percentage', percentage))
        .toString();
  }
}

class ExpendableBudgetBuilder
    implements Builder<ExpendableBudget, ExpendableBudgetBuilder> {
  _$ExpendableBudget? _$v;

  num? _expendableBudget;
  num? get expendableBudget => _$this._expendableBudget;
  set expendableBudget(num? expendableBudget) =>
      _$this._expendableBudget = expendableBudget;

  num? _percentage;
  num? get percentage => _$this._percentage;
  set percentage(num? percentage) => _$this._percentage = percentage;

  ExpendableBudgetBuilder() {
    ExpendableBudget._defaults(this);
  }

  ExpendableBudgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expendableBudget = $v.expendableBudget;
      _percentage = $v.percentage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExpendableBudget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpendableBudget;
  }

  @override
  void update(void Function(ExpendableBudgetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpendableBudget build() => _build();

  _$ExpendableBudget _build() {
    final _$result = _$v ??
        new _$ExpendableBudget._(
            expendableBudget: expendableBudget, percentage: percentage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
