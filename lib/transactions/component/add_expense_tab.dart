import 'package:cash_stacker_flutter_app/common/component/form/form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_radio_button_field.dart';
import 'package:cash_stacker_flutter_app/common/utill/json.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/add_expense_category_screen.dart';

import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/transaction_category.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/serializers.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:cash_stacker_flutter_app/transactions/model/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExpenseTab extends ConsumerStatefulWidget {
  const AddExpenseTab({
    super.key,
    required this.selectedDate,
    required this.handleChangeSelectDate,
  });

  @override
  ConsumerState<AddExpenseTab> createState() => AddExpenseTabState();

  final DateTime selectedDate;
  final void Function(DateTime) handleChangeSelectDate;
}

class AddExpenseTabState extends ConsumerState<AddExpenseTab> {
  final priceController = TextEditingController();
  TransactionCategory? selectedCategory;
  String? selectedPaymentMethod;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(transactionCategoryViewModelProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        children: [
          WeeklyCalendar(
            selectedDate: widget.selectedDate,
            handleChangeSelectDate: widget.handleChangeSelectDate,
          ),
          const SizedBox(height: 28),
          FormFieldWithLabel(
            label: '금액',
            formField: FormTextField(
              controller: priceController,
              suffixText: '원',
            ),
          ),
          const SizedBox(height: 14),
          FormFieldWithLabel(
            label: '지출 카테고리',
            formField: TextRadioButtonField(
              list: categories['expense']!.map((c) {
                final json = convertToStandardJson(serializers.serializeWith(
                    TransactionCategory.serializer, c));
                json['name'] = c.categoryName;
                return json;
              }).toList(),
              onTabSelectItem: (selectedItem) {
                setState(() {
                  final trc = TransactionCategory((b) => b
                    ..categoryId = selectedItem['category_id']
                    ..categoryName = selectedItem['category_name']
                    ..categoryType = selectedItem['category_type']
                    ..workspaceId = selectedItem['workspace_id']);

                  selectedCategory = trc;
                });
              },
              onTabAddItem: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ExpenseAddCategoryScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          FormFieldWithLabel(
            label: '지출 수단',
            formField: TextRadioButtonField(
              list: allExpandPayments.map((p) {
                final json = {};
                json['name'] = p.name;
                json['type'] = p.type;
                return json;
              }).toList(),
              onTabSelectItem: (selectedItem) {
                setState(() {
                  selectedPaymentMethod = selectedItem['name'];
                });
              },
              onTabAddItem: () {},
            ),
          )
        ],
      ),
    );
  }
}
