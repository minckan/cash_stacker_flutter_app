import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/ledger/screen/ledger_screen.dart';
import 'package:flutter/material.dart';

class MainLedgerScreen extends StatelessWidget {
  const MainLedgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: '',
      child: LedgerScreen(),
    );
  }
}
