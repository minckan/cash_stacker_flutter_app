// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_monthly_asset_trend200_response_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetMonthlyAssetTrend200ResponseInner
    extends GetMonthlyAssetTrend200ResponseInner {
  @override
  final String? month;
  @override
  final double? totalBalance;

  factory _$GetMonthlyAssetTrend200ResponseInner(
          [void Function(GetMonthlyAssetTrend200ResponseInnerBuilder)?
              updates]) =>
      (new GetMonthlyAssetTrend200ResponseInnerBuilder()..update(updates))
          ._build();

  _$GetMonthlyAssetTrend200ResponseInner._({this.month, this.totalBalance})
      : super._();

  @override
  GetMonthlyAssetTrend200ResponseInner rebuild(
          void Function(GetMonthlyAssetTrend200ResponseInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMonthlyAssetTrend200ResponseInnerBuilder toBuilder() =>
      new GetMonthlyAssetTrend200ResponseInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMonthlyAssetTrend200ResponseInner &&
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
    return (newBuiltValueToStringHelper(r'GetMonthlyAssetTrend200ResponseInner')
          ..add('month', month)
          ..add('totalBalance', totalBalance))
        .toString();
  }
}

class GetMonthlyAssetTrend200ResponseInnerBuilder
    implements
        Builder<GetMonthlyAssetTrend200ResponseInner,
            GetMonthlyAssetTrend200ResponseInnerBuilder> {
  _$GetMonthlyAssetTrend200ResponseInner? _$v;

  String? _month;
  String? get month => _$this._month;
  set month(String? month) => _$this._month = month;

  double? _totalBalance;
  double? get totalBalance => _$this._totalBalance;
  set totalBalance(double? totalBalance) => _$this._totalBalance = totalBalance;

  GetMonthlyAssetTrend200ResponseInnerBuilder() {
    GetMonthlyAssetTrend200ResponseInner._defaults(this);
  }

  GetMonthlyAssetTrend200ResponseInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _month = $v.month;
      _totalBalance = $v.totalBalance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetMonthlyAssetTrend200ResponseInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMonthlyAssetTrend200ResponseInner;
  }

  @override
  void update(
      void Function(GetMonthlyAssetTrend200ResponseInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMonthlyAssetTrend200ResponseInner build() => _build();

  _$GetMonthlyAssetTrend200ResponseInner _build() {
    final _$result = _$v ??
        new _$GetMonthlyAssetTrend200ResponseInner._(
            month: month, totalBalance: totalBalance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
