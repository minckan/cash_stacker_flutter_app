import 'package:cash_stacker_flutter_app/common/component/form/%08form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';

import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetSettingScreen extends ConsumerWidget {
  const BudgetSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return DefaultLayout(
      isFormView: true,
      title: '예산 설정 하기',
      actions: [
        TextButton(
          onPressed: () {
            final assetSummaryVM = ref.read(assetSummaryProvider.notifier);
            final currentMonthSummary =
                assetSummaryVM.getAssetSummaryByMonth(getMonth(DateTime.now()));

            final workspaceId = ref.watch(workspaceViewModelProvider)?.id;

            if (controller.value.text.toString() == '' ||
                workspaceId == null ||
                currentMonthSummary == null) {
              return;
            }

            final assetSummary = currentMonthSummary.copyWith(
              monthlyBudget: double.parse(controller.value.text),
            );

            assetSummaryVM.updateAssetSummary(workspaceId, assetSummary);

            Navigator.of(context).pop();
          },
          child: const Text(
            '저장',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FormFieldWithLabel(
              label: '이번 달 예산',
              formField: FormTextField(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
