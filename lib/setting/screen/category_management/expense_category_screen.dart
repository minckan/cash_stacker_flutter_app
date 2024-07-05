import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/setting/component/category_list_tile.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_expense_category_screen.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseCategoryScreen extends ConsumerStatefulWidget {
  const ExpenseCategoryScreen({super.key});
  @override
  ConsumerState<ExpenseCategoryScreen> createState() =>
      _ExpenseCategoryScreenState();
}

class _ExpenseCategoryScreenState extends ConsumerState<ExpenseCategoryScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(transactionCategoryViewModelProvider.notifier).loadCategory();
  }

  @override
  Widget build(BuildContext contex) {
    final categories = ref.watch(transactionCategoryViewModelProvider);
    final categoryVM = ref.read(transactionCategoryViewModelProvider.notifier);

// TODO: 404 상태에 대한 화면 노출 필요
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
          final expenseCategories = categories.expense;

          if (expenseCategories.isEmpty) {
            return const Center(
              child: Text('조회된 항목이 없습니다'),
            );
          }

          return CategoryListTile(
            category:
                CategoryTile(name: expenseCategories[index].categoryName!),
            onDelete: () {
              categoryVM.removeCategory(
                expenseCategories[index],
              );
            },
          );
        },
        itemCount: categories.expense.length,
      ),
    );
  }
}
