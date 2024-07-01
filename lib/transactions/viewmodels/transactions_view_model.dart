import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/repository/finance_tracker_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/transaction.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_monthly_month_key_get200_response.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_post_request.dart';

import 'package:cash_stacker_flutter_app/transactions/providers/transaction_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final transactionStateProvider =
    StateNotifierProvider<TransactionStateNotifier, TransactionState>(
  (ref) => TransactionStateNotifier(ref),
);

class TransactionStateNotifier extends StateNotifier<TransactionState> {
  final Ref _ref;

  TransactionStateNotifier(this._ref)
      : super(TransactionState(
          monthlyResponse: WorkspaceIdFinanceMonthlyMonthKeyGet200Response(
              (b) => b..transactions = ListBuilder()),
          dailyResponse: WorkspaceIdFinanceMonthlyMonthKeyGet200Response(
              (b) => b..transactions = ListBuilder()),
          monthlyCache: {},
          dailyCache: {},
        ));

  /// 월별 데이터를 일자별로 소팅한 데이터
  ///  TransactionSummary
  List<TransactionSummary> getMonthlyTransactionsInfo() {
    final monthlyResponse = state.monthlyResponse;
    Map<String, List<Transaction>> groupedTransactions = {};

    monthlyResponse.transactions?.forEach((transaction) {
      final String dateKey =
          DateFormat('yyyy-MM-dd').format(transaction.transactionDate!);

      if (!groupedTransactions.containsKey(dateKey)) {
        groupedTransactions[dateKey] = [];
      }
      groupedTransactions[dateKey]!.add(transaction);
    });

    List<TransactionSummary> summaries = [];

    groupedTransactions.forEach((dateStr, transactions) {
      double totalIncome = 0;
      double totalExpense = 0;

      for (var transaction in transactions) {
        double amount = transaction.amount!;

        if (transaction.transactionType == 'income') {
          totalIncome += amount;
        } else if (transaction.transactionType == 'expense') {
          totalExpense += amount;
        }
      }

      double netIncome = totalIncome - totalExpense;
      DateTime date = transactions[0].transactionDate!;

      summaries.add(TransactionSummary(
        date: date,
        income: totalIncome,
        expense: totalExpense,
        total: netIncome,
        transactions: transactions,
      ));
    });

    return summaries;
  }

  Future<void> loadMonthlyTransactions(
      String workspaceId, DateTime month) async {
    final monthKey = getMonth(month);

    // 캐시에서 데이터 확인
    final cachedData = state.monthlyCache[monthKey];
    if (cachedData != null) {
      state = state.copyWith(monthlyResponse: cachedData);
      return;
    }

    // API 호출
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    final response = await financialTrackerRep.getAllMonthlyTransactions(
      workspaceId: workspaceId,
      monthKey: monthKey,
    );

    if (response.data != null) {
      final newMonthlyCache =
          Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
        state.monthlyCache,
      )..[monthKey] = response.data!;
      state = state.copyWith(
        monthlyResponse: response.data!,
        monthlyCache: newMonthlyCache,
      );
    }
  }

  Future<void> loadDailyTransactions(String workspaceId, DateTime date) async {
    final dateKey = DateFormat('yyyy-MM-dd').format(date);

    // 캐시에서 데이터 확인
    final cachedData = state.dailyCache[dateKey];
    if (cachedData != null) {
      state = state.copyWith(dailyResponse: cachedData);
      return;
    }

    // API 호출
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    final response = await financialTrackerRep.getDailyTransactions(
      workspaceId: workspaceId,
      dateKey: dateKey,
    );

    if (response.data != null) {
      final newDailyCache =
          Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
              state.dailyCache)
            ..[dateKey] = response.data!;
      state = state.copyWith(
        dailyResponse: response.data!,
        dailyCache: newDailyCache,
      );
    }
  }

  Future<void> addTransaction({
    required WorkspaceIdFinancePostRequest transaction,
    required String workspaceId,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    final response = await financialTrackerRep.createTransaction(
      workspaceId: workspaceId,
      body: transaction,
    );

    if (response.data != null) {
      final newTransaction = response.data!;
      final transactionDate = newTransaction.transactionDate!;

      // 현재 상태의 월과 일 데이터인지 확인
      final isCurrentMonth =
          getMonth(transactionDate) == getMonth(DateTime.now());
      final isCurrentDay = DateFormat('yyyy-MM-dd').format(transactionDate) ==
          DateFormat('yyyy-MM-dd').format(DateTime.now());

      if (isCurrentMonth) {
        final updatedTransactions = state.monthlyResponse.transactions
                ?.toBuilder() ??
            ListBuilder<Transaction>()
          ..add(newTransaction);

        state = state.copyWith(
          monthlyResponse: state.monthlyResponse
              .rebuild((b) => b..transactions = updatedTransactions),
        );

        // 캐시 업데이트
        final monthKey = getMonth(transactionDate);
        final newMonthlyCache =
            Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
                state.monthlyCache)
              ..[monthKey] = state.monthlyResponse
                  .rebuild((b) => b..transactions = updatedTransactions);
        state = state.copyWith(monthlyCache: newMonthlyCache);
      }

      if (isCurrentDay) {
        final updatedDailyTransactions = state.dailyResponse.transactions
                ?.toBuilder() ??
            ListBuilder<Transaction>()
          ..add(newTransaction);

        state = state.copyWith(
          dailyResponse: state.dailyResponse
              .rebuild((b) => b..transactions = updatedDailyTransactions),
        );

        // 캐시 업데이트
        final dateKey = DateFormat('yyyy-MM-dd').format(transactionDate);
        final newDailyCache =
            Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
                state.dailyCache)
              ..[dateKey] = state.dailyResponse
                  .rebuild((b) => b..transactions = updatedDailyTransactions);
        state = state.copyWith(dailyCache: newDailyCache);
      }
    }
  }

  Future<void> updateTransaction({
    required int transactionId,
    required String workspaceId,
    required WorkspaceIdFinanceIdPutRequest modifiedData,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);

    final response = await financialTrackerRep.updateTransaction(
      workspaceId: workspaceId,
      id: transactionId,
      body: modifiedData,
    );

    if (response.data != null) {
      final updatedTransaction = response.data!;
      final transactionDate = updatedTransaction.transactionDate!;

      // 현재 상태의 월과 일 데이터인지 확인
      final isCurrentMonth =
          getMonth(transactionDate) == getMonth(DateTime.now());
      final isCurrentDay = DateFormat('yyyy-MM-dd').format(transactionDate) ==
          DateFormat('yyyy-MM-dd').format(DateTime.now());

      if (isCurrentMonth) {
        final updatedTransactions = (state.monthlyResponse.transactions
                ?.toBuilder() ??
            ListBuilder<Transaction>())
          ..update((list) {
            list.replace(state.monthlyResponse.transactions!.map((t) =>
                t.transactionId == transactionId ? updatedTransaction : t));
          });

        state = state.copyWith(
          monthlyResponse: state.monthlyResponse
              .rebuild((b) => b..transactions = updatedTransactions),
        );

        // 캐시 업데이트
        final monthKey = getMonth(transactionDate);
        final newMonthlyCache =
            Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
                state.monthlyCache)
              ..[monthKey] = state.monthlyResponse
                  .rebuild((b) => b..transactions = updatedTransactions);
        state = state.copyWith(monthlyCache: newMonthlyCache);
      }

      if (isCurrentDay) {
        final updatedDailyTransactions = (state.dailyResponse.transactions
                ?.toBuilder() ??
            ListBuilder<Transaction>())
          ..update((list) {
            list.replace(state.dailyResponse.transactions!.map((t) =>
                t.transactionId == transactionId ? updatedTransaction : t));
          });

        state = state.copyWith(
          dailyResponse: state.dailyResponse
              .rebuild((b) => b..transactions = updatedDailyTransactions),
        );

        // 캐시 업데이트
        final dateKey = DateFormat('yyyy-MM-dd').format(transactionDate);
        final newDailyCache =
            Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
                state.dailyCache)
              ..[dateKey] = state.dailyResponse
                  .rebuild((b) => b..transactions = updatedDailyTransactions);
        state = state.copyWith(dailyCache: newDailyCache);
      }
    }
  }

  Future<void> deleteTransaction({
    required int transactionId,
    required String workspaceId,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    await financialTrackerRep.deleteTransaction(
        workspaceId: workspaceId, id: transactionId);

    final transactionDate = DateTime.now(); // 실제 트랜잭션의 날짜를 가져와야 함
    final isCurrentMonth =
        getMonth(transactionDate) == getMonth(DateTime.now());
    final isCurrentDay = DateFormat('yyyy-MM-dd').format(transactionDate) ==
        DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (isCurrentMonth) {
      final updatedTransactions = (state.monthlyResponse.transactions
              ?.toBuilder() ??
          ListBuilder<Transaction>())
        ..update((list) {
          list.replace(state.monthlyResponse.transactions!
              .where((t) => t.transactionId != transactionId));
        });

      state = state.copyWith(
        monthlyResponse: state.monthlyResponse
            .rebuild((b) => b..transactions = updatedTransactions),
      );

      // 캐시 업데이트
      final monthKey = getMonth(transactionDate);
      final newMonthlyCache =
          Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
              state.monthlyCache)
            ..[monthKey] = state.monthlyResponse
                .rebuild((b) => b..transactions = updatedTransactions);
      state = state.copyWith(monthlyCache: newMonthlyCache);
    }

    if (isCurrentDay) {
      final updatedDailyTransactions = (state.dailyResponse.transactions
              ?.toBuilder() ??
          ListBuilder<Transaction>())
        ..update((list) {
          list.replace(state.dailyResponse.transactions!
              .where((t) => t.transactionId != transactionId));
        });

      state = state.copyWith(
        dailyResponse: state.dailyResponse
            .rebuild((b) => b..transactions = updatedDailyTransactions),
      );

      // 캐시 업데이트
      final dateKey = DateFormat('yyyy-MM-dd').format(transactionDate);
      final newDailyCache =
          Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
              state.dailyCache)
            ..[dateKey] = state.dailyResponse
                .rebuild((b) => b..transactions = updatedDailyTransactions);
      state = state.copyWith(dailyCache: newDailyCache);
    }
  }

  void clear() {
    state = TransactionState(
      monthlyResponse: WorkspaceIdFinanceMonthlyMonthKeyGet200Response((b) => b
        ..netTotal = 0
        ..expense = 0
        ..income = 0
        ..transactions = ListBuilder<Transaction>()),
      dailyResponse: WorkspaceIdFinanceMonthlyMonthKeyGet200Response((b) => b
        ..netTotal = 0
        ..expense = 0
        ..income = 0
        ..transactions = ListBuilder<Transaction>()),
      monthlyCache: {},
      dailyCache: {},
    );
  }
}

class TransactionSummary {
  final DateTime date;
  final double income;
  final double expense;
  final double total;
  final List<Transaction> transactions;

  TransactionSummary({
    required this.date,
    required this.income,
    required this.expense,
    required this.total,
    required this.transactions,
  });
}
