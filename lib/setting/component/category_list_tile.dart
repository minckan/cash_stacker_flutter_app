import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/utill/custom_alert.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryListTile extends ConsumerWidget {
  const CategoryListTile({
    super.key,
    required this.category,
    required this.hasCategoryAsset,
  });

  final CategoryModel category;
  final bool hasCategoryAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaceId = ref.read(workspaceViewModelProvider)?.id;
    final categoryVM = ref.read(categoryViewModelProvider.notifier);
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border))),
      child: ListTile(
        title: Text(
          category.name,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: category.isCustomCategory == true
            ? GestureDetector(
                onTap: () {
                  if (hasCategoryAsset) {
                    showCustomAlertDialog(
                      context: context,
                      title: '카테고리',
                      isSingleButton: true,
                      content:
                          '${category.name} 카테고리를 사용하는 자산목록이 있습니다.\n 해당 자산을 먼저 삭제 한 후, 자산을 삭제할 수 있습니다.',
                      onConfirmed: () {},
                    );
                  } else {
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
                  }
                },
                child: const Icon(Icons.remove))
            : null,
      ),
    );
  }
}
