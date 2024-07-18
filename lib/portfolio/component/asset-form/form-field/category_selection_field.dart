import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';

// TODO: 모달을 다시 띄웠을때 선택한 아이템이 선택되어 있도록 수정
class CategorySelectionField extends StatelessWidget {
  final List<AssetType> categories;
  final AssetType? selectedCategory;
  final Function(AssetType?) onSelect;

  const CategorySelectionField({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return FormFieldWithLabel(
      label: '자산분류',
      formField: FormBuilderDropdown(
          key: UniqueKey(),
          name: 'category',
          enabled: true,
          onChanged: onSelect,
          items: categories.map<DropdownMenuItem<AssetType>>((AssetType value) {
            return DropdownMenuItem<AssetType>(
              value: value,
              child: Text(value.assetTypeName ?? ''),
            );
          }).toList(),
          decoration: inputDecoration),
    );
  }
}
