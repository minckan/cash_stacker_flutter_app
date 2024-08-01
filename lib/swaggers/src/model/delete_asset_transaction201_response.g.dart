// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_asset_transaction201_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteAssetTransaction201Response
    extends DeleteAssetTransaction201Response {
  @override
  final String? result;

  factory _$DeleteAssetTransaction201Response(
          [void Function(DeleteAssetTransaction201ResponseBuilder)? updates]) =>
      (new DeleteAssetTransaction201ResponseBuilder()..update(updates))
          ._build();

  _$DeleteAssetTransaction201Response._({this.result}) : super._();

  @override
  DeleteAssetTransaction201Response rebuild(
          void Function(DeleteAssetTransaction201ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteAssetTransaction201ResponseBuilder toBuilder() =>
      new DeleteAssetTransaction201ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteAssetTransaction201Response && result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteAssetTransaction201Response')
          ..add('result', result))
        .toString();
  }
}

class DeleteAssetTransaction201ResponseBuilder
    implements
        Builder<DeleteAssetTransaction201Response,
            DeleteAssetTransaction201ResponseBuilder> {
  _$DeleteAssetTransaction201Response? _$v;

  String? _result;
  String? get result => _$this._result;
  set result(String? result) => _$this._result = result;

  DeleteAssetTransaction201ResponseBuilder() {
    DeleteAssetTransaction201Response._defaults(this);
  }

  DeleteAssetTransaction201ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteAssetTransaction201Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteAssetTransaction201Response;
  }

  @override
  void update(
      void Function(DeleteAssetTransaction201ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteAssetTransaction201Response build() => _build();

  _$DeleteAssetTransaction201Response _build() {
    final _$result =
        _$v ?? new _$DeleteAssetTransaction201Response._(result: result);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
