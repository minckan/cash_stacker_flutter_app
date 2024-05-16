import 'package:cash_stacker_flutter_app/common/const/color.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/home/screen/home_screen.dart';
import 'package:cash_stacker_flutter_app/ledger/screen/main_ledger_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/main_portfolio_screen.dart';
import 'package:cash_stacker_flutter_app/setting/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: PRIMARY_COLOR,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomAppBar(
          height: 60,
          color: Colors.white,
          notchMargin: 5,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TabIcon(icon: Icons.home, tab_number: 0),
              TabIcon(icon: Icons.attach_money, tab_number: 1),
              const SizedBox(width: 20),
              TabIcon(icon: Icons.real_estate_agent, tab_number: 2),
              TabIcon(icon: Icons.settings, tab_number: 3)
            ],
          ),
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomeScreen(),
          MainLedgerScreen(),
          MainPortfolioScreen(),
          SettingScreen(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  IconButton TabIcon({required IconData icon, required int tab_number}) {
    return IconButton(
      icon: Icon(
        icon,
        color: index == tab_number ? PRIMARY_COLOR : const Color(0xffa289f5),
      ),
      onPressed: () {
        controller.animateTo(tab_number);
      },
    );
  }
}
