import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:cash_stacker_flutter_app/transactions/component/form_container.dart';
import 'package:cash_stacker_flutter_app/transactions/model/payment_method.dart';
import 'package:cash_stacker_flutter_app/transactions/model/transaction_model.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Uuid uuid = const Uuid();

  TextEditingController amountController = TextEditingController();
  CategoryModel? selectedCategory;
  PaymentMethod? selectedPaymentMethod;
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final categoryVM = ref
        .watch(categoryViewModelProvider)
        .where((category) => category.type == CategoryType.expense);

    return DefaultLayout(
      title: '지출 추가',
      child: Container(
        color: AppColors.lightGreyBackground,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                buildDateFormField(
                  context: context,
                  selectedDate: selectedDate,
                  onDateSelect: (value) => {
                    setState(() {
                      selectedDate = value;
                    })
                  },
                ),
                const SizedBox(height: 10),
                buildAmountFormField(
                  context: context,
                  controller: amountController,
                ),
                const SizedBox(height: 10),
                buildCategoryFormField(
                  context: context,
                  categories: categoryVM.toList(),
                  selectedCategory: selectedCategory,
                  onSelect: (value) => {
                    setState(() {
                      if (value != null) {
                        selectedCategory = value;
                      }
                    })
                  },
                ),
                const SizedBox(height: 10),
                buildAssetTypeFormField(
                  context: context,
                  payments: allExpandPayments.toList(),
                  selectedPaymentMethod: selectedPaymentMethod,
                  onSelect: (value) => {
                    setState(() {
                      if (value != null) {
                        selectedPaymentMethod = value;
                      }
                    })
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: ElevatedButton(
                    onPressed: handleSave,
                    child: const Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleSave() async {
    final value = _formKey.currentState?.value;
    TransactionModel transaction;
    if (_formKey.currentState!.saveAndValidate() &&
        value != null &&
        value.isNotEmpty) {
      String docId = uuid.v4();
      final workspaceId = ref.watch(workspaceViewModelProvider)!.id;

      transaction = TransactionModel(
        id: docId,
        date: value['date'],
        amount: value['amount'],
        category: value['category'],
        transactionType: TransactionType.expense,
        paymentMethod: value['paymentMethod'],
      );

      await ref
          .read(transactionViewModelProvider.notifier)
          .addTransaction(transaction, workspaceId);

      if (!mounted) return;
      Navigator.of(context).pop();
    }
  }

  buildDateFormField({
    required BuildContext context,
    required DateTime? selectedDate,
    required Function(DateTime) onDateSelect,
  }) {
    return FormContainer(
      label: '날짜',
      child: FormBuilderDateTimePicker(
        name: 'date',
        initialDate: selectedDate ?? DateTime.now(),
        initialValue: selectedDate ?? DateTime.now(),
        inputType: InputType.date,
        format: DateFormat("yyyy-MM-dd"),
        // decoration: const InputDecoration(labelText: "Date"),
        initialEntryMode: DatePickerEntryMode.calendar,
        textAlign: TextAlign.right,
        validator: (value) {
          if (value != null && value != selectedDate) {
            onDateSelect(value);
          }
          return null;
        },
      ),
    );
  }

  buildAmountFormField({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    return FormContainer(
      label: '금액',
      child: FormBuilderTextField(
        name: 'amount',
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.right,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (double.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          return null;
        },
      ),
    );
  }

  buildCategoryFormField({
    required BuildContext context,
    required List<CategoryModel> categories,
    required CategoryModel? selectedCategory,
    required Function(CategoryModel?) onSelect,
  }) {
    return FormContainer(
      label: '카테고리',
      child: FormBuilderDropdown(
        name: 'category',
        isExpanded: true,
        decoration: const InputDecoration(border: InputBorder.none),
        items: categories
            .map(
              (category) => DropdownMenuItem(
                alignment: Alignment.centerRight,
                value: category,
                child: Text(category.name),
              ),
            )
            .toList(),
        onChanged: onSelect,
      ),
    );
  }

  buildAssetTypeFormField({
    required BuildContext context,
    required List<PaymentMethod> payments,
    required PaymentMethod? selectedPaymentMethod,
    required Function(PaymentMethod?) onSelect,
  }) {
    return FormContainer(
      label: '지출 수단',
      child: FormBuilderDropdown(
        name: 'paymentMethod',
        isExpanded: true,
        decoration: const InputDecoration(border: InputBorder.none),
        items: payments
            .map(
              (payment) => DropdownMenuItem(
                alignment: Alignment.centerRight,
                value: payment,
                child: Text(payment.name),
              ),
            )
            .toList(),
        onChanged: onSelect,
      ),
    );
  }
}
