import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/utill/custom_alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryTile {
  final String name;
  CategoryTile({required this.name});
}

class CategoryListTile extends ConsumerWidget {
  const CategoryListTile({
    super.key,
    required this.category,
    required this.onDelete,
    this.canRemove = true,
  });

  final dynamic category;
  final bool canRemove;
  final Function() onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border))),
      child: ListTile(
        title: Text(
          category.name,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: canRemove
            ? GestureDetector(
                onTap: () {
                  showCustomAlertDialog(
                    context: context,
                    title: '카테고리 삭제',
                    content: '확인버튼을 누르면, [${category.name}] 카테고리가 삭제됩니다.',
                    onConfirmed: onDelete,
                  );
                },
                child: const Icon(Icons.remove),
              )
            : null,
      ),
    );
  }
}
