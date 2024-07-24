import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/add_asset_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/edit_asset_transaction_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/sell_asset_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';

import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

Widget buildActionSheet(BuildContext context) => CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: const Text('수정'),
          onPressed: () => Navigator.pop(context, 'edit'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: const Text('삭제'),
          onPressed: () => Navigator.pop(context, 'delete'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('취소'),
        onPressed: () => Navigator.pop(context, null),
      ),
    );

class AssetTransactionListScreen extends ConsumerWidget {
  AssetTransactionListScreen({super.key, this.assetId});

  int? assetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryVm = ref.read(assetTypeViewModelProvider.notifier);
    List<AssetTransaction> assetsTransactions =
        ref.watch(assetTransactionViewModelProvider);
    final assetTrVm = ref.read(assetTransactionViewModelProvider.notifier);
    if (assetId != null) {
      assetsTransactions = assetTrVm.getParticularAssetTransactions(assetId!);
    }
    double totalAmt = assetTrVm.getAllTransactionKrwAmt(assetsTransactions);

    void handleMoreButton(AssetTransaction transaction) async {
      final action = await showCupertinoModalPopup(
          context: context, builder: buildActionSheet);

      switch (action) {
        case 'edit':
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  EditAssetTransactionScreen(assetTransaction: transaction)));
          break;
        case 'delete':
          print('how to delete?');
          break;
        default:
      }
    }

    return DefaultLayout(
      title: '거래내역',
      actions: [
        if (assetId != null) ...[
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SellAssetScreen(
                          assetId: assetId!,
                        )));
              },
              child: const Text(
                '매도',
                style: TextStyle(
                  color: AppColors.sell,
                ),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AddAssetScreen(
                          assetId: assetId,
                        )));
              },
              child: const Text(
                '매수',
                style: TextStyle(
                  color: AppColors.buy,
                ),
              )),
        ]
      ],
      child: ListView.builder(
        itemCount: assetsTransactions.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildListTile(
              context: context,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('총 ${assetsTransactions.length}건'),
                    const Text('실시간 기준'),
                  ],
                ),
              ),
            );
          }
          if (index == 1) {
            return buildListTile(
              context: context,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('총 금액'),
                    SizedBox(width: 10),
                    Text(
                      // addComma.format(totalAmt),
                      '-',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: 4),
                    Text('KRW'),
                  ],
                ),
              ),
            );
          }

          if (index > 1) {
            final transaction = assetsTransactions[index - 2];

            final cashTr = transaction.category.id ==
                categoryVm.foreignCashAsset.assetTypeId;

            return buildListTile(
              context: context,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 20, left: 30, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          DateFormat('yyyy-MM-dd')
                              .format(transaction.transactionDate!),
                          style: const TextStyle(fontFamily: 'Roboto'),
                        ),
                        Text(
                          DateFormat('HH:mm')
                              .format(transaction.transactionDate!),
                          style: const TextStyle(fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => handleMoreButton(transaction),
                            child: const SizedBox(
                              height: 10,
                              child: Icon(
                                Icons.more_horiz,
                                size: 18,
                              ),
                            ),
                          ),
                          cashTr
                              ? _buildCashAssetCategoryTR(transaction)
                              : _buildCommonAssetCategoryTR(transaction),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }

  Column _buildCommonAssetCategoryTR(AssetTransaction transaction) {
    final String type = transaction.typeToString() ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '',
          // transaction.name,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: type == '매수' ? AppColors.buy : AppColors.sell),
                ),
                const SizedBox(width: 6),
                Row(
                  children: [
                    Text(
                      addComma.format(transaction.quantity),
                      style: const TextStyle(fontFamily: 'Roboto'),
                    ),
                    const Text(
                      'units',
                      style: TextStyle(fontSize: 10, fontFamily: 'Roboto'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(transaction.singlePrice.toStringAsFixed(0),
                    style: const TextStyle(fontFamily: 'Roboto')),
                const Text(
                  '/1unit',
                  style: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('총 금액'),
            Row(
              children: [
                Text(addComma.format(transaction.totalTransactionPrice),
                    style: const TextStyle(fontFamily: 'Roboto')),
                const SizedBox(width: 4),
                Text(transaction.currencyCode,
                    style: const TextStyle(fontFamily: 'Roboto'))
              ],
            ),
          ],
        )
      ],
    );
  }

  Column _buildCashAssetCategoryTR(AssetTransaction transaction) {
    final String type = transaction.typeToString() ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          // transaction.name,
          '',
          overflow: TextOverflow.clip,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  type,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: type == '매수' ? AppColors.buy : AppColors.sell),
                ),
              ],
            ),
            Text('환율 ${transaction.exchangeRate}',
                style: const TextStyle(fontFamily: 'Roboto')),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('총 금액'),
            Row(
              children: [
                Text(addComma.format(transaction.totalTransactionPrice),
                    style: const TextStyle(fontFamily: 'Roboto')),
                const SizedBox(width: 4),
                Text(transaction.currencyCode,
                    style: const TextStyle(fontFamily: 'Roboto'))
              ],
            ),
          ],
        )
      ],
    );
  }

  Container buildListTile(
      {required BuildContext context, required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: child,
    );
  }
}
