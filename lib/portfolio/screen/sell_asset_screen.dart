import 'package:cash_stacker_flutter_app/common/component/form/number_form_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_form_field.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/weekly_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class SellAssetScreen extends ConsumerStatefulWidget {
  String assetId;
  SellAssetScreen({super.key, required this.assetId});

  @override
  ConsumerState<SellAssetScreen> createState() => _SellAssetScreenState();
}

class _SellAssetScreenState extends ConsumerState<SellAssetScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  Uuid uuid = const Uuid();
  DateTime selectedDate = DateTime.now();
  Asset? asset;
  String? foreignCashCategoryId;
  String? sellableAmount;
  bool? isKrwAsset;
  bool? isForeignCash;
  AssetDetailViewModel? assetDetailVm;

  @override
  void initState() {
    super.initState();

    foreignCashCategoryId =
        ref.read(assetTypeViewModelProvider.notifier).foreignCashAsset.id;
    asset = ref
        .read(assetViewModelProvider.notifier)
        .getParticularAssets(widget.assetId);

    // if (asset != null) {
    //   assetDetailVm = AssetDetailViewModel(asset: asset!, ref: ref);
    //   isForeignCash = foreignCashCategoryId == asset!.category.id;
    //   isKrwAsset = asset!.currencyCode == 'KRW';
    //   if (assetDetailVm == null) return;
    //   if (isForeignCash == true) {
    //     sellableAmount =
    //         '${asset!.currency?.currencySymbol}${addComma.format(assetDetailVm!.totalBuyingAmountForeign)}';
    //   } else {
    //     sellableAmount =
    //         '${addComma.format(assetDetailVm!.totalQuantity)} unit';
    //   }
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (isForeignCash == true) {
    //       formKey.currentState?.patchValue({
    //         'name': '${asset!.name}(${asset!.currency?.currencyCode})',
    //       });
    //     } else {
    //       formKey.currentState?.patchValue({
    //         'name': asset!.name,
    //       });
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isFormView: true,
      title: '매도',
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
              if (asset == null || assetDetailVm == null)
                const Center(
                  child: Text('문제가 발생했습니다'),
                )
              else
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      WeeklyCalendar(
                        selectedDate: selectedDate,
                        handleChangeSelectDate: (value) {
                          setState(
                            () {
                              selectedDate = value;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      const CustomTextFormField(
                        formName: 'name',
                        placeholder: '종목명',
                        disabled: true,
                      ),
                      const SizedBox(height: 10),
                      NumberFormField(
                        formName: 'sell_amount',
                        placeholder: '매도량',
                        helperText: sellableAmount != null
                            ? '매도 가능량: $sellableAmount'
                            : null,
                      ),
                      if (isForeignCash != true) ...[
                        const SizedBox(height: 10),
                        NumberFormField(
                          formName: 'selling_price',
                          placeholder: '매도단가',
                          suffixText: asset!.currencyCode,
                          isOptional: true,
                        )
                      ],
                      if (isKrwAsset == false) ...[
                        const SizedBox(height: 10),
                        const NumberFormField(
                          formName: 'sell_exchange_rate',
                          placeholder: '매도환율',
                          // suffixText: '/ ${asset!.currency?.currencySymbol}1',
                          addComma: false,
                        )
                      ],
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  handleSave() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final workspaceId = ref.watch(workspaceViewModelProvider)!.workspaceId;
      final value = formKey.currentState?.value;

      // if (value != null) {
      //   final AssetTransaction assetTr;

      //   if (isForeignCash == true) {
      //     assetTr = ForexTransaction(
      //       name: '현금(${asset!.currency?.currencyCode})',
      //       id: uuid.v4(),
      //       assetId: asset!.id,
      //       date: selectedDate,
      //       type: AssetTransactionType.sell,
      //       category: asset!.category,
      //       currency: asset!.currency!,
      //       transactionAmt:
      //           double.tryParse(removeComma(value['sell_amount'])) ?? 0,
      //       inputExchangeRate: double.parse(value['sell_exchange_rate']),
      //     );
      //   } else {
      //     if (isKrwAsset == true) {
      //       assetTr = DomesticTransaction(
      //         name: asset!.name,
      //         id: uuid.v4(),
      //         assetId: asset!.id,
      //         date: selectedDate,
      //         type: AssetTransactionType.sell,
      //         category: asset!.category,
      //         currency: asset!.currency!,
      //         pricePerShare:
      //             double.tryParse(removeComma(value['selling_price'])) ?? 0,
      //         shares: int.tryParse(removeComma(value['sell_amount'])) ?? 0,
      //       );
      //     } else {
      //       assetTr = ForeignTransaction(
      //         name: asset!.name,
      //         id: uuid.v4(),
      //         assetId: asset!.id,
      //         date: selectedDate,
      //         type: AssetTransactionType.sell,
      //         category: asset!.category,
      //         currency: asset!.currency!,
      //         pricePerShare:
      //             double.tryParse(removeComma(value['selling_price'])) ?? 0,
      //         shares: int.tryParse(removeComma(value['sell_amount'])) ?? 0,
      //         inputExchangeRate: double.parse(value['sell_exchange_rate']),
      //       );
      //     }
      //   }

      //   /// 현금자산 업데이트
      //   final assetVM = ref.read(assetViewModelProvider.notifier);

      //   Asset? krwCashAsset = assetVM.krwCashAsset;

      //   if (krwCashAsset != null) {
      //     krwCashAsset = krwCashAsset.copyWith(
      //         inputCurrentPrice: krwCashAsset.inputCurrentPrice +
      //             assetTr.totalKrwTransactionPrice);

      //     assetVM.updateAsset(krwCashAsset, workspaceId);
      //   } else {
      //     final asset = Asset(
      //       id: uuid.v4(),
      //       name: '현금',
      //       category: ref.read(categoryViewModelProvider.notifier).cashAsset,
      //       currency: ref.read(currencyViewModelProvider.notifier).krwCurrency,
      //       initialPurchaseDate: selectedDate,
      //       inputCurrentPrice: assetTr.totalKrwTransactionPrice,
      //     );

      //     assetVM.addAsset(asset, workspaceId);
      //   }

      //   /// 자산 거래 내역에 추가
      //   await ref
      //       .read(assetTransactionViewModelProvider.notifier)
      //       .addAssetTransaction(assetTr, workspaceId);

      //   if (!mounted) return;
      //   Navigator.of(context).pop();
      // }
    }
  }
}
