// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_assets_response_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllAssetsResponseType extends AllAssetsResponseType {
  @override
  final num? total;
  @override
  final BuiltList<AssetTransactionResponseType>? transaction;

  factory _$AllAssetsResponseType(
          [void Function(AllAssetsResponseTypeBuilder)? updates]) =>
      (new AllAssetsResponseTypeBuilder()..update(updates))._build();

  _$AllAssetsResponseType._({this.total, this.transaction}) : super._();

  @override
  AllAssetsResponseType rebuild(
          void Function(AllAssetsResponseTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllAssetsResponseTypeBuilder toBuilder() =>
      new AllAssetsResponseTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllAssetsResponseType &&
        total == other.total &&
        transaction == other.transaction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, transaction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllAssetsResponseType')
          ..add('total', total)
          ..add('transaction', transaction))
        .toString();
  }
}

class AllAssetsResponseTypeBuilder
    implements Builder<AllAssetsResponseType, AllAssetsResponseTypeBuilder> {
  _$AllAssetsResponseType? _$v;

  num? _total;
  num? get total => _$this._total;
  set total(num? total) => _$this._total = total;

  ListBuilder<AssetTransactionResponseType>? _transaction;
  ListBuilder<AssetTransactionResponseType> get transaction =>
      _$this._transaction ??= new ListBuilder<AssetTransactionResponseType>();
  set transaction(ListBuilder<AssetTransactionResponseType>? transaction) =>
      _$this._transaction = transaction;

  AllAssetsResponseTypeBuilder() {
    AllAssetsResponseType._defaults(this);
  }

  AllAssetsResponseTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _transaction = $v.transaction?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllAssetsResponseType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllAssetsResponseType;
  }

  @override
  void update(void Function(AllAssetsResponseTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllAssetsResponseType build() => _build();

  _$AllAssetsResponseType _build() {
    _$AllAssetsResponseType _$result;
    try {
      _$result = _$v ??
          new _$AllAssetsResponseType._(
              total: total, transaction: _transaction?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transaction';
        _transaction?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllAssetsResponseType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
