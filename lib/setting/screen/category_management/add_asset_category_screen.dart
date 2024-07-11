import 'package:cash_stacker_flutter_app/common/component/form/text_form_field.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';

import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_asset_type_post_request.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetAddCategoryScreen extends ConsumerStatefulWidget {
  const AssetAddCategoryScreen({super.key});

  @override
  ConsumerState<AssetAddCategoryScreen> createState() =>
      _AssetAddCategoryScreenState();
}

class _AssetAddCategoryScreenState
    extends ConsumerState<AssetAddCategoryScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '자산 카테고리 추가',
      actions: [
        TextButton(
            onPressed: () async {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                final value = _formKey.currentState?.value;

                if (value != null) {
                  final category = WorkspaceIdAssetTypePostRequest(
                    (b) => b
                      ..assetTypeName = value['category_name']
                      ..isForeignAssetType = value['is_foreign_asset'],
                  );

                  final result = await ref
                      .read(assetTypeViewModelProvider.notifier)
                      .addCategory(
                        category,
                      );

                  if (result == true) {
                    Navigator.of(context).pop();
                  }
                }
              }
            },
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.white),
            ))
      ],
      isFormView: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                formName: 'category_name',
                placeholder: '카테고리 이름',
              ),
              FormBuilderCheckbox(
                name: 'is_foreign_asset',
                title: const Text('해외 통화로 매입할 수 있는 자산입니다'),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, // Remove padding
                  border: InputBorder.none,
                  // Remove border
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 
