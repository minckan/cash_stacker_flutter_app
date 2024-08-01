// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_financial_tracker_category_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateFinancialTrackerCategoryReq
    extends CreateFinancialTrackerCategoryReq {
  @override
  final String? categoryName;
  @override
  final String? categoryType;

  factory _$CreateFinancialTrackerCategoryReq(
          [void Function(CreateFinancialTrackerCategoryReqBuilder)? updates]) =>
      (new CreateFinancialTrackerCategoryReqBuilder()..update(updates))
          ._build();

  _$CreateFinancialTrackerCategoryReq._({this.categoryName, this.categoryType})
      : super._();

  @override
  CreateFinancialTrackerCategoryReq rebuild(
          void Function(CreateFinancialTrackerCategoryReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateFinancialTrackerCategoryReqBuilder toBuilder() =>
      new CreateFinancialTrackerCategoryReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateFinancialTrackerCategoryReq &&
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
    return (newBuiltValueToStringHelper(r'CreateFinancialTrackerCategoryReq')
          ..add('categoryName', categoryName)
          ..add('categoryType', categoryType))
        .toString();
  }
}

class CreateFinancialTrackerCategoryReqBuilder
    implements
        Builder<CreateFinancialTrackerCategoryReq,
            CreateFinancialTrackerCategoryReqBuilder> {
  _$CreateFinancialTrackerCategoryReq? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _categoryType;
  String? get categoryType => _$this._categoryType;
  set categoryType(String? categoryType) => _$this._categoryType = categoryType;

  CreateFinancialTrackerCategoryReqBuilder() {
    CreateFinancialTrackerCategoryReq._defaults(this);
  }

  CreateFinancialTrackerCategoryReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _categoryType = $v.categoryType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateFinancialTrackerCategoryReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateFinancialTrackerCategoryReq;
  }

  @override
  void update(
      void Function(CreateFinancialTrackerCategoryReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateFinancialTrackerCategoryReq build() => _build();

  _$CreateFinancialTrackerCategoryReq _build() {
    final _$result = _$v ??
        new _$CreateFinancialTrackerCategoryReq._(
            categoryName: categoryName, categoryType: categoryType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
