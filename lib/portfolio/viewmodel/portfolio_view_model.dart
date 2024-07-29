import 'package:cash_stacker_flutter_app/common/repository/portfolio.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final portfolioViewModelProvider =
    StateNotifierProvider<PortfoliosViewModel, Portfolio?>(
        (ref) => PortfoliosViewModel(ref));

class PortfoliosViewModel extends StateNotifier<Portfolio?> {
  final Ref _ref;

  PortfoliosViewModel(this._ref) : super(null);

  String? get workspaceId {
    return _ref.read(workspaceViewModelProvider)?.workspaceId;
  }

  loadPortfolio() async {
    if (workspaceId != null) {
      try {
        final portfolio = await _ref
            .read(portfolioRepositoryProvider)
            .getPortfolio(workspaceId!);

        state = portfolio.data;
      } catch (e) {
        logger.e(e);
      }
    }
  }
}
