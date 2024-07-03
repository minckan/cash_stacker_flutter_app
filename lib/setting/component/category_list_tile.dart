import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/utill/custom_alert.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryListTile extends ConsumerWidget {
  const CategoryListTile({
    super.key,
    required this.category,
  });

  final dynamic category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaceId = ref.read(workspaceViewModelProvider)?.workspaceId;
    final categoryVM = ref.read(transactionCategoryViewModelProvider.notifier);
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border))),
      child: ListTile(
          title: Text(
            category.name,
            style: const TextStyle(fontSize: 14),
          ),
          trailing: GestureDetector(
              onTap: () {
                showCustomAlertDialog(
                  context: context,
                  title: '카테고리 삭제',
                  content: '확인버튼을 누르면, [${category.name}] 카테고리가 삭제됩니다.',
                  onConfirmed: () {
                    if (workspaceId != null) {
                      categoryVM.removeCategory(
                        category,
                        workspaceId,
                      );
                    }
                  },
                );
              },
              child: const Icon(Icons.remove))),
    );
  }
}
