import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_post_request.dart';

import 'package:cash_stacker_flutter_app/transactions/component/add_expense_tab.dart';
import 'package:cash_stacker_flutter_app/transactions/component/add_income_tab.dart';
import 'package:cash_stacker_flutter_app/transactions/model/transaction_state.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({
    super.key,
    required this.transactionType,
  });

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();

  final TransactionType transactionType;
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen>
    with SingleTickerProviderStateMixin {
  Uuid uuid = const Uuid();
  late TabController tabController = TabController(length: 2, vsync: this);
  final GlobalKey<AddIncomeTabState> _addIncomeTabKey =
      GlobalKey<AddIncomeTabState>();
  final GlobalKey<AddExpenseTabState> _addExpenseTabKey =
      GlobalKey<AddExpenseTabState>();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    tabController.animateTo(widget.transactionType.index);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void handleSubmit() async {
    WorkspaceIdFinancePostRequest transaction;

    if (_addIncomeTabKey.currentState != null &&
        _addIncomeTabKey.currentState?.selectedCategory != null) {
      final incomePrice = _addIncomeTabKey.currentState!.priceController.text;
      final selectedIncomeCategory =
          _addIncomeTabKey.currentState!.selectedCategory;

      transaction = WorkspaceIdFinancePostRequest(
        (b) => b
          ..categoryId = selectedIncomeCategory!.categoryId
          ..amount = double.parse(incomePrice)
          ..transactionType = 'income'
          ..description = ''
          ..transactionDate = selectedDate.toUtc(),
      );

      await ref
          .read(transactionStateProvider.notifier)
          .addTransaction(transaction: transaction);
    }

    if (_addExpenseTabKey.currentState != null &&
        _addExpenseTabKey.currentState?.selectedCategory != null) {
      final expensePrice = _addExpenseTabKey.currentState!.priceController.text;
      final selectedExpenseCategory =
          _addExpenseTabKey.currentState!.selectedCategory;
      final expensePaymentMethod =
          _addExpenseTabKey.currentState!.selectedPaymentMethod;

      transaction = WorkspaceIdFinancePostRequest(
        (b) => b
          ..categoryId = selectedExpenseCategory!.categoryId
          ..amount = double.parse(expensePrice)
          ..transactionType = 'expense'
          ..description = ''
          ..transactionDate = selectedDate.toUtc()
          ..paymentMethod = expensePaymentMethod,
      );
      await ref
          .read(transactionStateProvider.notifier)
          .addTransaction(transaction: transaction);
    }

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isFormView: true,
      title: '수입 지출 추가',
      actions: [
        TextButton(
            onPressed: handleSubmit,
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.white),
            ))
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                tabs: const [
                  Tab(
                    text: '수입',
                  ),
                  Tab(
                    text: '지출',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  Center(
                    child: AddIncomeTab(
                      key: _addIncomeTabKey,
                      selectedDate: selectedDate,
                      handleChangeSelectDate: (value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                    ),
                  ),
                  Center(
                    child: AddExpenseTab(
                      key: _addExpenseTabKey,
                      selectedDate: selectedDate,
                      handleChangeSelectDate: (value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
