//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'date_serializer.dart';
import 'model/date.dart';

import 'model/all_assets_response_type.dart';
import 'model/asset.dart';
import 'model/asset_detail_response_type.dart';
import 'model/asset_info.dart';
import 'model/asset_to_transaction.dart';
import 'model/asset_transaction.dart';
import 'model/asset_transaction_request.dart';
import 'model/asset_transaction_response_type.dart';
import 'model/asset_type.dart';
import 'model/budget.dart';
import 'model/create_asset_req.dart';
import 'model/create_asset_type_req.dart';
import 'model/create_budget_req.dart';
import 'model/create_financial_tracker_category_req.dart';
import 'model/create_financial_tracker_transaction_req.dart';
import 'model/create_invitation_req.dart';
import 'model/create_user_request.dart';
import 'model/create_user_response.dart';
import 'model/create_workspace_req.dart';
import 'model/create_workspace_res.dart';
import 'model/delete_asset_transaction201_response.dart';
import 'model/delete_asset_transaction500_response.dart';
import 'model/exchange_rate_response.dart';
import 'model/expendable_budget.dart';
import 'model/get_active_budget_res.dart';
import 'model/get_daily_transactions200_response.dart';
import 'model/get_monthly_asset_transaction_res.dart';
import 'model/get_monthly_asset_trend200_response_inner.dart';
import 'model/invitation.dart';
import 'model/invitation_creation_response.dart';
import 'model/invitation_token_verify_response.dart';
import 'model/portfolio.dart';
import 'model/portfolio_ratios_value.dart';
import 'model/transaction.dart';
import 'model/transaction_category.dart';
import 'model/update_asset_res.dart';
import 'model/update_asset_transaction_by_id_req.dart';
import 'model/update_asset_type_req.dart';
import 'model/update_budget_request.dart';
import 'model/update_financial_tracker_category_req.dart';
import 'model/update_financial_tracker_transaction_req.dart';
import 'model/update_user_request.dart';
import 'model/user.dart';
import 'model/verify_invitation_token_req.dart';
import 'model/workspace.dart';

part 'serializers.g.dart';

@SerializersFor([
  AllAssetsResponseType,
  Asset,
  AssetDetailResponseType,
  AssetInfo,
  AssetToTransaction,
  AssetTransaction,
  AssetTransactionRequest,
  AssetTransactionResponseType,
  AssetType,
  Budget,
  CreateAssetReq,
  CreateAssetTypeReq,
  CreateBudgetReq,
  CreateFinancialTrackerCategoryReq,
  CreateFinancialTrackerTransactionReq,
  CreateInvitationReq,
  CreateUserRequest,
  CreateUserResponse,
  CreateWorkspaceReq,
  CreateWorkspaceRes,
  DeleteAssetTransaction201Response,
  DeleteAssetTransaction500Response,
  ExchangeRateResponse,
  ExpendableBudget,
  GetActiveBudgetRes,
  GetDailyTransactions200Response,
  GetMonthlyAssetTransactionRes,
  GetMonthlyAssetTrend200ResponseInner,
  Invitation,
  InvitationCreationResponse,
  InvitationTokenVerifyResponse,
  Portfolio,
  PortfolioRatiosValue,
  Transaction,
  TransactionCategory,
  UpdateAssetRes,
  UpdateAssetTransactionByIdReq,
  UpdateAssetTypeReq,
  UpdateBudgetRequest,
  UpdateFinancialTrackerCategoryReq,
  UpdateFinancialTrackerTransactionReq,
  UpdateUserRequest,
  User,
  VerifyInvitationTokenReq,
  Workspace,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TransactionCategory)]),
        () => ListBuilder<TransactionCategory>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Budget)]),
        () => ListBuilder<Budget>(),
      )
      ..addBuilderFactory(
        const FullType(
            BuiltList, [FullType(GetMonthlyAssetTrend200ResponseInner)]),
        () => ListBuilder<GetMonthlyAssetTrend200ResponseInner>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AssetType)]),
        () => ListBuilder<AssetType>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Workspace)]),
        () => ListBuilder<Workspace>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ExchangeRateResponse)]),
        () => ListBuilder<ExchangeRateResponse>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Invitation)]),
        () => ListBuilder<Invitation>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
