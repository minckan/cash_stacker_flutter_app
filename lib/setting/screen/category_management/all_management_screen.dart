import 'package:cash_stacker_flutter_app/auth/viewmodels/auth_view_model.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/setting/component/menu_item.dart';
import 'package:cash_stacker_flutter_app/setting/component/menu_section.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/expense_category_screen.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryManagementScreen extends ConsumerWidget {
  const CategoryManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authViewModelProvider);
    return DefaultLayout(
      title: '카테고리 관리',
      child: Container(
        color: AppColors.lightGreyBackground,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              MenuSection(items: [
                MenuItem(
                  title: '[가게부] 지출 카테고리',
                  rightNode: IconButton(
                    onPressed: () {
                      if (currentUser != null) {
                        ref
                            .read(categoryViewModelProvider.notifier)
                            .loadCategory(
                                workspaceId: currentUser.workspaceId,
                                type: CategoryType.expense);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ExpenseCategoryScreen()));
                      }
                    },
                    icon: const Icon(
                      Icons.chevron_right,
                      color: AppColors.bodyText,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MenuItem(
                  title: '[가게부] 수입 카테고리',
                  rightNode: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                      color: AppColors.bodyText,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MenuItem(
                  title: '[포트폴리오] 자산 카테고리',
                  rightNode: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                      color: AppColors.bodyText,
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
