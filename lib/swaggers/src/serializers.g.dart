// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AllAssetsResponseType.serializer)
      ..add(Asset.serializer)
      ..add(AssetDetailResponseType.serializer)
      ..add(AssetInfo.serializer)
      ..add(AssetToTransaction.serializer)
      ..add(AssetTransaction.serializer)
      ..add(AssetTransactionRequest.serializer)
      ..add(AssetTransactionRequestTransactionTypeEnum.serializer)
      ..add(AssetTransactionResponseType.serializer)
      ..add(AssetTransactionResponseTypeTransactionTypeEnum.serializer)
      ..add(AssetType.serializer)
      ..add(Budget.serializer)
      ..add(CreateAssetReq.serializer)
      ..add(CreateAssetTypeReq.serializer)
      ..add(CreateBudgetReq.serializer)
      ..add(CreateFinancialTrackerCategoryReq.serializer)
      ..add(CreateFinancialTrackerTransactionReq.serializer)
      ..add(CreateInvitationReq.serializer)
      ..add(CreateUserRequest.serializer)
      ..add(CreateUserResponse.serializer)
      ..add(CreateWorkspaceReq.serializer)
      ..add(CreateWorkspaceRes.serializer)
      ..add(DeleteAssetTransaction201Response.serializer)
      ..add(DeleteAssetTransaction500Response.serializer)
      ..add(ExchangeRateResponse.serializer)
      ..add(ExchangeRateResponseResultEnum.serializer)
      ..add(ExpendableBudget.serializer)
      ..add(GetActiveBudgetRes.serializer)
      ..add(GetDailyTransactions200Response.serializer)
      ..add(GetMonthlyAssetTransactionRes.serializer)
      ..add(GetMonthlyAssetTrend200ResponseInner.serializer)
      ..add(Invitation.serializer)
      ..add(InvitationCreationResponse.serializer)
      ..add(InvitationCreationResponseStatusEnum.serializer)
      ..add(InvitationTokenVerifyResponse.serializer)
      ..add(Portfolio.serializer)
      ..add(PortfolioRatiosValue.serializer)
      ..add(Transaction.serializer)
      ..add(TransactionCategory.serializer)
      ..add(UpdateAssetRes.serializer)
      ..add(UpdateAssetTransactionByIdReq.serializer)
      ..add(UpdateAssetTypeReq.serializer)
      ..add(UpdateBudgetRequest.serializer)
      ..add(UpdateFinancialTrackerCategoryReq.serializer)
      ..add(UpdateFinancialTrackerTransactionReq.serializer)
      ..add(UpdateUserRequest.serializer)
      ..add(User.serializer)
      ..add(VerifyInvitationTokenReq.serializer)
      ..add(Workspace.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AssetTransactionResponseType)]),
          () => new ListBuilder<AssetTransactionResponseType>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AssetTransactionResponseType)]),
          () => new ListBuilder<AssetTransactionResponseType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Transaction)]),
          () => new ListBuilder<Transaction>())
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
