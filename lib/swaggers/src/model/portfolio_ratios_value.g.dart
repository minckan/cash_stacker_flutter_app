// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_ratios_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PortfolioRatiosValue extends PortfolioRatiosValue {
  @override
  final num? totalAssets;
  @override
  final String? assetTypeName;

  factory _$PortfolioRatiosValue(
          [void Function(PortfolioRatiosValueBuilder)? updates]) =>
      (new PortfolioRatiosValueBuilder()..update(updates))._build();

  _$PortfolioRatiosValue._({this.totalAssets, this.assetTypeName}) : super._();

  @override
  PortfolioRatiosValue rebuild(
          void Function(PortfolioRatiosValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PortfolioRatiosValueBuilder toBuilder() =>
      new PortfolioRatiosValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PortfolioRatiosValue &&
        totalAssets == other.totalAssets &&
        assetTypeName == other.assetTypeName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalAssets.hashCode);
    _$hash = $jc(_$hash, assetTypeName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PortfolioRatiosValue')
          ..add('totalAssets', totalAssets)
          ..add('assetTypeName', assetTypeName))
        .toString();
  }
}

class PortfolioRatiosValueBuilder
    implements Builder<PortfolioRatiosValue, PortfolioRatiosValueBuilder> {
  _$PortfolioRatiosValue? _$v;

  num? _totalAssets;
  num? get totalAssets => _$this._totalAssets;
  set totalAssets(num? totalAssets) => _$this._totalAssets = totalAssets;

  String? _assetTypeName;
  String? get assetTypeName => _$this._assetTypeName;
  set assetTypeName(String? assetTypeName) =>
      _$this._assetTypeName = assetTypeName;

  PortfolioRatiosValueBuilder() {
    PortfolioRatiosValue._defaults(this);
  }

  PortfolioRatiosValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalAssets = $v.totalAssets;
      _assetTypeName = $v.assetTypeName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PortfolioRatiosValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PortfolioRatiosValue;
  }

  @override
  void update(void Function(PortfolioRatiosValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PortfolioRatiosValue build() => _build();

  _$PortfolioRatiosValue _build() {
    final _$result = _$v ??
        new _$PortfolioRatiosValue._(
            totalAssets: totalAssets, assetTypeName: assetTypeName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
