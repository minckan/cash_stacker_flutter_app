import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';

import 'package:cash_stacker_flutter_app/portfolio/screen/edit_asset_transaction_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';

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

class AllAssetTransactionListScreen extends ConsumerWidget {
  const AllAssetTransactionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleMoreButton(AssetTransactionResponseType transaction) async {
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
      title: '전체 거래내역',
      child: FutureBuilder(
          future: ref.read(assetViewModelProvider.notifier).loadAssets(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('데이터가 없습니다'));
            }

            final assetTransactions = snapshot.data!.transaction;
            final totalAmt = snapshot.data!.total;

            return ListView.builder(
              itemCount: assetTransactions!.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildListTile(
                    context: context,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('총 ${assetTransactions.length}건'),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('총 금액'),
                          const SizedBox(width: 10),
                          Text(
                            addComma(totalAmt) ?? '0',
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
                  final transaction = assetTransactions[index - 2];

                  // final cashTr = transaction.category.id ==
                  //     categoryVm.foreignCashAsset.assetTypeId;

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
                                // cashTr
                                //     ? _buildCashAssetCategoryTR(transaction)
                                //     : _buildCommonAssetCategoryTR(transaction),
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
            );
          }),
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
