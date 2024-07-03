import 'package:cash_stacker_flutter_app/budget/viewmodels/budget_view_model.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/input-formatter/decimal.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/snackbar.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';

import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BudgetSettingScreen extends ConsumerStatefulWidget {
  const BudgetSettingScreen({super.key});

  @override
  ConsumerState<BudgetSettingScreen> createState() =>
      _BudgetSettingScreenState();
}

class _BudgetSettingScreenState extends ConsumerState<BudgetSettingScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 14));

  bool activateBudget = false;

  @override
  void initState() {
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        startDate = args.value.startDate;
        endDate = args.value.endDate ?? args.value.startDate;
      }
    });
  }

  bool get currentDateInRange {
    final now = DateTime.now();
    return now.compareTo(startDate) >= 0 && now.compareTo(endDate) <= 0;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isFormView: true,
      title: '예산 설정 하기',
      actions: [
        TextButton(
          onPressed: () async {
            if (formKey.currentState?.saveAndValidate() ?? false) {
              final value = formKey.currentState?.value;
              final budget = value?['budget'];
              final isActive = value?['is_active'];
              final workspaceId =
                  ref.watch(workspaceViewModelProvider)?.workspaceId;

              final result =
                  await ref.read(budgetViewModelProvider.notifier).addBudget(
                        workspaceId: workspaceId,
                        body: WorkspaceIdBudgetPostRequest(
                          (b) => b
                            ..startDate = startDate.toUtc()
                            ..endDate = endDate.toUtc()
                            ..amount = double.parse(removeComma(budget))
                            ..isActive = isActive,
                        ),
                      );

              if (result == true) {
                Navigator.of(context).pop();
              } else {
                showSnackBar(context, 'Error: $result');
              }
            }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('예산 설정 기간'),
            const SizedBox(
              height: 10,
            ),
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                startDate,
                endDate,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  FormFieldWithLabel(
                    label: '월 예산',
                    formField: FormBuilderTextField(
                      name: 'budget',
                      key: UniqueKey(),
                      decoration: inputDecoration,
                      inputFormatters: [DecimalInputFormatter()],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: '예산을 입력해 주세요'),
                      ]),
                    ),
                  ),
                  FormBuilderCheckbox(
                    name: 'is_active',
                    initialValue: false,
                    title: const Text(
                      '현재 활성 예산으로 설정',
                      textAlign: TextAlign.start,
                    ),
                    enabled: currentDateInRange,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero, // Remove padding
                      border: InputBorder.none,
                      // Remove border
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
