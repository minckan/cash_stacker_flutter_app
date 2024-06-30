// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ExchangeRateResponseRESULTEnum _$exchangeRateResponseRESULTEnum_number1 =
    const ExchangeRateResponseRESULTEnum._('number1');
const ExchangeRateResponseRESULTEnum _$exchangeRateResponseRESULTEnum_number2 =
    const ExchangeRateResponseRESULTEnum._('number2');
const ExchangeRateResponseRESULTEnum _$exchangeRateResponseRESULTEnum_number3 =
    const ExchangeRateResponseRESULTEnum._('number3');
const ExchangeRateResponseRESULTEnum _$exchangeRateResponseRESULTEnum_number4 =
    const ExchangeRateResponseRESULTEnum._('number4');

ExchangeRateResponseRESULTEnum _$exchangeRateResponseRESULTEnumValueOf(
    String name) {
  switch (name) {
    case 'number1':
      return _$exchangeRateResponseRESULTEnum_number1;
    case 'number2':
      return _$exchangeRateResponseRESULTEnum_number2;
    case 'number3':
      return _$exchangeRateResponseRESULTEnum_number3;
    case 'number4':
      return _$exchangeRateResponseRESULTEnum_number4;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ExchangeRateResponseRESULTEnum>
    _$exchangeRateResponseRESULTEnumValues = new BuiltSet<
        ExchangeRateResponseRESULTEnum>(const <ExchangeRateResponseRESULTEnum>[
  _$exchangeRateResponseRESULTEnum_number1,
  _$exchangeRateResponseRESULTEnum_number2,
  _$exchangeRateResponseRESULTEnum_number3,
  _$exchangeRateResponseRESULTEnum_number4,
]);

Serializer<ExchangeRateResponseRESULTEnum>
    _$exchangeRateResponseRESULTEnumSerializer =
    new _$ExchangeRateResponseRESULTEnumSerializer();

class _$ExchangeRateResponseRESULTEnumSerializer
    implements PrimitiveSerializer<ExchangeRateResponseRESULTEnum> {
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
  final Iterable<Type> types = const <Type>[ExchangeRateResponseRESULTEnum];
  @override
  final String wireName = 'ExchangeRateResponseRESULTEnum';

  @override
  Object serialize(
          Serializers serializers, ExchangeRateResponseRESULTEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ExchangeRateResponseRESULTEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ExchangeRateResponseRESULTEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ExchangeRateResponse extends ExchangeRateResponse {
  @override
  final ExchangeRateResponseRESULTEnum? RESULT;
  @override
  final String? CUR_UNIT;
  @override
  final String? CUR_NM;
  @override
  final String? TTB;
  @override
  final String? TTS;
  @override
  final String? DEAL_BAS_R;
  @override
  final String? BKPR;
  @override
  final String? YY_EFEE_R;
  @override
  final String? TEN_DD_EFEE_R;
  @override
  final String? KFTC_DEAL_BAS_R;
  @override
  final String? KFTC_BKPR;

  factory _$ExchangeRateResponse(
          [void Function(ExchangeRateResponseBuilder)? updates]) =>
      (new ExchangeRateResponseBuilder()..update(updates))._build();

  _$ExchangeRateResponse._(
      {this.RESULT,
      this.CUR_UNIT,
      this.CUR_NM,
      this.TTB,
      this.TTS,
      this.DEAL_BAS_R,
      this.BKPR,
      this.YY_EFEE_R,
      this.TEN_DD_EFEE_R,
      this.KFTC_DEAL_BAS_R,
      this.KFTC_BKPR})
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
        RESULT == other.RESULT &&
        CUR_UNIT == other.CUR_UNIT &&
        CUR_NM == other.CUR_NM &&
        TTB == other.TTB &&
        TTS == other.TTS &&
        DEAL_BAS_R == other.DEAL_BAS_R &&
        BKPR == other.BKPR &&
        YY_EFEE_R == other.YY_EFEE_R &&
        TEN_DD_EFEE_R == other.TEN_DD_EFEE_R &&
        KFTC_DEAL_BAS_R == other.KFTC_DEAL_BAS_R &&
        KFTC_BKPR == other.KFTC_BKPR;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, RESULT.hashCode);
    _$hash = $jc(_$hash, CUR_UNIT.hashCode);
    _$hash = $jc(_$hash, CUR_NM.hashCode);
    _$hash = $jc(_$hash, TTB.hashCode);
    _$hash = $jc(_$hash, TTS.hashCode);
    _$hash = $jc(_$hash, DEAL_BAS_R.hashCode);
    _$hash = $jc(_$hash, BKPR.hashCode);
    _$hash = $jc(_$hash, YY_EFEE_R.hashCode);
    _$hash = $jc(_$hash, TEN_DD_EFEE_R.hashCode);
    _$hash = $jc(_$hash, KFTC_DEAL_BAS_R.hashCode);
    _$hash = $jc(_$hash, KFTC_BKPR.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExchangeRateResponse')
          ..add('RESULT', RESULT)
          ..add('CUR_UNIT', CUR_UNIT)
          ..add('CUR_NM', CUR_NM)
          ..add('TTB', TTB)
          ..add('TTS', TTS)
          ..add('DEAL_BAS_R', DEAL_BAS_R)
          ..add('BKPR', BKPR)
          ..add('YY_EFEE_R', YY_EFEE_R)
          ..add('TEN_DD_EFEE_R', TEN_DD_EFEE_R)
          ..add('KFTC_DEAL_BAS_R', KFTC_DEAL_BAS_R)
          ..add('KFTC_BKPR', KFTC_BKPR))
        .toString();
  }
}

class ExchangeRateResponseBuilder
    implements Builder<ExchangeRateResponse, ExchangeRateResponseBuilder> {
  _$ExchangeRateResponse? _$v;

  ExchangeRateResponseRESULTEnum? _RESULT;
  ExchangeRateResponseRESULTEnum? get RESULT => _$this._RESULT;
  set RESULT(ExchangeRateResponseRESULTEnum? RESULT) => _$this._RESULT = RESULT;

  String? _CUR_UNIT;
  String? get CUR_UNIT => _$this._CUR_UNIT;
  set CUR_UNIT(String? CUR_UNIT) => _$this._CUR_UNIT = CUR_UNIT;

  String? _CUR_NM;
  String? get CUR_NM => _$this._CUR_NM;
  set CUR_NM(String? CUR_NM) => _$this._CUR_NM = CUR_NM;

  String? _TTB;
  String? get TTB => _$this._TTB;
  set TTB(String? TTB) => _$this._TTB = TTB;

  String? _TTS;
  String? get TTS => _$this._TTS;
  set TTS(String? TTS) => _$this._TTS = TTS;

  String? _DEAL_BAS_R;
  String? get DEAL_BAS_R => _$this._DEAL_BAS_R;
  set DEAL_BAS_R(String? DEAL_BAS_R) => _$this._DEAL_BAS_R = DEAL_BAS_R;

  String? _BKPR;
  String? get BKPR => _$this._BKPR;
  set BKPR(String? BKPR) => _$this._BKPR = BKPR;

  String? _YY_EFEE_R;
  String? get YY_EFEE_R => _$this._YY_EFEE_R;
  set YY_EFEE_R(String? YY_EFEE_R) => _$this._YY_EFEE_R = YY_EFEE_R;

  String? _TEN_DD_EFEE_R;
  String? get TEN_DD_EFEE_R => _$this._TEN_DD_EFEE_R;
  set TEN_DD_EFEE_R(String? TEN_DD_EFEE_R) =>
      _$this._TEN_DD_EFEE_R = TEN_DD_EFEE_R;

  String? _KFTC_DEAL_BAS_R;
  String? get KFTC_DEAL_BAS_R => _$this._KFTC_DEAL_BAS_R;
  set KFTC_DEAL_BAS_R(String? KFTC_DEAL_BAS_R) =>
      _$this._KFTC_DEAL_BAS_R = KFTC_DEAL_BAS_R;

  String? _KFTC_BKPR;
  String? get KFTC_BKPR => _$this._KFTC_BKPR;
  set KFTC_BKPR(String? KFTC_BKPR) => _$this._KFTC_BKPR = KFTC_BKPR;

  ExchangeRateResponseBuilder() {
    ExchangeRateResponse._defaults(this);
  }

  ExchangeRateResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _RESULT = $v.RESULT;
      _CUR_UNIT = $v.CUR_UNIT;
      _CUR_NM = $v.CUR_NM;
      _TTB = $v.TTB;
      _TTS = $v.TTS;
      _DEAL_BAS_R = $v.DEAL_BAS_R;
      _BKPR = $v.BKPR;
      _YY_EFEE_R = $v.YY_EFEE_R;
      _TEN_DD_EFEE_R = $v.TEN_DD_EFEE_R;
      _KFTC_DEAL_BAS_R = $v.KFTC_DEAL_BAS_R;
      _KFTC_BKPR = $v.KFTC_BKPR;
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
            RESULT: RESULT,
            CUR_UNIT: CUR_UNIT,
            CUR_NM: CUR_NM,
            TTB: TTB,
            TTS: TTS,
            DEAL_BAS_R: DEAL_BAS_R,
            BKPR: BKPR,
            YY_EFEE_R: YY_EFEE_R,
            TEN_DD_EFEE_R: TEN_DD_EFEE_R,
            KFTC_DEAL_BAS_R: KFTC_DEAL_BAS_R,
            KFTC_BKPR: KFTC_BKPR);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
