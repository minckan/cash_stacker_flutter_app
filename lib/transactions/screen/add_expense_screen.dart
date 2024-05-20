import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/transactions/component/form_container.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '지출 추가',
      child: Container(
        color: AppColors.lightGreyBackground,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                buildDateFormField(context),
                const SizedBox(height: 10),
                buildAmountFormField(context),
                const SizedBox(height: 10),
                buildCategoryFormField(context),
                const SizedBox(height: 10),
                buildAssetTypeFormField(context),
                const SizedBox(height: 20),
                buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildDateFormField(BuildContext context) {
    return FormContainer(
      label: '날짜',
      child: TextButton(
        onPressed: () {
          showDatePicker(
            initialDate: DateTime.now(),
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(3000),
          );
        },
        child: const Text('2024.05.20'),
      ),
    );
  }

  buildAmountFormField(BuildContext context) {
    return const FormContainer(
      label: '금액',
      child: Expanded(child: TextField()),
    );
  }

  buildCategoryFormField(BuildContext context) {
    return FormContainer(
      label: '분류',
      child: TextButton(
        onPressed: () {},
        child: const Text(''),
      ),
    );
  }

  buildAssetTypeFormField(BuildContext context) {
    return FormContainer(
        label: '자산',
        child: TextButton(
          onPressed: () {},
          child: const Text(''),
        ));
  }

  buildButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('저장'),
      ),
    );
  }
}
