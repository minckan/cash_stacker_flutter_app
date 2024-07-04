import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';

import 'package:cash_stacker_flutter_app/setting/component/category_list_tile.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_income_category_screen.dart';

import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeCategoryScreen extends ConsumerStatefulWidget {
  const IncomeCategoryScreen({super.key});
  @override
  ConsumerState<IncomeCategoryScreen> createState() =>
      _IncomeCategoryScreenState();
}

class _IncomeCategoryScreenState extends ConsumerState<IncomeCategoryScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(transactionCategoryViewModelProvider.notifier).loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(transactionCategoryViewModelProvider);

    final workspaceId = ref.read(workspaceViewModelProvider)?.workspaceId;
    final categoryVM = ref.read(transactionCategoryViewModelProvider.notifier);
// TODO: 404 상태에 대한 화면 노출 필요
    return DefaultLayout(
      title: '수입 카테고리 관리',
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const IncomeAddCategoryScreen()));
            },
            icon: const Icon(Icons.add))
      ],
      child: ListView.builder(
        itemBuilder: (context, index) {
          final incomeCategory = categories['income'];
          (incomeCategory.length == 0)

          return CategoryListTile(
            category: CategoryTile(name: category.categoryName!),
            onDelete: () {
              if (workspaceId != null) {
                categoryVM.removeCategory(
                  category,
                );
              }
            },
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
