import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/repository/finance_tracker_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/transaction.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_monthly_month_key_get200_response.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_post_request.dart';

import 'package:cash_stacker_flutter_app/transactions/model/transaction_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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

final transactionStateProvider =
    StateNotifierProvider<TransactionStateNotifier, TransactionStateBase>(
  (ref) => TransactionStateNotifier(ref),
);

class TransactionStateNotifier extends StateNotifier<TransactionStateBase> {
  final Ref _ref;

  TransactionStateNotifier(this._ref) : super(TransactionStateLoading());

  String? get workspaceId {
    return _ref.read(workspaceViewModelProvider)?.workspaceId;
  }

  /// 월별 데이터를 일자별로 소팅한 데이터
  ///  TransactionSummary
  List<TransactionSummary>? getMonthlyTransactionsInfo() {
    if (state is TransactionState) {
      final monthlyResponse = (state as TransactionState).monthlyResponse;

      Map<String, List<Transaction>> groupedTransactions = {};

      monthlyResponse?.transactions?.forEach((transaction) {
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

        summaries.sort((a, b) => b.date.compareTo(a.date));
      });

      return summaries;
    } else {
      return null;
    }
  }

  Future<void> loadMonthlyTransactions(
    DateTime month,
  ) async {
    final monthKey = getMonth(month);

    // 캐시에서 데이터 확인
    final cachedData = state is TransactionState
        ? (state as TransactionState).monthlyCache
        : null;

    if (cachedData?[monthKey] != null) {
      state = TransactionState(
        monthlyResponse: cachedData![monthKey],
        monthlyCache: (state as TransactionState).monthlyCache,
        dailyCache: (state as TransactionState).dailyCache,
      );
      return;
    }

    Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response> previousCache =
        {};

    if (cachedData != null) {
      previousCache = {
        ...(state is TransactionState
            ? (state as TransactionState).monthlyCache ?? {}
            : {})
      };
    }

    // 상태를 로딩 상태로 설정
    state = TransactionStateLoading();

    try {
      if (workspaceId == null) {
        return;
      }
      // API 호출
      final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
      final response = await financialTrackerRep.getAllMonthlyTransactions(
        workspaceId: workspaceId!,
        monthKey: monthKey,
      );

      if (response.data != null) {
        final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>
            newMonthlyCache = {
          ...previousCache,
          monthKey: response.data!,
        };

        state = TransactionState(
          monthlyResponse: response.data!,
          monthlyCache: newMonthlyCache,
        );
      } else {
        state = TransactionStateError(
          errorMessage: 'Failed to load monthly transactions',
        );
      }
    } catch (e) {
      state = TransactionStateError(
        errorMessage: 'An error occurred: $e',
      );
    }
  }

  Future<void> loadDailyTransactions(DateTime date) async {
    final dateKey = DateFormat('yyyy-MM-dd').format(date);

    if (state is TransactionState) {
      final currentState = state as TransactionState;

      // 캐시에서 데이터 확인
      final cachedData = currentState.dailyCache?[dateKey];
      if (cachedData != null) {
        state = TransactionState(
          monthlyResponse: currentState.monthlyResponse,
          dailyResponse: cachedData,
          monthlyCache: currentState.monthlyCache,
          dailyCache: currentState.dailyCache,
        );
        return;
      }

      // API 호출
      if (workspaceId == null) {
        return;
      }
      try {
        final financialTrackerRep =
            _ref.read(financialTrackerRepositoryProvider);
        final response = await financialTrackerRep.getDailyTransactions(
          workspaceId: workspaceId!,
          dateKey: dateKey,
        );

        if (response.data != null) {
          final newDailyCache =
              Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
            currentState.dailyCache ?? {},
          )..[dateKey] = response.data!;

          state = TransactionState(
            monthlyResponse: currentState.monthlyResponse,
            dailyResponse: response.data!,
            monthlyCache: currentState.monthlyCache,
            dailyCache: newDailyCache,
          );
        } else {
          state = TransactionStateError(errorMessage: "No data found");
        }
      } catch (e) {
        state = TransactionStateError(errorMessage: e.toString());
      }
    }
  }

  Future<void> addTransaction({
    required WorkspaceIdFinancePostRequest transaction,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    if (workspaceId == null) {
      return;
    }
    try {
      final response = await financialTrackerRep.createTransaction(
        workspaceId: workspaceId!,
        body: transaction,
      );

      if (response.data != null) {
        final newTransaction = response.data;

        if (newTransaction != null && newTransaction.transactionDate != null) {
          final transactionDate = newTransaction.transactionDate!;

          // 현재 상태의 월과 일 데이터인지 확인
          final isCurrentMonth =
              getMonth(transactionDate) == getMonth(DateTime.now());
          final isCurrentDay =
              DateFormat('yyyy-MM-dd').format(transactionDate) ==
                  DateFormat('yyyy-MM-dd').format(DateTime.now());

          if (state is TransactionState) {
            final currentState = state as TransactionState;

            if (isCurrentMonth) {
              final updatedTransactions =
                  currentState.monthlyResponse?.transactions?.toBuilder() ??
                      ListBuilder<Transaction>()
                    ..add(newTransaction);

              final currentExpenses =
                  currentState.monthlyResponse?.expense ?? 0;
              final currentIncomes = currentState.monthlyResponse?.income ?? 0;

              final updatedMonthlyResponse =
                  currentState.monthlyResponse?.rebuild(
                (b) => b
                  ..transactions = updatedTransactions
                  ..expense = newTransaction.transactionType == 'expense'
                      ? currentExpenses + num.parse('${newTransaction.amount}')
                      : currentExpenses
                  ..income = newTransaction.transactionType == 'income'
                      ? currentIncomes + num.parse('${newTransaction.amount}')
                      : currentIncomes,
              );

              if (updatedMonthlyResponse != null) {
                final newMonthlyCache = Map<String,
                    WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
                  currentState.monthlyCache ?? {},
                )..[getMonth(transactionDate)] = updatedMonthlyResponse;

                state = TransactionState(
                  monthlyResponse: updatedMonthlyResponse,
                  dailyResponse: currentState.dailyResponse,
                  monthlyCache: newMonthlyCache,
                  dailyCache: currentState.dailyCache,
                );
              }
            }

            if (isCurrentDay) {
              final updatedDailyTransactions =
                  currentState.dailyResponse?.transactions?.toBuilder() ??
                      ListBuilder<Transaction>()
                    ..add(newTransaction);

              final updatedDailyResponse = currentState.dailyResponse?.rebuild(
                (b) => b..transactions = updatedDailyTransactions,
              );

              if (updatedDailyResponse != null) {
                final newDailyCache = Map<String,
                    WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
                  currentState.dailyCache ?? {},
                )..[DateFormat('yyyy-MM-dd').format(transactionDate)] =
                    updatedDailyResponse;

                state = TransactionState(
                  monthlyResponse: currentState.monthlyResponse,
                  dailyResponse: updatedDailyResponse,
                  monthlyCache: currentState.monthlyCache,
                  dailyCache: newDailyCache,
                );
              }
            }
          }
        } else {
          state = TransactionStateError(
            errorMessage:
                '[Create Transaction]: Null transaction or transaction date',
          );
        }
      }
    } catch (e) {
      state = TransactionStateError(
          errorMessage: '[Create Transaction]: ${e.toString()}');
    }
  }

  Future<void> updateTransaction({
    required int transactionId,
    required WorkspaceIdFinanceIdPutRequest modifiedData,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    if (workspaceId == null) {
      return;
    }
    try {
      final response = await financialTrackerRep.updateTransaction(
        workspaceId: workspaceId!,
        id: transactionId,
        body: modifiedData,
      );

      if (response.data != null) {
        final updatedTransaction = response.data!;
        final transactionDate = updatedTransaction.transactionDate!;

        final isCurrentMonth =
            getMonth(transactionDate) == getMonth(DateTime.now());
        final isCurrentDay = DateFormat('yyyy-MM-dd').format(transactionDate) ==
            DateFormat('yyyy-MM-dd').format(DateTime.now());

        if (state is TransactionState) {
          final currentState = state as TransactionState;

          if (isCurrentMonth) {
            final updatedTransactions =
                currentState.monthlyResponse?.transactions?.toBuilder() ??
                    ListBuilder<Transaction>()
                  ..update((list) {
                    list.replace(currentState.monthlyResponse!.transactions!
                        .map((t) => t.transactionId == transactionId
                            ? updatedTransaction
                            : t));
                  });

            final updatedMonthlyResponse =
                currentState.monthlyResponse?.rebuild(
              (b) => b..transactions = updatedTransactions,
            );

            final newMonthlyCache = Map<String,
                WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
              currentState.monthlyCache ?? {},
            )..[getMonth(transactionDate)] = updatedMonthlyResponse!;

            state = TransactionState(
              monthlyResponse: updatedMonthlyResponse,
              dailyResponse: currentState.dailyResponse,
              monthlyCache: newMonthlyCache,
              dailyCache: currentState.dailyCache,
            );
          }

          if (isCurrentDay) {
            final updatedDailyTransactions =
                currentState.dailyResponse?.transactions?.toBuilder() ??
                    ListBuilder<Transaction>()
                  ..update((list) {
                    list.replace(currentState.dailyResponse!.transactions!.map(
                        (t) => t.transactionId == transactionId
                            ? updatedTransaction
                            : t));
                  });

            final updatedDailyResponse = currentState.dailyResponse?.rebuild(
              (b) => b..transactions = updatedDailyTransactions,
            );

            final newDailyCache = Map<String,
                WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
              currentState.dailyCache ?? {},
            )..[DateFormat('yyyy-MM-dd').format(transactionDate)] =
                updatedDailyResponse!;

            state = TransactionState(
              monthlyResponse: currentState.monthlyResponse,
              dailyResponse: updatedDailyResponse,
              monthlyCache: currentState.monthlyCache,
              dailyCache: newDailyCache,
            );
          }
        }
      }
    } catch (e) {
      state = TransactionStateError(errorMessage: e.toString());
    }
  }

  Future<void> deleteTransaction({
    required int transactionId,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    if (workspaceId == null) {
      return;
    }
    try {
      await financialTrackerRep.deleteTransaction(
          workspaceId: workspaceId!, id: transactionId);

      final transactionDate = DateTime.now(); // 실제 트랜잭션의 날짜를 가져와야 함
      final isCurrentMonth =
          getMonth(transactionDate) == getMonth(DateTime.now());
      final isCurrentDay = DateFormat('yyyy-MM-dd').format(transactionDate) ==
          DateFormat('yyyy-MM-dd').format(DateTime.now());

      if (state is TransactionState) {
        final currentState = state as TransactionState;

        if (isCurrentMonth) {
          final updatedTransactions =
              (currentState.monthlyResponse?.transactions?.toBuilder() ??
                  ListBuilder<Transaction>())
                ..update((list) {
                  list.replace(currentState.monthlyResponse!.transactions!
                      .where((t) => t.transactionId != transactionId));
                });

          final updatedMonthlyResponse = currentState.monthlyResponse?.rebuild(
            (b) => b..transactions = updatedTransactions,
          );

          final newMonthlyCache =
              Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
            currentState.monthlyCache ?? {},
          )..[getMonth(transactionDate)] = updatedMonthlyResponse!;

          state = TransactionState(
            monthlyResponse: updatedMonthlyResponse,
            dailyResponse: currentState.dailyResponse,
            monthlyCache: newMonthlyCache,
            dailyCache: currentState.dailyCache,
          );
        }

        if (isCurrentDay) {
          final updatedDailyTransactions =
              (currentState.dailyResponse?.transactions?.toBuilder() ??
                  ListBuilder<Transaction>())
                ..update((list) {
                  list.replace(currentState.dailyResponse!.transactions!
                      .where((t) => t.transactionId != transactionId));
                });

          final updatedDailyResponse = currentState.dailyResponse?.rebuild(
            (b) => b..transactions = updatedDailyTransactions,
          );

          final newDailyCache =
              Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>.from(
            currentState.dailyCache ?? {},
          )..[DateFormat('yyyy-MM-dd').format(transactionDate)] =
                  updatedDailyResponse!;

          state = TransactionState(
            monthlyResponse: currentState.monthlyResponse,
            dailyResponse: updatedDailyResponse,
            monthlyCache: currentState.monthlyCache,
            dailyCache: newDailyCache,
          );
        }
      }
    } catch (e) {
      state = TransactionStateError(errorMessage: e.toString());
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
