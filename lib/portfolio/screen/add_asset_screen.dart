import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  DateTime selectedDate = DateTime.now();

  TextEditingController nameController = TextEditingController();
  TextEditingController buyingPriceController = TextEditingController();
  TextEditingController buyingAmtController = TextEditingController();
  TextEditingController currentPriceController = TextEditingController();
  TextEditingController exchangeRateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

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
            onPressed: handleSave,
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
                    WeeklyCalendar(
                      selectedDate: selectedDate,
                      handleChangeSelectDate: (value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCategoryFormField(
                      context: context,
                      categories: categoryVM,
                      selectedCategory: selectedCategory,
                      onSelect: (value) {
                        setState(() {
                          // selectedCategory = value;
                          // _formKey.currentState?.fields['category']
                          //     ?.didChange(value);
                          categoryController.text = value!.name;
                        });
                        Navigator.pop(context);
                      },
                      controller: categoryController,
                    ),
                    const SizedBox(height: 10),
                    buildTextAreaFormField(
                      context: context,
                      controller: nameController,
                      formName: 'name',
                      placeholder: '종목명 입력',
                    ),
                    const SizedBox(height: 10),
                    buildCurrencyFormField(
                      context: context,
                      currencies: currencyVM,
                      selectedCurrency: selectedCurrency,
                      onSelect: (value) {
                        setState(() {
                          selectedCurrency = value;
                          // _formKey.currentState?.fields['currency']
                          //     ?.didChange(value);

                          currencyController.text = value!.currencyName;
                        });
                        Navigator.pop(context);
                      },
                      controller: currencyController,
                    ),
                    const SizedBox(height: 10),
                    buildNumberFormField(
                      context: context,
                      controller: buyingPriceController,
                      formName: 'buyingPrice',
                      placeholder: '매입가',
                      disabled: currencyController.value.text == '',
                      suffixText: selectedCurrency?.currencyCode,
                    ),
                    if (selectedCurrency != null &&
                        selectedCurrency?.currencyCode != 'KRW') ...[
                      const SizedBox(
                        width: 10,
                      ),
                      buildNumberFormField(
                          context: context,
                          controller: exchangeRateController,
                          formName: 'exchangeRate',
                          placeholder: '구매 환율(구매통화 1unit 당)',
                          suffixText: '원'),
                    ],
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
                      disabled: currencyController.value.text == '',
                      suffixText: selectedCurrency?.currencyCode,
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
        // color: Color(0xffDFDFDF),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: AppColors.primary,
      ),
    ),
  );

  handleSave() async {
    print(_formKey.currentState?.value);
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final value = _formKey.currentState?.value;
      if (value != null) {
        final workspaceId = ref.watch(workspaceViewModelProvider)!.id;

        final asset = Asset(
          id: uuid.v4(),
          name: value['name'],
          category: value['category'],
          currency: value['currency'],
          inputCurrentPrice: double.tryParse(value['currentPrice']) ?? 0,
          initialPurchaseDate: selectedDate,
          transactions: [
            AssetTransaction(
              id: uuid.v4(),
              date: selectedDate,
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
  }

  buildTextAreaFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String formName,
    required String placeholder,
  }) {
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormBuilderTextField(
        name: formName,
        controller: controller,
        decoration: _inputDecoration,
      ),
    );
  }

  buildCategoryFormField({
    required BuildContext context,
    required List<CategoryModel> categories,
    required CategoryModel? selectedCategory,
    required Function(CategoryModel?) onSelect,
    required TextEditingController controller,
  }) {
    // TODO: 모달을 다시 띄웠을때 선택한 아이템이 선택되어 있도록 수정
    return FormFieldWithLabel(
      label: '자산분류',
      formField: FormBuilderTextField(
        name: 'category',
        controller: controller,
        decoration: _inputDecoration.copyWith(
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        readOnly: true,
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 250,
                color: Colors.white,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 32,
                  onSelectedItemChanged: (int index) {
                    logger.d(index);
                  },
                  children: List<Widget>.generate(
                    categories.length,
                    (int index) {
                      return GestureDetector(
                        onTap: () => onSelect(categories[index]),
                        child: Center(
                          child: Text(categories[index].name),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  buildCurrencyFormField({
    required BuildContext context,
    required List<Currency> currencies,
    required Currency? selectedCurrency,
    required Function(Currency?) onSelect,
    required TextEditingController controller,
  }) {
    return FormFieldWithLabel(
      label: '구매통화',
      formField: FormBuilderTextField(
        name: 'currency',
        controller: controller,
        decoration: _inputDecoration.copyWith(
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        readOnly: true,
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 250,
                color: Colors.white,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 32,
                  onSelectedItemChanged: (int index) {
                    logger.d(index);
                  },
                  children: List<Widget>.generate(
                    currencies.length,
                    (int index) {
                      return GestureDetector(
                        onTap: () => onSelect(currencies[index]),
                        child: Center(
                          child: Text(
                              '${currencies[index].currencyName} - ${currencies[index].currencySymbol}'),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  buildNumberFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String formName,
    required String placeholder,
    bool isOptional = false,
    bool disabled = false,
    String? suffixText,
  }) {
    logger.d('$formName: $disabled');
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormBuilderTextField(
        name: formName,
        readOnly: disabled,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [decimalInputFormatter()],
        controller: controller,
        decoration: _inputDecoration.copyWith(
          suffixIcon: Container(
            padding: const EdgeInsets.only(right: 16.0),
            alignment: Alignment.centerRight,
            child: Text(suffixText ?? ''),
          ),
        ),
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
