import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_asset_category_screen.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cash_stacker_flutter_app/setting/component/category_list_tile.dart';

class AssetCategoryScreen extends ConsumerStatefulWidget {
  const AssetCategoryScreen({super.key});

  @override
  ConsumerState<AssetCategoryScreen> createState() =>
      _AssetCategoryScreenState();
}

class _AssetCategoryScreenState extends ConsumerState<AssetCategoryScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(assetTypeViewModelProvider.notifier).loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    final assetTypes = ref.watch(assetTypeViewModelProvider);
    final assetTypeVM = ref.read(assetTypeViewModelProvider.notifier);
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
        child: assetTypes.isEmpty
            ? const Center(
                child: Text('저장된 예산이 없습니다.'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final category = assetTypes[index];
                  return CategoryListTile(
                    category: CategoryTile(name: category.assetTypeName!),
                    canRemove: !category.isDefault!,
                    onDelete: () {
                      assetTypeVM.removeCategory(category.assetTypeId!);
                    },
                  );
                },
                itemCount: assetTypes.length,
              )

        // return const Text('연결 중에 문제가 발생했습니다.');
        );
  }
}
