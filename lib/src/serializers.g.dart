// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ApiExchangeRatesGet200Response.serializer)
      ..add(Asset.serializer)
      ..add(AssetToTransaction.serializer)
      ..add(AssetTransaction.serializer)
      ..add(AssetType.serializer)
      ..add(Budget.serializer)
      ..add(Invitation.serializer)
      ..add(Transaction.serializer)
      ..add(TransactionCategory.serializer)
      ..add(User.serializer)
      ..add(UsersIdPutRequest.serializer)
      ..add(UsersPost201Response.serializer)
      ..add(UsersPostRequest.serializer)
      ..add(Workspace.serializer)
      ..add(WorkspaceIdAssetTypePostRequest.serializer)
      ..add(WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response.serializer)
      ..add(WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response.serializer)
      ..add(WorkspaceIdAssetsIdPutRequest.serializer)
      ..add(WorkspaceIdAssetsMonthlyTrendGet200ResponseInner.serializer)
      ..add(WorkspaceIdAssetsPostRequest.serializer)
      ..add(WorkspaceIdBudgetPostRequest.serializer)
      ..add(WorkspaceIdFinanceCategoryIdPutRequest.serializer)
      ..add(WorkspaceIdFinanceCategoryPostRequest.serializer)
      ..add(WorkspaceIdFinanceIdPutRequest.serializer)
      ..add(WorkspaceIdFinancePostRequest.serializer)
      ..add(WorkspaceIdInvitationIdPutRequest.serializer)
      ..add(WorkspaceIdInvitationPostRequest.serializer)
      ..add(WorkspacesPost201Response.serializer)
      ..add(WorkspacesPostRequest.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AssetToTransaction)]),
          () => new ListBuilder<AssetToTransaction>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AssetTransaction)]),
          () => new ListBuilder<AssetTransaction>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(num)]),
          () => new MapBuilder<String, num>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
