import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_expense_category_screen.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseCategoryScreen extends ConsumerWidget {
  const ExpenseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryViewModel = ref.watch(categoryViewModelProvider);

    return DefaultLayout(
      title: '지출 카테고리 관리',
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ExpenseAddCategoryScreen()));
            },
            icon: const Icon(Icons.add))
      ],
      child: ListView.builder(
        itemBuilder: (context, index) {
          final category = categoryViewModel[index];

          print(category.type);

          if (category.type == CategoryType.expense) {
            return Row(
              children: [
                Text(category.name),
              ],
            );
          }
          return const SizedBox.shrink();
        },
        itemCount: categoryViewModel.length,
      ),
    );
  }
}
