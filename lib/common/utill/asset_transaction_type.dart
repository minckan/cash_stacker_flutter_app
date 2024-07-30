import 'package:cash_stacker_flutter_app/swaggers/src/model/asset_transaction_response_type.dart';

String formatType(AssetTransactionResponseTypeTransactionTypeEnum type) {
  return type.name == 'buy' ? '매수' : '매도';
}
