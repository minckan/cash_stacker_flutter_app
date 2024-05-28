import 'package:cash_stacker_flutter_app/common/component/form/%08form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_radio_button_field.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:flutter/material.dart';

class AddIncomeTab extends StatelessWidget {
  const AddIncomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final priceController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        children: [
          const WeeklyCalendar(),
          const SizedBox(height: 28),
          FormFieldWithLabel(
            label: '금액',
            formField: FormTextField(
              controller: priceController,
              suffixText: '원',
            ),
          ),
          const SizedBox(height: 14),
          const FormFieldWithLabel(
            label: '수입 카테고리',
            formField: TextRadioButtonField(),
          )
        ],
      ),
    );
  }
}
