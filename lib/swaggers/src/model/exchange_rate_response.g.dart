// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ExchangeRateResponseResultEnum _$exchangeRateResponseResultEnum_number1 =
    const ExchangeRateResponseResultEnum._('number1');
const ExchangeRateResponseResultEnum _$exchangeRateResponseResultEnum_number2 =
    const ExchangeRateResponseResultEnum._('number2');
const ExchangeRateResponseResultEnum _$exchangeRateResponseResultEnum_number3 =
    const ExchangeRateResponseResultEnum._('number3');
const ExchangeRateResponseResultEnum _$exchangeRateResponseResultEnum_number4 =
    const ExchangeRateResponseResultEnum._('number4');

ExchangeRateResponseResultEnum _$exchangeRateResponseResultEnumValueOf(
    String name) {
  switch (name) {
    case 'number1':
      return _$exchangeRateResponseResultEnum_number1;
    case 'number2':
      return _$exchangeRateResponseResultEnum_number2;
    case 'number3':
      return _$exchangeRateResponseResultEnum_number3;
    case 'number4':
      return _$exchangeRateResponseResultEnum_number4;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ExchangeRateResponseResultEnum>
    _$exchangeRateResponseResultEnumValues = new BuiltSet<
        ExchangeRateResponseResultEnum>(const <ExchangeRateResponseResultEnum>[
  _$exchangeRateResponseResultEnum_number1,
  _$exchangeRateResponseResultEnum_number2,
  _$exchangeRateResponseResultEnum_number3,
  _$exchangeRateResponseResultEnum_number4,
]);

Serializer<ExchangeRateResponseResultEnum>
    _$exchangeRateResponseResultEnumSerializer =
    new _$ExchangeRateResponseResultEnumSerializer();

class _$ExchangeRateResponseResultEnumSerializer
    implements PrimitiveSerializer<ExchangeRateResponseResultEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
    'number2': 2,
    'number3': 3,
    'number4': 4,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
    2: 'number2',
    3: 'number3',
    4: 'number4',
  };

  @override
  final Iterable<Type> types = const <Type>[ExchangeRateResponseResultEnum];
  @override
  final String wireName = 'ExchangeRateResponseResultEnum';

  @override
  Object serialize(
          Serializers serializers, ExchangeRateResponseResultEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ExchangeRateResponseResultEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ExchangeRateResponseResultEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ExchangeRateResponse extends ExchangeRateResponse {
  @override
  final ExchangeRateResponseResultEnum? result;
  @override
  final String? curUnit;
  @override
  final String? curNm;
  @override
  final String? ttb;
  @override
  final String? tts;
  @override
  final String? dealBasR;
  @override
  final String? bkpr;
  @override
  final String? yyEfeeR;
  @override
  final String? tenDdEfeeR;
  @override
  final String? kftcDealBasR;
  @override
  final String? kftcBkpr;

  factory _$ExchangeRateResponse(
          [void Function(ExchangeRateResponseBuilder)? updates]) =>
      (new ExchangeRateResponseBuilder()..update(updates))._build();

  _$ExchangeRateResponse._(
      {this.result,
      this.curUnit,
      this.curNm,
      this.ttb,
      this.tts,
      this.dealBasR,
      this.bkpr,
      this.yyEfeeR,
      this.tenDdEfeeR,
      this.kftcDealBasR,
      this.kftcBkpr})
      : super._();

  @override
  ExchangeRateResponse rebuild(
          void Function(ExchangeRateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExchangeRateResponseBuilder toBuilder() =>
      new ExchangeRateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExchangeRateResponse &&
        result == other.result &&
        curUnit == other.curUnit &&
        curNm == other.curNm &&
        ttb == other.ttb &&
        tts == other.tts &&
        dealBasR == other.dealBasR &&
        bkpr == other.bkpr &&
        yyEfeeR == other.yyEfeeR &&
        tenDdEfeeR == other.tenDdEfeeR &&
        kftcDealBasR == other.kftcDealBasR &&
        kftcBkpr == other.kftcBkpr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jc(_$hash, curUnit.hashCode);
    _$hash = $jc(_$hash, curNm.hashCode);
    _$hash = $jc(_$hash, ttb.hashCode);
    _$hash = $jc(_$hash, tts.hashCode);
    _$hash = $jc(_$hash, dealBasR.hashCode);
    _$hash = $jc(_$hash, bkpr.hashCode);
    _$hash = $jc(_$hash, yyEfeeR.hashCode);
    _$hash = $jc(_$hash, tenDdEfeeR.hashCode);
    _$hash = $jc(_$hash, kftcDealBasR.hashCode);
    _$hash = $jc(_$hash, kftcBkpr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExchangeRateResponse')
          ..add('result', result)
          ..add('curUnit', curUnit)
          ..add('curNm', curNm)
          ..add('ttb', ttb)
          ..add('tts', tts)
          ..add('dealBasR', dealBasR)
          ..add('bkpr', bkpr)
          ..add('yyEfeeR', yyEfeeR)
          ..add('tenDdEfeeR', tenDdEfeeR)
          ..add('kftcDealBasR', kftcDealBasR)
          ..add('kftcBkpr', kftcBkpr))
        .toString();
  }
}

class ExchangeRateResponseBuilder
    implements Builder<ExchangeRateResponse, ExchangeRateResponseBuilder> {
  _$ExchangeRateResponse? _$v;

  ExchangeRateResponseResultEnum? _result;
  ExchangeRateResponseResultEnum? get result => _$this._result;
  set result(ExchangeRateResponseResultEnum? result) => _$this._result = result;

  String? _curUnit;
  String? get curUnit => _$this._curUnit;
  set curUnit(String? curUnit) => _$this._curUnit = curUnit;

  String? _curNm;
  String? get curNm => _$this._curNm;
  set curNm(String? curNm) => _$this._curNm = curNm;

  String? _ttb;
  String? get ttb => _$this._ttb;
  set ttb(String? ttb) => _$this._ttb = ttb;

  String? _tts;
  String? get tts => _$this._tts;
  set tts(String? tts) => _$this._tts = tts;

  String? _dealBasR;
  String? get dealBasR => _$this._dealBasR;
  set dealBasR(String? dealBasR) => _$this._dealBasR = dealBasR;

  String? _bkpr;
  String? get bkpr => _$this._bkpr;
  set bkpr(String? bkpr) => _$this._bkpr = bkpr;

  String? _yyEfeeR;
  String? get yyEfeeR => _$this._yyEfeeR;
  set yyEfeeR(String? yyEfeeR) => _$this._yyEfeeR = yyEfeeR;

  String? _tenDdEfeeR;
  String? get tenDdEfeeR => _$this._tenDdEfeeR;
  set tenDdEfeeR(String? tenDdEfeeR) => _$this._tenDdEfeeR = tenDdEfeeR;

  String? _kftcDealBasR;
  String? get kftcDealBasR => _$this._kftcDealBasR;
  set kftcDealBasR(String? kftcDealBasR) => _$this._kftcDealBasR = kftcDealBasR;

  String? _kftcBkpr;
  String? get kftcBkpr => _$this._kftcBkpr;
  set kftcBkpr(String? kftcBkpr) => _$this._kftcBkpr = kftcBkpr;

  ExchangeRateResponseBuilder() {
    ExchangeRateResponse._defaults(this);
  }

  ExchangeRateResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result;
      _curUnit = $v.curUnit;
      _curNm = $v.curNm;
      _ttb = $v.ttb;
      _tts = $v.tts;
      _dealBasR = $v.dealBasR;
      _bkpr = $v.bkpr;
      _yyEfeeR = $v.yyEfeeR;
      _tenDdEfeeR = $v.tenDdEfeeR;
      _kftcDealBasR = $v.kftcDealBasR;
      _kftcBkpr = $v.kftcBkpr;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExchangeRateResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExchangeRateResponse;
  }

  @override
  void update(void Function(ExchangeRateResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExchangeRateResponse build() => _build();

  _$ExchangeRateResponse _build() {
    final _$result = _$v ??
        new _$ExchangeRateResponse._(
            result: result,
            curUnit: curUnit,
            curNm: curNm,
            ttb: ttb,
            tts: tts,
            dealBasR: dealBasR,
            bkpr: bkpr,
            yyEfeeR: yyEfeeR,
            tenDdEfeeR: tenDdEfeeR,
            kftcDealBasR: kftcDealBasR,
            kftcBkpr: kftcBkpr);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
