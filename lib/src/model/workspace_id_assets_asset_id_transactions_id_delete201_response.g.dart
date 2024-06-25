// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_assets_asset_id_transactions_id_delete201_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response
    extends WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response {
  @override
  final String? result;

  factory _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response(
          [void Function(
                  WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder)?
              updates]) =>
      (new WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder()
            ..update(updates))
          ._build();

  _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response._({this.result})
      : super._();

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response rebuild(
          void Function(
                  WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder toBuilder() =>
      new WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response &&
        result == other.result;
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
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response')
          ..add('result', result))
        .toString();
  }
}

class WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder
    implements
        Builder<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response,
            WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder> {
  _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response? _$v;

  String? _result;
  String? get result => _$this._result;
  set result(String? result) => _$this._result = result;

  WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder() {
    WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response._defaults(this);
  }

  WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response;
  }

  @override
  void update(
      void Function(
              WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response build() => _build();

  _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response _build() {
    final _$result = _$v ??
        new _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response._(
            result: result);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
