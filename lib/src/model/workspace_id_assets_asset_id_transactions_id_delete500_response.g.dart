// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_assets_asset_id_transactions_id_delete500_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response
    extends WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response {
  @override
  final String? error;

  factory _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response(
          [void Function(
                  WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder)?
              updates]) =>
      (new WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder()
            ..update(updates))
          ._build();

  _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response._({this.error})
      : super._();

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response rebuild(
          void Function(
                  WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder toBuilder() =>
      new WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response')
          ..add('error', error))
        .toString();
  }
}

class WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder
    implements
        Builder<WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response,
            WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder> {
  _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder() {
    WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response._defaults(this);
  }

  WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response;
  }

  @override
  void update(
      void Function(
              WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response build() => _build();

  _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response _build() {
    final _$result = _$v ??
        new _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response._(
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
