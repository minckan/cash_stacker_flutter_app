import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:flutter/material.dart';

class EditAssetTransactionScreen extends StatelessWidget {
  final AssetTransaction assetTransaction;
  const EditAssetTransactionScreen({
    super.key,
    required this.assetTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      isFormView: true,
      title: '자산 거래내역 수정',
      child: Center(
        child: Text(''
            // assetTransaction,
            ),
      ),
    );
  }
}
