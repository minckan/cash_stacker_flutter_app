// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_invitation_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdInvitationIdPutRequest
    extends WorkspaceIdInvitationIdPutRequest {
  @override
  final String? status;

  factory _$WorkspaceIdInvitationIdPutRequest(
          [void Function(WorkspaceIdInvitationIdPutRequestBuilder)? updates]) =>
      (new WorkspaceIdInvitationIdPutRequestBuilder()..update(updates))
          ._build();

  _$WorkspaceIdInvitationIdPutRequest._({this.status}) : super._();

  @override
  WorkspaceIdInvitationIdPutRequest rebuild(
          void Function(WorkspaceIdInvitationIdPutRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdInvitationIdPutRequestBuilder toBuilder() =>
      new WorkspaceIdInvitationIdPutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdInvitationIdPutRequest && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspaceIdInvitationIdPutRequest')
          ..add('status', status))
        .toString();
  }
}

class WorkspaceIdInvitationIdPutRequestBuilder
    implements
        Builder<WorkspaceIdInvitationIdPutRequest,
            WorkspaceIdInvitationIdPutRequestBuilder> {
  _$WorkspaceIdInvitationIdPutRequest? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  WorkspaceIdInvitationIdPutRequestBuilder() {
    WorkspaceIdInvitationIdPutRequest._defaults(this);
  }

  WorkspaceIdInvitationIdPutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdInvitationIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdInvitationIdPutRequest;
  }

  @override
  void update(
      void Function(WorkspaceIdInvitationIdPutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdInvitationIdPutRequest build() => _build();

  _$WorkspaceIdInvitationIdPutRequest _build() {
    final _$result =
        _$v ?? new _$WorkspaceIdInvitationIdPutRequest._(status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
