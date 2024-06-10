import 'package:cash_stacker_flutter_app/auth/viewmodels/auth_view_model.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_form_field.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

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
    const Uuid uuid = Uuid();
    final currentUser = ref.watch(authViewModelProvider);

    return DefaultLayout(
      title: '자산 카테고리 추가',
      actions: [
        TextButton(
            onPressed: () {
              String docId = uuid.v4();

              if (_formKey.currentState?.saveAndValidate() ?? false) {
                final value = _formKey.currentState?.value;

                if (value != null) {
                  final category = CategoryModel(
                    id: docId,
                    name: value['category_name'],
                    type: CategoryType.asset,
                    isForeignAsset: value['is_foreign_asset'],
                    isCustomCategory: true,
                  );

                  if (currentUser != null) {
                    ref.read(categoryViewModelProvider.notifier).addCategory(
                          category,
                          currentUser.workspaceId,
                        );

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
                //   child: Checkbox(
                //     value: isForeignAsset,
                //     onChanged: (on) {
                //       if (on != null) {
                //         setState(() {
                //           isForeignAsset = on;
                //         });
                //       }
                //     },

                //   ),
                // ),
                // const Text('해외 통화로 매입할 수 있는 자산입니다.')
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 
