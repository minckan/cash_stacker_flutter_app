import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/add_asset_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AssetTransactionListScreen extends ConsumerWidget {
  AssetTransactionListScreen({super.key, this.assetId});

  String? assetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryVm = ref.read(categoryViewModelProvider.notifier);
    List<AssetTransaction> assetsTransactions =
        ref.watch(assetTransactionViewModelProvider);
    final assetTrVm = ref.read(assetTransactionViewModelProvider.notifier);
    if (assetId != null) {
      assetsTransactions = assetTrVm.getParticularAssetTransactions(assetId!);
    }
    double totalAmt = assetTrVm.getAllTransactionKrwAmt(assetsTransactions);

    return DefaultLayout(
      title: '거래내역',
      actions: [
        if (assetId != null)
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AddAssetScreen(
                          assetId: assetId,
                        )));
              },
              icon: const Icon(Icons.add))
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('총 금액'),
                    const SizedBox(width: 10),
                    Text(
                      addComma.format(totalAmt),
                      style: const TextStyle(fontFamily: 'Roboto'),
                    ),
                    const SizedBox(width: 4),
                    const Text('KRW'),
                  ],
                ),
              ),
            );
          }

          if (index > 1) {
            final transaction = assetsTransactions[index - 2];
            final cashTr = transaction.category.id == categoryVm.cashAsset.id;

            return buildListTile(
              context: context,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                          DateFormat('yyyy-MM-dd').format(transaction.date)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: cashTr
                          ? _buildCashAssetCategotyTR(transaction)
                          : _buildCommonAssetCategoryTR(transaction),
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
        Text(
          transaction.name,
          overflow: TextOverflow.clip,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  type,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: type == '매수' ? AppColors.buy : AppColors.sell),
                ),
                const SizedBox(width: 2),
                Text(addComma.format(transaction.quantity)),
              ],
            ),
            Text('${transaction.singlePrice} per 1unit'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('총 금액'),
            Row(
              children: [
                Text(addComma.format(transaction.totalTransactionPrice)),
                Text(transaction.currency.currencyCode)
              ],
            ),
          ],
        )
      ],
    );
  }

  Column _buildCashAssetCategotyTR(AssetTransaction transaction) {
    final String type = transaction.typeToString() ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transaction.name,
          overflow: TextOverflow.clip,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text('환율 ${transaction.exchangeRate}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('총 금액'),
            Row(
              children: [
                Text(addComma.format(transaction.totalTransactionPrice)),
                Text(transaction.currency.currencyCode)
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
