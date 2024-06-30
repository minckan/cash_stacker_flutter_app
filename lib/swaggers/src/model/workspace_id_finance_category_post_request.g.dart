// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_finance_category_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdFinanceCategoryPostRequest
    extends WorkspaceIdFinanceCategoryPostRequest {
  @override
  final String? categoryName;
  @override
  final String? categoryType;

  factory _$WorkspaceIdFinanceCategoryPostRequest(
          [void Function(WorkspaceIdFinanceCategoryPostRequestBuilder)?
              updates]) =>
      (new WorkspaceIdFinanceCategoryPostRequestBuilder()..update(updates))
          ._build();

  _$WorkspaceIdFinanceCategoryPostRequest._(
      {this.categoryName, this.categoryType})
      : super._();

  @override
  WorkspaceIdFinanceCategoryPostRequest rebuild(
          void Function(WorkspaceIdFinanceCategoryPostRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdFinanceCategoryPostRequestBuilder toBuilder() =>
      new WorkspaceIdFinanceCategoryPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdFinanceCategoryPostRequest &&
        categoryName == other.categoryName &&
        categoryType == other.categoryType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, categoryType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdFinanceCategoryPostRequest')
          ..add('categoryName', categoryName)
          ..add('categoryType', categoryType))
        .toString();
  }
}

class WorkspaceIdFinanceCategoryPostRequestBuilder
    implements
        Builder<WorkspaceIdFinanceCategoryPostRequest,
            WorkspaceIdFinanceCategoryPostRequestBuilder> {
  _$WorkspaceIdFinanceCategoryPostRequest? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _categoryType;
  String? get categoryType => _$this._categoryType;
  set categoryType(String? categoryType) => _$this._categoryType = categoryType;

  WorkspaceIdFinanceCategoryPostRequestBuilder() {
    WorkspaceIdFinanceCategoryPostRequest._defaults(this);
  }

  WorkspaceIdFinanceCategoryPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _categoryType = $v.categoryType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdFinanceCategoryPostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdFinanceCategoryPostRequest;
  }

  @override
  void update(
      void Function(WorkspaceIdFinanceCategoryPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdFinanceCategoryPostRequest build() => _build();

  _$WorkspaceIdFinanceCategoryPostRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdFinanceCategoryPostRequest._(
            categoryName: categoryName, categoryType: categoryType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
