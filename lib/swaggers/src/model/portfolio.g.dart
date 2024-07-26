// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Portfolio extends Portfolio {
  @override
  final num? totalAmount;
  @override
  final BuiltMap<String, PortfolioRatiosValue>? ratios;
  @override
  final BuiltList<AssetInfo>? rows;

  factory _$Portfolio([void Function(PortfolioBuilder)? updates]) =>
      (new PortfolioBuilder()..update(updates))._build();

  _$Portfolio._({this.totalAmount, this.ratios, this.rows}) : super._();

  @override
  Portfolio rebuild(void Function(PortfolioBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PortfolioBuilder toBuilder() => new PortfolioBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Portfolio &&
        totalAmount == other.totalAmount &&
        ratios == other.ratios &&
        rows == other.rows;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalAmount.hashCode);
    _$hash = $jc(_$hash, ratios.hashCode);
    _$hash = $jc(_$hash, rows.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Portfolio')
          ..add('totalAmount', totalAmount)
          ..add('ratios', ratios)
          ..add('rows', rows))
        .toString();
  }
}

class PortfolioBuilder implements Builder<Portfolio, PortfolioBuilder> {
  _$Portfolio? _$v;

  num? _totalAmount;
  num? get totalAmount => _$this._totalAmount;
  set totalAmount(num? totalAmount) => _$this._totalAmount = totalAmount;

  MapBuilder<String, PortfolioRatiosValue>? _ratios;
  MapBuilder<String, PortfolioRatiosValue> get ratios =>
      _$this._ratios ??= new MapBuilder<String, PortfolioRatiosValue>();
  set ratios(MapBuilder<String, PortfolioRatiosValue>? ratios) =>
      _$this._ratios = ratios;

  ListBuilder<AssetInfo>? _rows;
  ListBuilder<AssetInfo> get rows =>
      _$this._rows ??= new ListBuilder<AssetInfo>();
  set rows(ListBuilder<AssetInfo>? rows) => _$this._rows = rows;

  PortfolioBuilder() {
    Portfolio._defaults(this);
  }

  PortfolioBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalAmount = $v.totalAmount;
      _ratios = $v.ratios?.toBuilder();
      _rows = $v.rows?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Portfolio other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Portfolio;
  }

  @override
  void update(void Function(PortfolioBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Portfolio build() => _build();

  _$Portfolio _build() {
    _$Portfolio _$result;
    try {
      _$result = _$v ??
          new _$Portfolio._(
              totalAmount: totalAmount,
              ratios: _ratios?.build(),
              rows: _rows?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ratios';
        _ratios?.build();
        _$failedField = 'rows';
        _rows?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Portfolio', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
