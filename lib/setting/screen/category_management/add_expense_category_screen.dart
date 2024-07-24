import 'package:cash_stacker_flutter_app/common/component/form/form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseAddCategoryScreen extends ConsumerWidget {
  const ExpenseAddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return DefaultLayout(
      title: '지출 카테고리 추가',
      isFormView: true,
      actions: [
        TextButton(
            onPressed: () async {
              if (controller.value.text == '') {
                return;
              }

              final result = await ref
                  .read(transactionCategoryViewModelProvider.notifier)
                  .addCategory(
                    WorkspaceIdFinanceCategoryPostRequest((b) => b
                      ..categoryName = controller.value.text.toString()
                      ..categoryType = CategoryType.expense.name),
                  );

              if (result == true) {
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
}
