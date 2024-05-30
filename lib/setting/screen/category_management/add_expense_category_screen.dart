import 'package:cash_stacker_flutter_app/auth/viewmodels/auth_view_model.dart';
import 'package:cash_stacker_flutter_app/common/component/form/%08form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class ExpenseAddCategoryScreen extends ConsumerWidget {
  const ExpenseAddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    const Uuid uuid = Uuid();
    final currentUser = ref.watch(authViewModelProvider);

    return DefaultLayout(
      title: '지출 카테고리 추가',
      isFormView: true,
      actions: [
        TextButton(
            onPressed: () {
              String docId = uuid.v4();
              if (controller.value.text == '') {
                return;
              }
              final category = CategoryModel(
                id: docId,
                name: controller.value.text.toString(),
                type: CategoryType.expense,
              );

              if (currentUser != null) {
                ref.read(categoryViewModelProvider.notifier).addCategory(
                      category,
                      currentUser.workspaceId,
                    );

                Navigator.of(context).pop();
              }
            },
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.white),
            ))
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FormFieldWithLabel(
              label: '카테고리 이름',
              formField: FormTextField(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> saveCategory() {

  // }
}

// 
