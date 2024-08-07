import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

abstract class BudgetStatBase {}

class BudgetStatError extends BudgetStatBase {
  final String errorMessage;

  BudgetStatError({required this.errorMessage});
}

class BudgetStatLoading extends BudgetStatBase {}

class BudgetState extends BudgetStatBase {
  final List<Budget>? budgets;
  final GetActiveBudgetRes? activeBudget;

  double get expendablePercentage {
    final double? expendableBudgetPercentage =
        double.tryParse(activeBudget!.expendableBudget!.percentage.toString());

    final formattedZeroToOne = (expendableBudgetPercentage ?? 0) / 100;
    final checkAmtOverLimit = formattedZeroToOne > 1 ? 1.0 : formattedZeroToOne;
    return checkAmtOverLimit;
  }

  BudgetState({
    this.budgets,
    this.activeBudget,
  });
}
