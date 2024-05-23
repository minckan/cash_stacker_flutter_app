import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
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
      title: '자산 추가',
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
                buildTextAreaFormField(
                  context: context,
                  controller: nameController,
                  formName: 'name',
                  placeholder: '종목명 입력',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: buildCategoryFormField(
                        context: context,
                        categories: categoryVM,
                        selectedCategory: selectedCategory,
                        onSelect: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: buildCurrencyFormField(
                        context: context,
                        currencies: currencyVM,
                        selectedCurrency: selectedCurrency,
                        onSelect: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: buildNumberFormField(
                        context: context,
                        controller: buyingPriceController,
                        formName: 'buyingPrice',
                        placeholder: '매입가',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: buildNumberFormField(
                        context: context,
                        controller: buyingAmtController,
                        formName: 'amount',
                        placeholder: '수량',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: buildNumberFormField(
                        context: context,
                        controller: currentPriceController,
                        formName: 'currentPrice',
                        placeholder: '현재가',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: buildNumberFormField(
                        context: context,
                        controller: exchangeRateController,
                        formName: 'exchangeRate',
                        placeholder: '구매 환율',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
    Asset asset;
    if (_formKey.currentState!.saveAndValidate() &&
        value != null &&
        value.isNotEmpty) {
      String docId = uuid.v4();
      final workspaceId = ref.watch(workspaceViewModelProvider)!.id;

      //TODO: 자산 거래 추가시에 아이디 받아와오기
      asset = Asset(
        id: docId,
        assetCategory: value['category'],
        assetName: value['name'],
        buyingAmount: int.parse(value['amount']),
        buyingDate: value['date'],
        exchangeRate: double.parse(value['exchangeRate']),
        buyingCurrency: value['currency'],
        originalCurrencyBuyingPrice: double.parse(value['buyingPrice']),
        originalCurrencyCurrentPrice: double.parse(value['currentPrice']),
        currentKrwPrice: 0,
        krwBuyingPrice: 0,
      );

      await ref
          .read(assetViewModelProvider.notifier)
          .addAsset(asset, workspaceId);

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
      label: '매수일',
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

  buildTextAreaFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String formName,
    required String placeholder,
  }) {
    return FormContainer(
      child: FormBuilderTextField(
        name: formName,
        keyboardType: TextInputType.text,
        inputFormatters: const [],
        controller: controller,
        decoration:
            InputDecoration(border: InputBorder.none, labelText: placeholder),
        textAlign: TextAlign.right,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
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
      child: FormBuilderDropdown(
        name: 'category',
        isExpanded: true,
        decoration:
            const InputDecoration(border: InputBorder.none, labelText: '자산 분류'),
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
    return FormContainer(
      child: FormBuilderDropdown(
        name: 'currency',
        isExpanded: true,
        decoration:
            const InputDecoration(border: InputBorder.none, labelText: '구매통화'),
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
  }) {
    return FormContainer(
      child: FormBuilderTextField(
        name: formName,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: placeholder,
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
}
