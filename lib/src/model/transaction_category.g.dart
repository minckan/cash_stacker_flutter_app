// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransactionCategory extends TransactionCategory {
  @override
  final int? categoryId;
  @override
  final String? workspaceId;
  @override
  final String? categoryName;
  @override
  final String? categoryType;

  factory _$TransactionCategory(
          [void Function(TransactionCategoryBuilder)? updates]) =>
      (new TransactionCategoryBuilder()..update(updates))._build();

  _$TransactionCategory._(
      {this.categoryId, this.workspaceId, this.categoryName, this.categoryType})
      : super._();

  @override
  TransactionCategory rebuild(
          void Function(TransactionCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionCategoryBuilder toBuilder() =>
      new TransactionCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionCategory &&
        categoryId == other.categoryId &&
        workspaceId == other.workspaceId &&
        categoryName == other.categoryName &&
        categoryType == other.categoryType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, categoryType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionCategory')
          ..add('categoryId', categoryId)
          ..add('workspaceId', workspaceId)
          ..add('categoryName', categoryName)
          ..add('categoryType', categoryType))
        .toString();
  }
}

class TransactionCategoryBuilder
    implements Builder<TransactionCategory, TransactionCategoryBuilder> {
  _$TransactionCategory? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _categoryType;
  String? get categoryType => _$this._categoryType;
  set categoryType(String? categoryType) => _$this._categoryType = categoryType;

  TransactionCategoryBuilder() {
    TransactionCategory._defaults(this);
  }

  TransactionCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _workspaceId = $v.workspaceId;
      _categoryName = $v.categoryName;
      _categoryType = $v.categoryType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionCategory;
  }

  @override
  void update(void Function(TransactionCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionCategory build() => _build();

  _$TransactionCategory _build() {
    final _$result = _$v ??
        new _$TransactionCategory._(
            categoryId: categoryId,
            workspaceId: workspaceId,
            categoryName: categoryName,
            categoryType: categoryType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
