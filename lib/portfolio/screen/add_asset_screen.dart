import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/component/form/number_form_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_form_field.dart';

import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';

import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/asset_type_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset_type.dart';

import 'package:cash_stacker_flutter_app/swaggers/src/model/exchange_rate_response.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddAssetScreen extends ConsumerStatefulWidget {
  int? assetId;

  AddAssetScreen({super.key, this.assetId});

  @override
  ConsumerState<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends ConsumerState<AddAssetScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Uuid uuid = const Uuid();
  int? foreignCashCategoryId;
  int? krwCashCategoryId;

  AssetType? selectedCategory;
  Currency? selectedCurrency;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() async {
    final assetTypes = ref.read(assetTypeViewModelProvider);

    if (assetTypes.isNotEmpty) {
      _setProperties();
    } else {
      await ref.read(assetTypeViewModelProvider.notifier).loadCategory();
      _setProperties();
    }
  }

  void _setProperties() {
    final assetTypeVm = ref.read(assetTypeViewModelProvider.notifier);
    foreignCashCategoryId = assetTypeVm.foreignCashAsset.assetTypeId;
    krwCashCategoryId = assetTypeVm.cashAsset.assetTypeId;

    if (widget.assetId != null) {
      final thisAsset = ref
          .read(assetViewModelProvider.notifier)
          .getParticularAssets(widget.assetId!);

      selectedCategory = ref
          .read(assetTypeViewModelProvider)
          .firstWhere((model) => model.assetTypeId == thisAsset.assetTypeId);
      selectedCurrency =
          ref.read(assetViewModelProvider.notifier).getAssetCurrency(thisAsset);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // _formKey.currentState?.patchValue({
        //   'category': thisAsset.category.name, // 초기 값 설정
        //   'currency': thisAsset.currency?.currencyName,
        //   'cashCurrency': thisAsset.currency?.currencyName,
        //   'name': isForeignCash
        //       ? '${thisAsset.name}(${thisAsset.currency?.currencyCode})'
        //       : thisAsset.name,
        // });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(assetTypeViewModelProvider).toList();

    final currencies = ref.watch(exchangeRateProvider).toList();

    final bool isDisabledField = widget.assetId != null;

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
                    disabled: isDisabledField,
                    onSelect: (value) {
                      setState(() {
                        // _formKey.currentState?.fields['category']
                        //     ?.didChange(value);
                        // selectedCategory = value;

                        // if (value?.isForeignAsset == null ||
                        //     value?.isForeignAsset == false) {
                        //   selectedCurrency = currencyVM.firstWhere(
                        //       (currency) => currency.currencyCode == 'KRW');
                        // }
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  ..._buildCommonAssetForm(
                      context, currencies, isDisabledField),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCommonAssetForm(
      BuildContext context, List<Currency> currencies, bool disabled) {
    return [
      CustomTextFormField(
        formName: 'name',
        placeholder: '종목명 입력',
        disabled: disabled,
      ),
      // const SizedBox(height: 10),
      //   buildCurrencyFormField(
      //     context: context,
      //     currencies: currencyVM
      //         .where(((currency) => currency.currencyCode != 'KRW'))
      //         .toList(),
      //     formName: 'currency',
      //     selectedCurrency: selectedCurrency,
      //     disabled: disabled,
      //     onSelect: (value) {
      //       setState(() {
      //         selectedCurrency = value;
      //         _formKey.currentState?.fields['currency']
      //             ?.didChange(value!.currencyName);
      //       });
      //       Navigator.pop(context);
      //     },
      //   ),
      const SizedBox(height: 10),

      NumberFormField(
        formName: 'buyingPrice',
        placeholder: '매입가',
        disabled: selectedCurrency == null,
        suffixText: selectedCurrency?.currencyCode,
      ),

      const SizedBox(
        width: 10,
      ),
      NumberFormField(
        formName: 'exchangeRate',
        placeholder: '구매 환율',
        suffixText: '/ ${selectedCurrency?.currencySymbol}1',
        addComma: false,
      ),

      const SizedBox(
        width: 10,
      ),
      const NumberFormField(
        formName: 'amount',
        placeholder: '수량',
      ),
      const SizedBox(height: 10),
      NumberFormField(
        formName: 'currentPrice',
        placeholder: '현재가',
        isOptional: true,
        disabled: selectedCurrency == null,
        suffixText: selectedCurrency?.currencyCode,
      ),
    ];
  }

  List<Widget> _buildCashAssetForm(BuildContext context,
      List<ExchangeRateResponse> currencies, bool disabled) {
    return [
      // if (selectedCategory?.isForeignAsset == true) ...[
      //   buildCurrencyFormField(
      //     context: context,
      //     currencies: currencyVM
      //         .where(((currency) => currency.currencyCode != 'KRW'))
      //         .toList(),
      //     formName: 'cashCurrency',
      //     disabled: disabled,
      //     selectedCurrency: selectedCurrency,
      //     onSelect: (value) {
      //       setState(() {
      //         selectedCurrency = value;
      //         _formKey.currentState?.fields['cashCurrency']
      //             ?.didChange(value!.currencyName);
      //       });
      //       Navigator.pop(context);
      //     },
      //   ),
      //   const SizedBox(
      //     width: 10,
      //   ),
      //   NumberFormField(
      //     formName: 'cashExchangeRate',
      //     placeholder: '외환 매입 환율',
      //     suffixText: '/ ${selectedCurrency?.currencySymbol}1',
      //     addComma: false,
      //   ),
      //   const SizedBox(height: 10),
      // ],
      // NumberFormField(
      //   formName: 'cashAmount',
      //   placeholder: '금액',
      //   disabled: selectedCurrency == null,
      //   suffixText: selectedCurrency?.currencyCode,
      // ),
    ];
  }

  handleSave() async {
    // if (_formKey.currentState?.saveAndValidate() ?? false) {
    //   final value = _formKey.currentState?.value;
    //   if (value != null &&
    //       selectedCategory != null &&
    //       selectedCurrency != null) {
    //     final workspaceId = ref.watch(workspaceViewModelProvider)!.id;
    //     final newAssetId = uuid.v4();
    //     final isKrwAsset = selectedCurrency?.currencyCode == 'KRW';
    //     final isKrwCashAsset = selectedCategory?.id == krwCashCategoryId;
    //     final isForeignCashAsset =
    //         selectedCategory?.id == foreignCashCategoryId;

    //     if (widget.assetId == null) {
    //       final asset = Asset(
    //         id: newAssetId,
    //         name: isKrwCashAsset
    //             ? '현금'
    //             : isForeignCashAsset
    //                 ? '외환'
    //                 : value['name'],
    //         category: selectedCategory!,
    //         currency: selectedCurrency,
    //         inputCurrentPrice: isKrwCashAsset
    //             ? value['cashAmount'] != null
    //                 ? (double.tryParse(
    //                       removeComma(value['cashAmount']),
    //                     )) ??
    //                     0
    //                 : 0
    //             : value['currentPrice'] != null
    //                 ? (double.tryParse(
    //                       removeComma(value['currentPrice']),
    //                     )) ??
    //                     0
    //                 : 0,
    //         initialPurchaseDate: selectedDate,
    //       );

    //       await ref
    //           .read(assetViewModelProvider.notifier)
    //           .addAsset(asset, workspaceId);
    //     }
    //     final AssetTransaction assetTr;

    //     if (!isKrwCashAsset) {
    //       // 외환 거래
    //       if (isForeignCashAsset) {
    //         assetTr = ForexTransaction(
    //           name: '외환(${selectedCurrency!.currencyCode})',
    //           id: uuid.v4(),
    //           assetId: widget.assetId ?? newAssetId,
    //           date: selectedDate,
    //           type: AssetTransactionType.buy,
    //           category: selectedCategory!,
    //           currency: selectedCurrency!,
    //           transactionAmt:
    //               double.tryParse(removeComma(value['cashAmount'])) ?? 0,
    //           inputExchangeRate: double.parse(value['cashExchangeRate']),
    //         );
    //       }
    //       // 국내 자산 거래
    //       else if (isKrwAsset) {
    //         assetTr = DomesticTransaction(
    //           name: value['name'],
    //           id: uuid.v4(),
    //           assetId: widget.assetId ?? newAssetId,
    //           date: selectedDate,
    //           type: AssetTransactionType.buy,
    //           category: selectedCategory!,
    //           currency: selectedCurrency!,
    //           shares: int.tryParse(removeComma(value['amount'])) ?? 0,
    //           pricePerShare:
    //               double.tryParse(removeComma(value['buyingPrice'])) ?? 0,
    //         );
    //       }
    //       // 해외 자산 거래
    //       else {
    //         assetTr = ForeignTransaction(
    //           name: value['name'],
    //           id: uuid.v4(),
    //           assetId: widget.assetId ?? newAssetId,
    //           date: selectedDate,
    //           type: AssetTransactionType.buy,
    //           category: selectedCategory!,
    //           currency: selectedCurrency!,
    //           shares: int.tryParse(removeComma(value['amount'])) ?? 0,
    //           pricePerShare:
    //               double.tryParse(removeComma(value['buyingPrice'])) ?? 0,
    //           inputExchangeRate: double.parse(value['exchangeRate']),
    //         );
    //       }

    //       /// add transaction
    //       await ref
    //           .read(assetTransactionViewModelProvider.notifier)
    //           .addAssetTransaction(assetTr, workspaceId);
    //     }

    //     if (!mounted) return;
    //     Navigator.of(context).pop();
    //   }
    // }
  }

  buildCategoryFormField({
    required BuildContext context,
    required List<AssetType> categories,
    required AssetType? selectedCategory,
    required Function(AssetType?) onSelect,
    bool disabled = false,
  }) {
    // TODO: 모달을 다시 띄웠을때 선택한 아이템이 선택되어 있도록 수정
    return FormFieldWithLabel(
      label: '자산분류',
      formField: FormBuilderTextField(
        key: UniqueKey(),
        name: 'category',
        decoration: inputDecoration.copyWith(
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        readOnly: true,
        enabled: !disabled,
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
                          child: Text(categories[index].assetTypeName ?? ''),
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
    bool disabled = false,
  }) {
    return FormFieldWithLabel(
      label: '구매통화',
      formField: FormBuilderTextField(
        key: UniqueKey(),
        name: formName,
        enabled: !disabled,
        decoration: inputDecoration.copyWith(
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
}
