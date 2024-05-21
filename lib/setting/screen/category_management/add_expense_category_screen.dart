import 'package:cash_stacker_flutter_app/auth/viewmodels/auth_view_model.dart';
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

    return DefaultLayout(
      title: '지출 카테고리 추가',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String docId = uuid.v4();
                final currentUser = ref.watch(authViewModelProvider);

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
              child: const Text('저장'),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> saveCategory() {

  // }
}

// 
