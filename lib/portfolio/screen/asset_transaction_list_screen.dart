import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AssetTransactionListScreen extends ConsumerWidget {
  const AssetTransactionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsTransactions =
        ref.read(assetViewModelProvider.notifier).getAllAssetTransactions();
    logger.d(assetsTransactions.length);
    return DefaultLayout(
      title: '거래내역',
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
                      '3,999,999',
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'KODEX 미국 30년 국채 울트라 선물(H)',
                            overflow: TextOverflow.clip,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(transaction.typeToString() ?? ''),
                                  const Text('950'),
                                ],
                              ),
                              const Text('주당 7,730'),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 금액'),
                              Row(
                                children: [Text('7,343,500'), Text('KRW')],
                              ),
                            ],
                          )
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
