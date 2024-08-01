// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_asset_transaction500_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteAssetTransaction500Response
    extends DeleteAssetTransaction500Response {
  @override
  final String? message;

  factory _$DeleteAssetTransaction500Response(
          [void Function(DeleteAssetTransaction500ResponseBuilder)? updates]) =>
      (new DeleteAssetTransaction500ResponseBuilder()..update(updates))
          ._build();

  _$DeleteAssetTransaction500Response._({this.message}) : super._();

  @override
  DeleteAssetTransaction500Response rebuild(
          void Function(DeleteAssetTransaction500ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteAssetTransaction500ResponseBuilder toBuilder() =>
      new DeleteAssetTransaction500ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteAssetTransaction500Response &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteAssetTransaction500Response')
          ..add('message', message))
        .toString();
  }
}

class DeleteAssetTransaction500ResponseBuilder
    implements
        Builder<DeleteAssetTransaction500Response,
            DeleteAssetTransaction500ResponseBuilder> {
  _$DeleteAssetTransaction500Response? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DeleteAssetTransaction500ResponseBuilder() {
    DeleteAssetTransaction500Response._defaults(this);
  }

  DeleteAssetTransaction500ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteAssetTransaction500Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteAssetTransaction500Response;
  }

  @override
  void update(
      void Function(DeleteAssetTransaction500ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteAssetTransaction500Response build() => _build();

  _$DeleteAssetTransaction500Response _build() {
    final _$result =
        _$v ?? new _$DeleteAssetTransaction500Response._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
