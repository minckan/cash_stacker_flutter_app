// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_finance_category_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdFinanceCategoryIdPutRequest
    extends WorkspaceIdFinanceCategoryIdPutRequest {
  @override
  final String? categoryName;

  factory _$WorkspaceIdFinanceCategoryIdPutRequest(
          [void Function(WorkspaceIdFinanceCategoryIdPutRequestBuilder)?
              updates]) =>
      (new WorkspaceIdFinanceCategoryIdPutRequestBuilder()..update(updates))
          ._build();

  _$WorkspaceIdFinanceCategoryIdPutRequest._({this.categoryName}) : super._();

  @override
  WorkspaceIdFinanceCategoryIdPutRequest rebuild(
          void Function(WorkspaceIdFinanceCategoryIdPutRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdFinanceCategoryIdPutRequestBuilder toBuilder() =>
      new WorkspaceIdFinanceCategoryIdPutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdFinanceCategoryIdPutRequest &&
        categoryName == other.categoryName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdFinanceCategoryIdPutRequest')
          ..add('categoryName', categoryName))
        .toString();
  }
}

class WorkspaceIdFinanceCategoryIdPutRequestBuilder
    implements
        Builder<WorkspaceIdFinanceCategoryIdPutRequest,
            WorkspaceIdFinanceCategoryIdPutRequestBuilder> {
  _$WorkspaceIdFinanceCategoryIdPutRequest? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  WorkspaceIdFinanceCategoryIdPutRequestBuilder() {
    WorkspaceIdFinanceCategoryIdPutRequest._defaults(this);
  }

  WorkspaceIdFinanceCategoryIdPutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdFinanceCategoryIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdFinanceCategoryIdPutRequest;
  }

  @override
  void update(
      void Function(WorkspaceIdFinanceCategoryIdPutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdFinanceCategoryIdPutRequest build() => _build();

  _$WorkspaceIdFinanceCategoryIdPutRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdFinanceCategoryIdPutRequest._(
            categoryName: categoryName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
