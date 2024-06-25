// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exchange_rates_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiExchangeRatesGet200Response extends ApiExchangeRatesGet200Response {
  @override
  final BuiltMap<String, num>? rates;
  @override
  final String? base_;
  @override
  final Date? date;

  factory _$ApiExchangeRatesGet200Response(
          [void Function(ApiExchangeRatesGet200ResponseBuilder)? updates]) =>
      (new ApiExchangeRatesGet200ResponseBuilder()..update(updates))._build();

  _$ApiExchangeRatesGet200Response._({this.rates, this.base_, this.date})
      : super._();

  @override
  ApiExchangeRatesGet200Response rebuild(
          void Function(ApiExchangeRatesGet200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiExchangeRatesGet200ResponseBuilder toBuilder() =>
      new ApiExchangeRatesGet200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiExchangeRatesGet200Response &&
        rates == other.rates &&
        base_ == other.base_ &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rates.hashCode);
    _$hash = $jc(_$hash, base_.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiExchangeRatesGet200Response')
          ..add('rates', rates)
          ..add('base_', base_)
          ..add('date', date))
        .toString();
  }
}

class ApiExchangeRatesGet200ResponseBuilder
    implements
        Builder<ApiExchangeRatesGet200Response,
            ApiExchangeRatesGet200ResponseBuilder> {
  _$ApiExchangeRatesGet200Response? _$v;

  MapBuilder<String, num>? _rates;
  MapBuilder<String, num> get rates =>
      _$this._rates ??= new MapBuilder<String, num>();
  set rates(MapBuilder<String, num>? rates) => _$this._rates = rates;

  String? _base_;
  String? get base_ => _$this._base_;
  set base_(String? base_) => _$this._base_ = base_;

  Date? _date;
  Date? get date => _$this._date;
  set date(Date? date) => _$this._date = date;

  ApiExchangeRatesGet200ResponseBuilder() {
    ApiExchangeRatesGet200Response._defaults(this);
  }

  ApiExchangeRatesGet200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rates = $v.rates?.toBuilder();
      _base_ = $v.base_;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiExchangeRatesGet200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiExchangeRatesGet200Response;
  }

  @override
  void update(void Function(ApiExchangeRatesGet200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiExchangeRatesGet200Response build() => _build();

  _$ApiExchangeRatesGet200Response _build() {
    _$ApiExchangeRatesGet200Response _$result;
    try {
      _$result = _$v ??
          new _$ApiExchangeRatesGet200Response._(
              rates: _rates?.build(), base_: base_, date: date);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rates';
        _rates?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiExchangeRatesGet200Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
