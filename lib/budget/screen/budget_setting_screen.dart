import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/input-formatter/decimal.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';

import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BudgetSettingScreen extends ConsumerStatefulWidget {
  const BudgetSettingScreen({super.key});

  @override
  ConsumerState<BudgetSettingScreen> createState() =>
      _BudgetSettingScreenState();
}

class _BudgetSettingScreenState extends ConsumerState<BudgetSettingScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isFormView: true,
      title: '예산 설정 하기',
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState?.saveAndValidate() ?? false) {
              final value = formKey.currentState?.value;
              final budget = value?['budget'];

              final workspaceId = ref.watch(workspaceViewModelProvider)?.id;

              Navigator.of(context).pop();
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
          children: [
            const SizedBox(
              height: 20,
            ),
            FormBuilder(
              key: formKey,
              child: FormFieldWithLabel(
                label: '월 예산',
                formField: FormBuilderTextField(
                  name: 'budget',
                  key: UniqueKey(),
                  decoration: inputDecoration,
                  inputFormatters: [DecimalInputFormatter()],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: '예산을 입력해 주세요'),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
