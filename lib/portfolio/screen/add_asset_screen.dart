import 'package:cash_stacker_flutter_app/common/component/form/%08form_text_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:cash_stacker_flutter_app/transactions/component/form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddAssetScreen extends ConsumerStatefulWidget {
  const AddAssetScreen({super.key});

  @override
  ConsumerState<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends ConsumerState<AddAssetScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Uuid uuid = const Uuid();

  CategoryModel? selectedCategory;
  Currency? selectedCurrency;
  DateTime? selectedDate = DateTime.now();

  TextEditingController nameController = TextEditingController();
  TextEditingController buyingPriceController = TextEditingController();
  TextEditingController buyingAmtController = TextEditingController();
  TextEditingController currentPriceController = TextEditingController();
  TextEditingController exchangeRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final categoryVM = ref
        .watch(categoryViewModelProvider)
        .where((category) => category.type == CategoryType.asset)
        .toList();

    final currencyVM = ref.watch(currencyViewModelProvider).toList();
    return DefaultLayout(
      isFormView: true,
      title: '자산 추가',
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.white),
            ))
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const WeeklyCalendar(),
                    const SizedBox(height: 10),
                    buildTextAreaFormField(
                      context: context,
                      controller: nameController,
                      formName: 'name',
                      placeholder: '종목명 입력',
                    ),
                    const SizedBox(height: 10),
                    buildCategoryFormField(
                      context: context,
                      categories: categoryVM,
                      selectedCategory: selectedCategory,
                      onSelect: (value) {},
                    ),
                    const SizedBox(height: 10),
                    buildCurrencyFormField(
                      context: context,
                      currencies: currencyVM,
                      selectedCurrency: selectedCurrency,
                      onSelect: (value) {},
                    ),
                    const SizedBox(height: 10),
                    buildNumberFormField(
                      context: context,
                      controller: buyingPriceController,
                      formName: 'buyingPrice',
                      placeholder: '매입가',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildNumberFormField(
                      context: context,
                      controller: buyingAmtController,
                      formName: 'amount',
                      placeholder: '수량',
                    ),
                    const SizedBox(height: 10),
                    buildNumberFormField(
                      context: context,
                      controller: currentPriceController,
                      formName: 'currentPrice',
                      placeholder: '현재가',
                      isOptional: true,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildNumberFormField(
                      context: context,
                      controller: exchangeRateController,
                      formName: 'exchangeRate',
                      placeholder: '구매 환율',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final InputDecoration _inputDecoration = const InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Color(0xffDFDFDF),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffA18AE4),
      ),
    ),
  );

//TODO: 바로 요청이 안됨.
  handleSave() async {
    final value = _formKey.currentState?.value;
    Asset asset;
    if (_formKey.currentState!.saveAndValidate() &&
        value != null &&
        value.isNotEmpty) {
      final workspaceId = ref.watch(workspaceViewModelProvider)!.id;

      print('value is $value');

      asset = Asset(
        id: uuid.v4(),
        name: value['name'],
        category: value['category'],
        currency: value['currency'],
        inputCurrentPrice: double.parse(value['currentPrice']),
        initialPurchaseDate: value['date'],
        transactions: [
          AssetTransaction(
            id: uuid.v4(),
            date: value['date'],
            exchangeRate: double.parse(value['exchangeRate']),
            price: double.parse(value['buyingPrice']),
            quantity: double.parse(value['amount']),
            type: AssetTransactionType.buy,
            currency: value['currency'],
          )
        ],
      );
      await ref
          .read(assetViewModelProvider.notifier)
          .addAsset(asset, workspaceId);

      if (!mounted) return;
      Navigator.of(context).pop();
    }
  }

  buildTextAreaFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String formName,
    required String placeholder,
  }) {
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormTextField(
        controller: controller,
      ),
    );
  }

  buildCategoryFormField({
    required BuildContext context,
    required List<CategoryModel> categories,
    required CategoryModel? selectedCategory,
    required Function(CategoryModel?) onSelect,
  }) {
    return FormFieldWithLabel(
      label: '자산분류',
      formField: FormBuilderDropdown(
        name: 'category',
        isExpanded: true,
        decoration: _inputDecoration,
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

  buildCurrencyFormField({
    required BuildContext context,
    required List<Currency> currencies,
    required Currency? selectedCurrency,
    required Function(Currency?) onSelect,
  }) {
    return FormFieldWithLabel(
      label: '구매통화',
      formField: FormBuilderDropdown(
        name: 'currency',
        isExpanded: true,
        decoration: _inputDecoration,
        items: currencies
            .map(
              (currency) => DropdownMenuItem(
                alignment: Alignment.centerRight,
                value: currency,
                child: Text(
                    '${currency.currencyName} - ${currency.currencySymbol}'),
              ),
            )
            .toList(),
        onChanged: onSelect,
      ),
    );
  }

  buildNumberFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String formName,
    required String placeholder,
    bool isOptional = false,
  }) {
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormBuilderTextField(
        name: formName,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [decimalInputFormatter()],
        controller: controller,
        decoration: _inputDecoration,
        textAlign: TextAlign.right,
        validator: (value) {
          if (isOptional == false) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
          }
          return null;
        },
      ),
    );
  }
}

TextInputFormatter decimalInputFormatter() {
  return TextInputFormatter.withFunction((oldValue, newValue) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    final regex = RegExp(r'^\d*\.?\d*');

    if (regex.hasMatch(text)) {
      return newValue;
    }

    return oldValue;
  });
}
