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

import 'model/asset.dart';
import 'model/asset_to_transaction.dart';
import 'model/asset_transaction.dart';
import 'model/asset_type.dart';
import 'model/budget.dart';
import 'model/exchange_rate_response.dart';
import 'model/invitation.dart';
import 'model/transaction.dart';
import 'model/transaction_category.dart';
import 'model/user.dart';
import 'model/users_id_put_request.dart';
import 'model/users_post201_response.dart';
import 'model/users_post_request.dart';
import 'model/workspace.dart';
import 'model/workspace_id_asset_type_id_put_request.dart';
import 'model/workspace_id_asset_type_post_request.dart';
import 'model/workspace_id_assets_asset_id_transactions_id_delete201_response.dart';
import 'model/workspace_id_assets_asset_id_transactions_id_delete500_response.dart';
import 'model/workspace_id_assets_asset_id_transactions_id_put_request.dart';
import 'model/workspace_id_assets_id_put_request.dart';
import 'model/workspace_id_assets_monthly_trend_get200_response_inner.dart';
import 'model/workspace_id_assets_post_request.dart';
import 'model/workspace_id_budget_active_get200_response.dart';
import 'model/workspace_id_budget_active_get200_response_expendable_budget.dart';
import 'model/workspace_id_budget_post_request.dart';
import 'model/workspace_id_finance_category_id_put_request.dart';
import 'model/workspace_id_finance_category_post_request.dart';
import 'model/workspace_id_finance_id_put_request.dart';
import 'model/workspace_id_finance_monthly_month_key_get200_response.dart';
import 'model/workspace_id_finance_post_request.dart';
import 'model/workspace_id_invitation_id_put_request.dart';
import 'model/workspace_id_invitation_post_request.dart';
import 'model/workspaces_post201_response.dart';
import 'model/workspaces_post_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  Asset,
  AssetToTransaction,
  AssetTransaction,
  AssetType,
  Budget,
  ExchangeRateResponse,
  Invitation,
  Transaction,
  TransactionCategory,
  User,
  UsersIdPutRequest,
  UsersPost201Response,
  UsersPostRequest,
  Workspace,
  WorkspaceIdAssetTypeIdPutRequest,
  WorkspaceIdAssetTypePostRequest,
  WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response,
  WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response,
  WorkspaceIdAssetsAssetIdTransactionsIdPutRequest,
  WorkspaceIdAssetsIdPutRequest,
  WorkspaceIdAssetsMonthlyTrendGet200ResponseInner,
  WorkspaceIdAssetsPostRequest,
  WorkspaceIdBudgetActiveGet200Response,
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudget,
  WorkspaceIdBudgetPostRequest,
  WorkspaceIdFinanceCategoryIdPutRequest,
  WorkspaceIdFinanceCategoryPostRequest,
  WorkspaceIdFinanceIdPutRequest,
  WorkspaceIdFinanceMonthlyMonthKeyGet200Response,
  WorkspaceIdFinancePostRequest,
  WorkspaceIdInvitationIdPutRequest,
  WorkspaceIdInvitationPostRequest,
  WorkspacesPost201Response,
  WorkspacesPostRequest,
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
        const FullType(BuiltList,
            [FullType(WorkspaceIdAssetsMonthlyTrendGet200ResponseInner)]),
        () => ListBuilder<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Invitation)]),
        () => ListBuilder<Invitation>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Asset)]),
        () => ListBuilder<Asset>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
