import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/asset-form/domestic_cash_form.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/asset-form/domestic_transaction_form.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/asset-form/foreign_cash_form.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/asset-form/foreign_transaction_form.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/asset-form/form-field/category_selection_field.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';

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
    final exchangeRate = ref.read(exchangeRateProvider);

    if (assetTypes.isNotEmpty) {
      _setProperties();
    } else {
      await ref.read(assetTypeViewModelProvider.notifier).loadCategory();
      _setProperties();
    }

    if (exchangeRate.isEmpty) {
      ref.read(exchangeRateProvider.notifier).loadExchangeRates();
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
        _formKey.currentState?.patchValue({
          'category': thisAsset.assetTypeId, // 초기 값 설정
          'currency': thisAsset.currencyCode,
          'name': thisAsset.assetName ?? '',
        });
      });
    }
  }

  void selectCurrency(Currency? currency) {
    setState(() {
      selectedCurrency = currency;

      _formKey.currentState?.fields['currency']
          ?.didChange(currency?.currencyName);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(assetTypeViewModelProvider).toList();

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
                    CategorySelectionField(
                      categories: categories,
                      selectedCategory: selectedCategory,
                      onSelect: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    if (selectedCategory != null) ...[
                      if (selectedCategory?.assetTypeId == krwCashCategoryId)
                        const DomesticCashForm()
                      else if (selectedCategory?.assetTypeId ==
                          foreignCashCategoryId)
                        ForeignCashForm(
                          selectedCurrency: selectedCurrency,
                          onSelectCurrency: selectCurrency,
                        )
                      else if (selectedCategory?.isForeignAssetType == false)
                        const DomesticTransactionForm()
                      else
                        ForeignTransactionForm(
                          selectedCurrency: selectedCurrency,
                          onSelectCurrency: selectCurrency,
                        )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleSave() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final value = _formKey.currentState?.value;

      if (value == null) return;
      // 🟠 1. 기존에 존재하는 자산에 거래내역만 추가하는 경우 : 한화 현금 제외
      if (widget.assetId != null) {
        final assetTransactionVM =
            ref.read(assetTransactionViewModelProvider.notifier);

        // 1-1. 원화일 경우
        if (selectedCategory?.assetTypeId == krwCashCategoryId) {
          assetTransactionVM.addAssetTransaction(AssetTransactionRequest(
            (b) => b
              ..assetId = widget.assetId
              ..transactionType = AssetTransactionRequestTransactionTypeEnum.buy
              ..transactionDate = selectedDate.toUtc()
              ..pricePerShare = removeComma(value['balance']),
          ));
        }
        // 1-2. 외환일 경우
        else if (selectedCategory?.assetTypeId == foreignCashCategoryId) {
          assetTransactionVM.addAssetTransaction(AssetTransactionRequest(
            (b) => b
              ..assetId = widget.assetId
              ..transactionType = AssetTransactionRequestTransactionTypeEnum.buy
              ..transactionDate = selectedDate.toUtc()
              ..exchangeRate = removeComma(value['exchangeRate'])
              ..pricePerShare = removeComma(value['balance']),
          ));
        }
        // 1-3. 국내 트레이드인 경우
        else if (selectedCategory?.isForeignAssetType == false) {
          assetTransactionVM.addAssetTransaction(AssetTransactionRequest(
            (b) => b
              ..assetId = widget.assetId
              ..transactionType = AssetTransactionRequestTransactionTypeEnum.buy
              ..transactionDate = selectedDate.toUtc()
              ..shares =
                  int.tryParse(removeComma(value['shares'])!.toStringAsFixed(0))
              ..pricePerShare = removeComma(value['pricePerShare'])
              ..currentPricePerShare =
                  removeComma(value['currentPricePerShare']),
          ));
        }
        // 1-4. 해외 트레이드인 경우
        else {
          assetTransactionVM.addAssetTransaction(AssetTransactionRequest(
            (b) => b
              ..assetId = widget.assetId
              ..transactionType = AssetTransactionRequestTransactionTypeEnum.buy
              ..transactionDate = selectedDate.toUtc()
              ..shares =
                  int.tryParse(removeComma(value['shares'])!.toStringAsFixed(0))
              ..pricePerShare = removeComma(value['pricePerShare'])
              ..currentPricePerShare =
                  removeComma(value['currentPricePerShare'])
              ..exchangeRate = removeComma(value['exchangeRate']),
          ));
        }
      }

      // 🟢 2. 새로운 자산을 추가하는 경우
      else {
        final assetVM = ref.read(assetViewModelProvider.notifier);
        // 2-1. 현금 자산일 경우
        if (selectedCategory?.assetTypeId == krwCashCategoryId) {
          assetVM.addAsset(
            assetTypeId: krwCashCategoryId!,
            currencyCode: 'KRW',
            transaction: AssetTransactionRequest(
              (b) => b
                ..transactionType =
                    AssetTransactionRequestTransactionTypeEnum.buy
                ..transactionDate = selectedDate.toUtc()
                ..balance = removeComma(value['balance']),
            ),
          );
        }
        // 2-2. 외환일 경우
        else if (selectedCategory?.assetTypeId == foreignCashCategoryId) {
          assetVM.addAsset(
            assetTypeId: foreignCashCategoryId!,
            currencyCode: selectedCurrency!.currencyCode,
            transaction: AssetTransactionRequest(
              (b) => b
                ..transactionType =
                    AssetTransactionRequestTransactionTypeEnum.buy
                ..transactionDate = selectedDate.toUtc()
                ..exchangeRate = removeComma(value['exchangeRate'])
                ..balance = removeComma(value['balance']),
            ),
          );
        }
        // 2-3. 국내 트레이드인 경우
        else if (selectedCategory?.isForeignAssetType == false) {
          assetVM.addAsset(
            assetTypeId: selectedCategory!.assetTypeId!,
            currencyCode: 'KRW',
            assetName: value['name'],
            transaction: AssetTransactionRequest(
              (b) => b
                ..transactionType =
                    AssetTransactionRequestTransactionTypeEnum.buy
                ..transactionDate = selectedDate.toUtc()
                ..shares = int.tryParse(
                    removeComma(value['shares'])!.toStringAsFixed(0))
                ..pricePerShare = removeComma(value['pricePerShare'])
                ..currentPricePerShare =
                    removeComma(value['currentPricePerShare']),
            ),
          );
        }

        // 2-4. 해외 트레이드인 경우
        else {
          assetVM.addAsset(
            assetTypeId: selectedCategory!.assetTypeId!,
            currencyCode: selectedCurrency!.currencyCode,
            assetName: value['name'],
            transaction: AssetTransactionRequest(
              (b) => b
                ..transactionType =
                    AssetTransactionRequestTransactionTypeEnum.buy
                ..transactionDate = selectedDate.toUtc()
                ..shares = int.tryParse(
                    removeComma(value['shares'])!.toStringAsFixed(0))
                ..pricePerShare = removeComma(value['pricePerShare'])
                ..currentPricePerShare =
                    removeComma(value['currentPricePerShare'])
                ..exchangeRate = removeComma(value['exchangeRate']),
            ),
          );
        }
      }

      Navigator.of(context).pop();
    }
  }
}
