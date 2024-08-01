// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_financial_tracker_category_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateFinancialTrackerCategoryReq
    extends UpdateFinancialTrackerCategoryReq {
  @override
  final String? categoryName;

  factory _$UpdateFinancialTrackerCategoryReq(
          [void Function(UpdateFinancialTrackerCategoryReqBuilder)? updates]) =>
      (new UpdateFinancialTrackerCategoryReqBuilder()..update(updates))
          ._build();

  _$UpdateFinancialTrackerCategoryReq._({this.categoryName}) : super._();

  @override
  UpdateFinancialTrackerCategoryReq rebuild(
          void Function(UpdateFinancialTrackerCategoryReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateFinancialTrackerCategoryReqBuilder toBuilder() =>
      new UpdateFinancialTrackerCategoryReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateFinancialTrackerCategoryReq &&
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
    return (newBuiltValueToStringHelper(r'UpdateFinancialTrackerCategoryReq')
          ..add('categoryName', categoryName))
        .toString();
  }
}

class UpdateFinancialTrackerCategoryReqBuilder
    implements
        Builder<UpdateFinancialTrackerCategoryReq,
            UpdateFinancialTrackerCategoryReqBuilder> {
  _$UpdateFinancialTrackerCategoryReq? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  UpdateFinancialTrackerCategoryReqBuilder() {
    UpdateFinancialTrackerCategoryReq._defaults(this);
  }

  UpdateFinancialTrackerCategoryReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateFinancialTrackerCategoryReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateFinancialTrackerCategoryReq;
  }

  @override
  void update(
      void Function(UpdateFinancialTrackerCategoryReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateFinancialTrackerCategoryReq build() => _build();

  _$UpdateFinancialTrackerCategoryReq _build() {
    final _$result = _$v ??
        new _$UpdateFinancialTrackerCategoryReq._(categoryName: categoryName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
