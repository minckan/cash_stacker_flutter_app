// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Asset.serializer)
      ..add(AssetInfo.serializer)
      ..add(AssetToTransaction.serializer)
      ..add(AssetTransaction.serializer)
      ..add(AssetTransactionRequest.serializer)
      ..add(AssetTransactionRequestTransactionTypeEnum.serializer)
      ..add(AssetType.serializer)
      ..add(Budget.serializer)
      ..add(ExchangeRateResponse.serializer)
      ..add(ExchangeRateResponseResultEnum.serializer)
      ..add(Invitation.serializer)
      ..add(Portfolio.serializer)
      ..add(PortfolioRatiosValue.serializer)
      ..add(Transaction.serializer)
      ..add(TransactionCategory.serializer)
      ..add(User.serializer)
      ..add(UsersIdPutRequest.serializer)
      ..add(UsersPost201Response.serializer)
      ..add(UsersPostRequest.serializer)
      ..add(Workspace.serializer)
      ..add(WorkspaceIdAssetTypeIdPutRequest.serializer)
      ..add(WorkspaceIdAssetTypePostRequest.serializer)
      ..add(WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response.serializer)
      ..add(WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response.serializer)
      ..add(WorkspaceIdAssetsAssetIdTransactionsIdPutRequest.serializer)
      ..add(WorkspaceIdAssetsIdPutRequest.serializer)
      ..add(WorkspaceIdAssetsMonthlyTrendGet200ResponseInner.serializer)
      ..add(WorkspaceIdAssetsPostRequest.serializer)
      ..add(WorkspaceIdBudgetActiveGet200Response.serializer)
      ..add(WorkspaceIdBudgetActiveGet200ResponseExpendableBudget.serializer)
      ..add(WorkspaceIdBudgetPostRequest.serializer)
      ..add(WorkspaceIdFinanceCategoryIdPutRequest.serializer)
      ..add(WorkspaceIdFinanceCategoryPostRequest.serializer)
      ..add(WorkspaceIdFinanceIdPutRequest.serializer)
      ..add(WorkspaceIdFinanceMonthlyMonthKeyGet200Response.serializer)
      ..add(WorkspaceIdFinancePostRequest.serializer)
      ..add(WorkspaceIdInvitationIdPutRequest.serializer)
      ..add(WorkspaceIdInvitationPostRequest.serializer)
      ..add(WorkspacesPost201Response.serializer)
      ..add(WorkspacesPostRequest.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Transaction)]),
          () => new ListBuilder<Transaction>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(PortfolioRatiosValue)
          ]),
          () => new MapBuilder<String, PortfolioRatiosValue>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AssetInfo)]),
          () => new ListBuilder<AssetInfo>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
