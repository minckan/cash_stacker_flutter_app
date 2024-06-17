import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_asset_category_screen.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/component/category_list_tile.dart';

class AssetCategoryScreen extends ConsumerWidget {
  const AssetCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryViewModelProvider);
    final assets = ref.watch(assetViewModelProvider);

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
          final category = categories[index];

          if (category.type == CategoryType.asset) {
            final hasCategoryAsset = assets.any(
              (element) => element.category.id == category.id,
            );
            return CategoryListTile(
              category: category,
              hasCategoryAsset: hasCategoryAsset,
            );
          }
          return const SizedBox.shrink();
        },
        itemCount: categories.length,
      ),
    );
  }
}
