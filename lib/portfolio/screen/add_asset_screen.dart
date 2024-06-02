import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/model/asset_summary_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';

class AddAssetScreen extends ConsumerStatefulWidget {
  String? assetId;

  AddAssetScreen({super.key, this.assetId});

  @override
  ConsumerState<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends ConsumerState<AddAssetScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Uuid uuid = const Uuid();
  String? cashCategoryId;

  CategoryModel? selectedCategory;
  Currency? selectedCurrency;
  DateTime selectedDate = DateTime.now();

  TextEditingController categoryController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  final InputDecoration _inputDecoration = const InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: AppColors.primary,
      ),
    ),
  );
  @override
  void initState() {
    super.initState();

    cashCategoryId = ref.read(categoryViewModelProvider.notifier).cashAsset.id;
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref
        .watch(categoryViewModelProvider)
        .where((category) => category.type == CategoryType.asset)
        .toList();

    final currencyVM = ref.watch(currencyViewModelProvider).toList();

    final selectedCashCategory = selectedCategory?.id == cashCategoryId;

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
                child: Column(children: [
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
                    categories: categories,
                    selectedCategory: selectedCategory,
                    onSelect: (value) {
                      setState(() {
                        selectedCategory = value;
                        categoryController.text = value!.name;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  if (selectedCashCategory)
                    ..._buildCashAssetForm(context, currencyVM)
                  else
                    ..._buildCommonAssetForm(context, currencyVM),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCommonAssetForm(
      BuildContext context, List<Currency> currencyVM) {
    return [
      buildTextAreaFormField(
        context: context,
        formName: 'name',
        placeholder: '종목명 입력',
      ),
      const SizedBox(height: 10),
      buildCurrencyFormField(
        context: context,
        currencies: currencyVM,
        formName: 'currency',
        selectedCurrency: selectedCurrency,
        onSelect: (value) {
          setState(() {
            selectedCurrency = value;
            currencyController.text = value!.currencyName;
          });
          Navigator.pop(context);
        },
        controller: currencyController,
      ),
      const SizedBox(height: 10),
      buildNumberFormField(
        context: context,
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
            formName: 'exchangeRate',
            placeholder: '구매 환율(구매통화 1unit 당)',
            suffixText: '원'),
      ],
      const SizedBox(
        width: 10,
      ),
      buildNumberFormField(
        context: context,
        formName: 'amount',
        placeholder: '수량',
      ),
      const SizedBox(height: 10),
      buildNumberFormField(
        context: context,
        formName: 'currentPrice',
        placeholder: '현재가',
        isOptional: true,
        disabled: currencyController.value.text == '',
        suffixText: selectedCurrency?.currencyCode,
      ),
    ];
  }

  List<Widget> _buildCashAssetForm(
      BuildContext context, List<Currency> currencyVM) {
    return [
      buildCurrencyFormField(
        context: context,
        currencies: currencyVM,
        formName: 'cashCurrency',
        selectedCurrency: selectedCurrency,
        onSelect: (value) {
          setState(() {
            selectedCurrency = value;
            currencyController.text = value!.currencyName;
          });
          Navigator.pop(context);
        },
        controller: currencyController,
      ),
      if (selectedCurrency != null &&
          selectedCurrency?.currencyCode != 'KRW') ...[
        const SizedBox(
          width: 10,
        ),
        buildNumberFormField(
          context: context,
          formName: 'cashExchangeRate',
          placeholder: '외환 매입 환율(구매통화 1unit 당)',
          suffixText: '원',
        ),
      ],
      const SizedBox(height: 10),
      buildNumberFormField(
        context: context,
        formName: 'cashAmount',
        placeholder: '금액1',
        disabled: currencyController.value.text == '',
        suffixText: selectedCurrency?.currencyCode,
      ),
    ];
  }

  handleSave() async {
    logger.d(_formKey.currentState?.value);
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final value = _formKey.currentState?.value;
      if (value != null &&
          selectedCategory != null &&
          selectedCurrency != null) {
        final workspaceId = ref.watch(workspaceViewModelProvider)!.id;
        final newAssetId = uuid.v4();
        final isKrwAsset = selectedCurrency?.currencyCode == 'KRW';
        final isCashAsset = selectedCategory?.id == cashCategoryId;
        final isKrwCash = isKrwAsset && isCashAsset;
        final thisMonthAssetSummary = ref
            .read(assetSummaryProvider.notifier)
            .getAssetSummaryByMonth(getMonth(DateTime.now()));
        AssetSummary updatedSummary = AssetSummary.empty();

        if (widget.assetId == null) {
          final asset = Asset(
            id: newAssetId,
            name: value['name'],
            category: selectedCategory!,
            currency: selectedCurrency,
            inputCurrentPrice: (isKrwCash
                    ? double.tryParse(value['cashAmount'])
                    : double.tryParse(
                        value['currentPrice'],
                      )) ??
                0,
            initialPurchaseDate: selectedDate,
          );

          await ref
              .read(assetViewModelProvider.notifier)
              .addAsset(asset, workspaceId);
        }
        final AssetTransaction assetTr;

        if (!isKrwCash) {
          // 외환 거래
          if (isCashAsset) {
            assetTr = ForexTransaction(
                name: value['name'],
                id: uuid.v4(),
                assetId: widget.assetId ?? newAssetId,
                date: selectedDate,
                type: AssetTransactionType.buy,
                category: selectedCategory!,
                currency: selectedCurrency!,
                purchasePrice: value['cashAmount'],
                inputExchangeRate: value['cashExchangeRate']);
          }
          // 국내 자산 거래
          else if (isKrwAsset) {
            assetTr = DomesticTransaction(
              name: value['name'],
              id: uuid.v4(),
              assetId: widget.assetId ?? newAssetId,
              date: selectedDate,
              type: AssetTransactionType.buy,
              category: selectedCategory!,
              currency: selectedCurrency!,
              shares: value['amount'],
              pricePerShare: value['buyingPrice'],
            );
          }
          // 해외 자산 거래
          else {
            assetTr = ForeignTransaction(
                name: value['name'],
                id: uuid.v4(),
                assetId: widget.assetId ?? newAssetId,
                date: selectedDate,
                type: AssetTransactionType.buy,
                category: selectedCategory!,
                currency: selectedCurrency!,
                shares: value['amount'],
                pricePerShare: value['buyingPrice'],
                inputExchangeRate: value['exchangeRate']);
          }
          updatedSummary = thisMonthAssetSummary!.copyWith(
              totalAssets: thisMonthAssetSummary.totalAssets +
                  assetTr.totalKrwTransactionPrice);

          /// add transaction
          await ref
              .read(assetTransactionViewModelProvider.notifier)
              .addAssetTransaction(assetTr, workspaceId);
        } else {
          print(value['cashAmount']);
          updatedSummary = thisMonthAssetSummary!.copyWith(
              totalAssets: thisMonthAssetSummary.totalAssets +
                  double.parse(value['cashAmount']));
        }

        /// asset summary total assets amt update
        await ref
            .read(assetSummaryProvider.notifier)
            .updateAssetSummary(workspaceId, updatedSummary);

        if (!mounted) return;
        Navigator.of(context).pop();
      }
    }
  }

  buildTextAreaFormField({
    required BuildContext context,
    required String formName,
    required String placeholder,
  }) {
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormBuilderTextField(
        name: formName,
        decoration: _inputDecoration,
      ),
    );
  }

  buildCategoryFormField({
    required BuildContext context,
    required List<CategoryModel> categories,
    required CategoryModel? selectedCategory,
    required Function(CategoryModel?) onSelect,
  }) {
    // TODO: 모달을 다시 띄웠을때 선택한 아이템이 선택되어 있도록 수정
    return FormFieldWithLabel(
      label: '자산분류',
      formField: FormBuilderTextField(
        name: 'category',
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
                  onSelectedItemChanged: (int index) {},
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
    required String formName,
    required Currency? selectedCurrency,
    required Function(Currency?) onSelect,
    required TextEditingController controller,
  }) {
    return FormFieldWithLabel(
      label: '구매통화',
      formField: FormBuilderTextField(
        name: formName,
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
                  onSelectedItemChanged: (int index) {},
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

  Widget buildNumberFormField({
    required BuildContext context,
    required String formName,
    required String placeholder,
    bool isOptional = false,
    bool disabled = false,
    String? suffixText,
  }) {
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormBuilderTextField(
        name: formName,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [DecimalInputFormatter()],
        decoration: _inputDecoration.copyWith(
          suffixIcon: suffixText != null
              ? Container(
                  padding: const EdgeInsets.only(right: 16.0),
                  alignment: Alignment.centerRight,
                  width: 10,
                  child: Text(suffixText),
                )
              : null,
        ),
        textAlign: TextAlign.right,
        validator: FormBuilderValidators.compose([
          if (!isOptional) FormBuilderValidators.required(),
          FormBuilderValidators.numeric(),
        ]),
      ),
    );
  }
}

class DecimalInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,##0.##");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    final newText = newValue.text.replaceAll(',', '');
    final double? value = double.tryParse(newText);
    if (value != null) {
      final formattedValue = numberFormat.format(value);
      return TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(
            offset: formattedValue.length - selectionIndexFromTheRight),
      );
    }

    return newValue;
  }
}
