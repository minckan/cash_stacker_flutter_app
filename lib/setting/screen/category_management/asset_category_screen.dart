import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_asset_category_screen.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetCategoryScreen extends ConsumerWidget {
  const AssetCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryViewModel = ref.watch(categoryViewModelProvider);

    return DefaultLayout(
      title: '자산 카테고리 관리',
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const AssetAddCategoryScreen()));
            },
            icon: const Icon(Icons.add))
      ],
      child: ListView.builder(
        itemBuilder: (context, index) {
          final category = categoryViewModel[index];

          if (category.type == CategoryType.asset) {
            return Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.border))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(category.name),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
        itemCount: categoryViewModel.length,
      ),
    );
  }
}
