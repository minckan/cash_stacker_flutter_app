// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_assets_monthly_trend_get200_response_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner
    extends WorkspaceIdAssetsMonthlyTrendGet200ResponseInner {
  @override
  final Date? month;
  @override
  final double? totalBalance;

  factory _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner(
          [void Function(
                  WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder)?
              updates]) =>
      (new WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder()
            ..update(updates))
          ._build();

  _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner._(
      {this.month, this.totalBalance})
      : super._();

  @override
  WorkspaceIdAssetsMonthlyTrendGet200ResponseInner rebuild(
          void Function(WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder toBuilder() =>
      new WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetsMonthlyTrendGet200ResponseInner &&
        month == other.month &&
        totalBalance == other.totalBalance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, totalBalance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdAssetsMonthlyTrendGet200ResponseInner')
          ..add('month', month)
          ..add('totalBalance', totalBalance))
        .toString();
  }
}

class WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder
    implements
        Builder<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner,
            WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder> {
  _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner? _$v;

  Date? _month;
  Date? get month => _$this._month;
  set month(Date? month) => _$this._month = month;

  double? _totalBalance;
  double? get totalBalance => _$this._totalBalance;
  set totalBalance(double? totalBalance) => _$this._totalBalance = totalBalance;

  WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder() {
    WorkspaceIdAssetsMonthlyTrendGet200ResponseInner._defaults(this);
  }

  WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _month = $v.month;
      _totalBalance = $v.totalBalance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetsMonthlyTrendGet200ResponseInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner;
  }

  @override
  void update(
      void Function(WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetsMonthlyTrendGet200ResponseInner build() => _build();

  _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner _build() {
    final _$result = _$v ??
        new _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner._(
            month: month, totalBalance: totalBalance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
